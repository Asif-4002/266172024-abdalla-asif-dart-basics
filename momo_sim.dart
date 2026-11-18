// Student: Asif Kamal Ahmed Abdalla
// Personal assignment values: D = 7, T = 17
// The full registration number is intentionally not included in this source file.

const int d = 7;
const int t = 17;

// by AKA
String formatRwf(int amount) {
  final negative = amount < 0;
  final digits = amount.abs().toString();
  final buffer = StringBuffer();
  int i = 0;
  while (i < digits.length) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      buffer.write(',');
    }
    buffer.write(digits[i]);
    i++;
  }
  return '${negative ? '-' : ''}${buffer.toString()} RWF';
}

// by AKA
bool isValidPin(String pin) {
  if (pin.length != 5) return false;

  int i = 0;
  while (i < pin.length) {
    if (int.tryParse(pin[i]) == null) return false;
    i++;
  }

  // Reject a PIN made from the same digit repeated five times.
  bool allSame = true;
  i = 1;
  while (i < pin.length) {
    if (pin[i] != pin[0]) {
      allSame = false;
      break;
    }
    i++;
  }
  return !allSame;
}

// by AKA
int sendMoney(int balance, int amount) {
  const int fee = 250;
  if (amount <= 0) {
    print('Failed: invalid amount');
    return balance;
  }
  if (balance < amount + fee) {
    print('Failed: insufficient balance');
    return balance;
  }
  final newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// by AKA
int buyAirtime(int balance, int amount) {
  if (amount <= 0) {
    print('Failed: invalid amount');
    return balance;
  }
  if (balance < amount) {
    print('Failed: insufficient balance');
    return balance;
  }
  final newBalance = balance - amount;
  print('Airtime ${formatRwf(amount)} purchased. '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  print('Personal values: D = $d | T = $t');

  print(isValidPin('12a45'));
  print(isValidPin('1234'));
  print(isValidPin('123456'));
  print(isValidPin('11111'));
  print(isValidPin('12345'));

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  final transferAmount = (d + 1) * 3000;
  balance = sendMoney(balance, transferAmount);
  balance = sendMoney(balance, transferAmount);
  balance = sendMoney(balance, transferAmount);

  balance = buyAirtime(balance, 1000);
  balance = buyAirtime(balance, 0);
  balance = buyAirtime(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print(formatRwf(0));
  print(formatRwf(999));
  print(formatRwf(1000));
  print(formatRwf(1250000));
  print(formatRwf(-5000));

  print(isValidPin('12345'));
  print(isValidPin('1234a'));
  print(isValidPin('77777'));
}
