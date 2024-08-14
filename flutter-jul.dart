import 'dart:io';

void main() {
  print("String");

  String name = "Ahmad";
  int age = 14;
  double hight = 180.5;
  bool isGirl = false;
  num avg = 454683.1456;

  final int x;
  x = 10;

  const int y = 10;

  String address = "Amman\nTlaa-Alai\nB No: 50";
  print(address);

  String adress2 = """Amman Tlaa-Ali No: 9 """;
  String adress3 = '''Amman 
Tlaa-Ali
No: 9
  ''';
  print(adress2);
  print(adress3);
  print("My Age is" + age.toString());
  print("My Age is $age");

  print(age + hight);

  int age2 = hight.toInt();
  double hight2 = age.toDouble();
  print(age2);
  print(hight2);

  String age3 = "18";
  print(age2 + int.parse(age3));

  String hight3 = "158.2";
  print(hight2 + double.parse(hight3));
  print(age2.runtimeType);

  //one line comment

  /* 
  Multi lines comment
   */

  print(hight3.isEmpty);
  print(hight3.isNotEmpty);
  print(hight3.length);

  String fullName = "Omar Ahmad";
  print(fullName.toLowerCase());
  print(fullName.toUpperCase());
  print(fullName.replaceAll(" ", "-"));

  print(
      "My name is = ${fullName.toUpperCase().replaceAll(" ", "-").split("-")} ");

  // Map , List ,if ,for, methods, classes

  // String? name2 = stdin.readLineSync(); //to input String
  // int? name2 = stdin.readByteSync(); //to input int

  int total = 50;
  int math = 25;
  int arabic = 25;

  if ((math + arabic) > total) {
    print("Approved");
  } else if ((math + arabic) < total) {
    print("Reject");
  } else {
    print("Equal");
  }
  print((math + arabic) > total ? "Approved?" : "Equal?");

  print((math + arabic) > total
      ? "Approved?"
      : (math + arabic) < total
          ? "Reject?"
          : "Equal?");

  if (!((math + arabic) > total)) {
    //false => true
    print("Approved");
  } else if (!((math + arabic) < total)) {
    print("Reject");
  } else {
    print("Equal");
  }

  bool isChecked = false;
  print(isChecked);
  isChecked = !isChecked;
  print(isChecked);

  int num1 = 1200;
  int num2 = 1500;
  int num3 = 150;

  List nums = [num1, num2, num3];
  int max = nums[0];
  for (int i = 1; i < nums.length; i++) {
    if (nums[i] > max) {
      max = nums[i];
    }
  }
  print("max $max");

  //num1 = 1700;
  nums[0] = 1700;

  nums.forEach((value) {
    if (value > max) {
      max = value;
    }
  });

  print("max $max");

  if (num1 > num2 && num1 > num3) {
    print("Num 1 is greater: i.e $num1");
  } else if (num2 > num1 && num2 > num3) {
    print("Num2 is greater: i.e $num2");
  } else {
    print("Num3 is greater: i.e $num3");
  }

  if (num1 > num2 || num1 > num3) {
    print("Num 1 is greater: i.e $num1");
  } else if (num2 > num1 || num2 > num3) {
    print("Num2 is greater: i.e $num2");
  } else {
    print("Num3 is greater: i.e $num3");
  }

  if (num1 > num2 && num1 > num3) {
    print("Num 1 is greater: i.e $num1");
  }
  if (num2 > num1 && num2 > num3) {
    print("Num2 is greater: i.e $num2");
  }
  if (num3 > num1 && num3 > num2) {
    print("Num3 is greater: i.e $num3");
  }

  int selection = 2;
  String output = (selection == 2) ? 'Apple' : 'Banana';

  if (selection == 2) {
    output = 'Apple';
  } else {
    output = 'Banana';
  }
  print(output);

  List list = [num1, num2, num3, "s", 10.2];
  print(list);

  List names = ["Ahmad", "Omar", "Ayman", "Ali", "Owny"];

  print(names[1]);
  print(names[3]);
  print(names[names.length - 1]);

  Map map = {
    'city': 'Amman',
    'age': 20,
    'age2': 20,
    'isMarried': false,
    'map': {
      'city': 'Amman',
      'age': 20,
      'age2': 20,
      'isMarried': true,
    },
  };

  print(map['city']);
  print(map['age']);

  int totalAges = map['age'] + map['age2'];
  print(totalAges);
  print(map['map']['isMarried']);

  print(calc(y: 20, x: 10));
  print(double.parse(calc(x: 20).toString()));

  User user = User(id: 50, name: "ALI");
  user.printData();
  print(user.name);
}

//type fName () {}

int calc({required int x, int y = 10}) {
  return x + y;
}

class User {
  int id = 10;
  String name = "Ahmad";

  User({required this.id, required this.name});

  void printData() {
    print(id);
    print(name);
  }
}
