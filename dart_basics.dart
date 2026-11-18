// Student: Asif Kamal Ahmed Abdalla
// Personal assignment values: D = 7, T = 17
// The full registration number is intentionally not included in this source file.

import 'dart:io';

const int d = 7;
const int t = 17;

// by AKA
int countVowels(String text) {
  text = text.toLowerCase();
  int count = 0;
  int i = 0;
  while (i < text.length) {
    if ('aeiou'.contains(text[i])) {
      count++;
    }
    i++;
  }
  return count;
}

// by AKA
String getInitials(String fullName) {
  final parts = fullName.trim().split(RegExp(r'\s+'));
  final initials = <String>[];
  int i = 0;
  while (i < parts.length) {
    if (parts[i].isNotEmpty) {
      initials.add(parts[i][0].toUpperCase());
    }
    i++;
  }
  return '${initials.join('.')}.';
}

// by AKA
void continueAndBreakDemo() {
  int i = 0;
  while (i < 6) {
    if (i == 2) {
      i++;
      continue;
    }
    if (i == 4) {
      break;
    }
    print(i);
    i++;
  }
}

// by AKA
void switchDemo() {
  int day = 2;
  switch (day) {
    case 1:
    case 2:
      print('Early week');
    case 3:
      print('Midweek');
    default:
      print('Weekend soon');
  }

  day = 1;
  print('After changing day to 1:');
  switch (day) {
    case 1:
    case 2:
      print('Early week');
    case 3:
      print('Midweek');
    default:
      print('Weekend soon');
  }
}

// by AKA
void nullAwareAndDoWhileDemo() {
  int? bonus;
  print(bonus ?? 50);
  bonus ??= 70;
  bonus ??= 90;
  print(bonus);

  int n = 10;
  do {
    print(n);
    n += 3;
  } while (n < 10);
}

// by AKA
void personalWhileLoop() {
  int x = d;
  String result = '';
  while (x > 0) {
    if (x.isEven) {
      result += 'E';
    } else {
      result += 'O';
    }
    x -= 3;
  }
  print(result);
  print(result.length);
  print(result[0]);
}

// by AKA
void drawTriangle(int height) {
  if (height <= 0) return;

  int row = 1;
  while (row <= height) {
    int spaces = height - row;
    while (spaces > 0) {
      stdout.write(' ');
      spaces--;
    }

    int symbols = row;
    final symbol = row.isOdd ? '*' : '#';
    while (symbols > 0) {
      stdout.write(symbol);
      symbols--;
    }
    stdout.writeln();
    row++;
  }
}

// by AKA
int count = 1;

// by AKA
void bump() {
  int count = 10;
  count++;
}

// by AKA
void doubleIt(int value) {
  value = value * 2;
}

// by AKA
int addVat(int price, {int rate = 18}) {
  return price + price * rate ~/ 100;
}

// by AKA
int momoFee(int amount) {
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by AKA
String maskPhone(String phone) {
  if (phone.length < 5) return phone;
  return '${phone.substring(0, 3)}*****${phone.substring(phone.length - 2)}';
}

// by AKA
void printMomoReceipts() {
  int totalFees = 0;
  int i = 1;
  while (i <= 7) {
    final amount = i * 4000 + t * 100;
    final fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone('078123456')}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}

void main() {
  print('A1 — Variables and Operators');
  const int a = 17;
  const int b = 5;
  print(a / b);
  print(a ~/ b);
  print(a % b);
  print(-a % b);
  print(-a ~/ b);
  print(-17.abs());
  print(0.1 + 0.2 == 0.3);
  print(10 == 10.0);

  print('\nA2 — Personal Variables');
  final int x = d;
  final int y = t;
  var z = x * 2 + y ~/ 4;
  z += x;
  print(z);
  print(z.isEven);
  print('$z' + '$x');

  print('\nB1 — Strings');
  String city = 'Kigali';
  print(city.length);
  print(city[city.length - 1]);
  print(city.substring(2, 4));
  print(city.toUpperCase().indexOf('A'));
  print(city.contains('k'));
  print('$city.length');
  print('${city.length}');
  print('$city$city');
  city.toUpperCase();
  print(city);
  print(city.replaceAll('i', '!'));
  print('5' + 5.toString());
  print(int.parse('5') + 5);

  print('\nB2 — Counting Vowels');
  const fullName = 'Asif Kamal Ahmed Abdalla';
  print('$fullName has ${countVowels(fullName)} vowels');

  print('\nB3 — Extracting Initials');
  print(getInitials('   Youssef   Hassan   Mohamed   '));
  print(getInitials('   Asif   University   '));

  print('\nC1 — Continue and Break');
  continueAndBreakDemo();

  print('\nC2 — Switch Statement');
  switchDemo();

  print('\nC3 — Null-Aware Operators and Do-While');
  nullAwareAndDoWhileDemo();

  print('\nC4 — Personal While Loop');
  personalWhileLoop();

  print('\nC5 — Right-Aligned Triangle');
  drawTriangle(d + 3);

  print('\nD1 — Functions');
  bump();
  print(count);
  int v = 5;
  doubleIt(v);
  print(v);
  print(addVat(1000));
  print(addVat(999));
  print(addVat(1000, rate: 0));

  print('\nD2 — MoMo Receipt Printer');
  printMomoReceipts();
}
