// Student: Asif Kamal Ahmed Abdalla
// Reg no: 266172024
const String regNo = '266172024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by AKA
String formatRwf(int amount) {
  // by AKA
  bool isNegative = amount < 0;
  String digits = amount.abs().toString();
  String formatted = '';

  while (digits.length > 3) {
    formatted = ',${digits.substring(digits.length - 3)}$formatted';
    digits = digits.substring(0, digits.length - 3);
  }

  formatted = '$digits$formatted';

  if (isNegative) {
    formatted = '-$formatted';
  }

  return '$formatted RWF';
}

// by AKA
int momoFee(int amount) {
  // by AKA
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

// by AKA
bool isValidPin(String pin) {
  // by AKA
  if (pin.length != 5 || pin == '12345') {
    return false;
  }

  int i = 0;
  bool allSame = true;

  while (i < pin.length) {
    if (pin[i].compareTo('0') < 0 || pin[i].compareTo('9') > 0) {
      return false;
    }

    if (pin[i] != pin[0]) {
      allSame = false;
    }

    i++;
  }

  return !allSame;
}

// by AKA
int sendMoney(int balance, int amount) {
  // by AKA
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// by AKA
int buyAirtime(int balance, int amount) {
  // by AKA
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Airtime ${formatRwf(amount)} purchased. '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// by AKA
void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // PIN tests required by the assignment
  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  // Starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // Send money three times
  int amount = (d + 1) * 3000;

  int i = 1;
  while (i <= 3) {
    balance = sendMoney(balance, amount);
    i++;
  }

  // Buy airtime
  balance = buyAirtime(balance, 1000);

  // Invalid transaction
  balance = sendMoney(balance, 0);

  // Large transaction
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  // Additional formatRwf tests:
  print(formatRwf(0)); // Expected: 0 RWF
  print(formatRwf(999)); // Expected: 999 RWF
  print(formatRwf(1000)); // Expected: 1,000 RWF
  print(formatRwf(1250000)); // Expected: 1,250,000 RWF
  print(formatRwf(-5000)); // Expected: -5,000 RWF

  // Additional isValidPin tests:
  print(isValidPin('24680')); // Expected: true
  print(isValidPin('11111')); // Expected: false
  print(isValidPin('12a45')); // Expected: false
}
