// Student: Asif Kamal Ahmed Abdalla
// Reg no: 266172024
const String regNo = '266172024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by AKA
int countVowels(String text) {
  int count = 0;
  int i = 0;

  text = text.toLowerCase();

  while (i < text.length) {
    if ('aeiou'.contains(text[i])) {
      count++;
    }
    i++;
  }

  return count;
}

// by AKA
String initials(String fullName) {
  fullName = fullName.trim();

  if (fullName.isEmpty) {
    return '';
  }

  List<String> names = fullName.split(' ');
  String result = '';
  int i = 0;

  while (i < names.length) {
    if (names[i].isNotEmpty) {
      result += '${names[i][0].toUpperCase()}.';
    }
    i++;
  }

  return result;
}

// by AKA
void drawTriangle(int height) {
  int row = 1;

  while (row <= height) {
    String line = '';
    int spaces = height - row;

    while (spaces > 0) {
      line += ' ';
      spaces--;
    }

    int count = 0;

    while (count < row) {
      if (row % 2 == 0) {
        line += '#';
      } else {
        line += '*';
      }
      count++;
    }

    print(line);
    row++;
  }
}

// by AKA
int momoFee(int amount) {
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
String maskPhone(String phone) {
  if (phone.length != 10) {
    return 'INVALID';
  }

  return '${phone.substring(0, 3)}'
      '${'*' * 5}'
      '${phone.substring(8)}';
}

// by AKA
void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // B2
  String fullName = 'Asif Kamal Ahmed Abdalla';
  print('$fullName has ${countVowels(fullName)} vowels');

  // B3
  print(initials('Yves Himbaza Mugiraneza'));
  print(initials(' ana uwase '));
  print(initials(' '));

  // C5
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2
  int i = 1;
  int totalFees = 0;
  String phone = '0788123456';

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    totalFees += fee;

    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');

    i++;
  }

  print('Total fees: $totalFees RWF');
}
