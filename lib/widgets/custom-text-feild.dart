import 'package:flutter/material.dart';

class EnhancedTextFormField extends StatefulWidget {
  final String name;
  final TextEditingController controller;
  final bool isPassword;

  const EnhancedTextFormField({
    super.key,
    required this.name,
    required this.controller,
    this.isPassword = false, // Default to false for non-password fields
  });

  @override
  EnhancedTextFormFieldState createState() => EnhancedTextFormFieldState();
}

class EnhancedTextFormFieldState extends State<EnhancedTextFormField> {
  bool isObscure = true;
  bool isvalid = false;
  bool isvisable = false; // if somthing has been written inside the text field

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? isObscure : false,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.name,
        icon: widget.controller.text.isEmpty
            ? null
            : isvalid
                ? const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.check,
                      size: 20,
                      color: Colors.green,
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent.shade700,
            strokeAlign: 100,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (value) {
        isvisable = true;
        if ((widget.isPassword && isPassword(value)) ||
            (widget.name == "email" && isEmail(value)) ||
            (widget.name == "full name" && isName(value)) ||
            (widget.name == "age" && isAge(value))) {
          isvalid = true;
        } else {
          isvalid = false;
        }
        setState(() {});
      },
      validator: (value) {
        /* if (value!.isEmpty) {
          return "Please enter your ${widget.name}";
        } else if ((widget.name == "email" && !isEmail(value)) ||
            (widget.name == "password" && !isPassword(value)) ||
            (widget.name == "age" && !isAge(value)) ||
            (widget.name == "full name" && !isName(value))) {
          if (widget.isPassword) {
            return "password must contain at least one small and capital letters, one digit, and one special character";
          }
          return "Please enter a valid ${widget.name}";
        } else {
          return null;
        } */

        if (value!.isEmpty) {
          return "Please enter your ${widget.name}";
        }

        switch (widget.name) {
          case "email":
            if (!isEmail(value)) {
              return "Please enter a valid email";
            }
            break;
          case "password":
            if (!isPassword(value)) {
              return "Password must contain at least one small and capital letter, one digit, and one special character";
            }
            break;
          case "age":
            if (!isAge(value)) {
              return "Please enter a valid age";
            }
            break;
          case "full name":
            if (!isName(value)) {
              return "Please enter a valid full name";
            }
            break;
          default:
            return "Please enter a valid ${widget.name}";
        }

        return null;
      },
    );
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  bool isPassword(String password) {
    if (password.length <= 8) {
      return false;
    }
    RegExp digitRegExp = RegExp(r'\d'); // checks for at least one digit
    RegExp specialCharRegExp = RegExp(
        r'[!@#$%^&*(),.?":{}|<>]'); // checks for at least one special character
    RegExp uppercaseRegExp =
        RegExp(r'[A-Z]'); // checks for at least one uppercase letter
    RegExp lowercaseRegExp =
        RegExp(r'[a-z]'); // checks for at least one lowercase letter

    if (!digitRegExp.hasMatch(password)) {
      return false;
    }
    if (!specialCharRegExp.hasMatch(password)) {
      return false;
    }
    if (!uppercaseRegExp.hasMatch(password)) {
      return false;
    }
    if (!lowercaseRegExp.hasMatch(password)) {
      return false;
    }

    return true;
  }

  bool isName(String name) {
    final validNamePattern = RegExp(r'^[a-zA-Z\s]+$');
    return name.isNotEmpty && validNamePattern.hasMatch(name);
  }

  bool isAge(String ageInput) {
    try {
      int age = int.parse(ageInput);
      return age >= 0 && age <= 120; // Valid age range: 0 to 120
    } catch (e) {
      return false; // If input can't be parsed into a number, it's not valid
    }
  }
}
