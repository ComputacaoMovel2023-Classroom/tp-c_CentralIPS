import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxTheme extends StatefulWidget {
  const CheckBoxTheme({super.key});

  @override
  State<CheckBoxTheme> createState() => CheckBoxThemeState();
}

class CheckBoxThemeState extends State<CheckBoxTheme> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    return Checkbox(
      checkColor: Colors.white,
      activeColor: const Color.fromRGBO(85, 56, 236, 100),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}