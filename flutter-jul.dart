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
}
