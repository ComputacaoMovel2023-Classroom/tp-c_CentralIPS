import 'package:centralips/Bibliographic%20Research/checkBoxTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Widget que é uma opção de perfil
 */
class ProfileOptionWidget extends StatefulWidget {
  final String option;
  String value;

  ProfileOptionWidget({Key? key, required this.option, required this.value})
      : super(key: key);

  @override
  State<ProfileOptionWidget> createState() => ProfileOptionWidgetState();
}

class ProfileOptionWidgetState extends State<ProfileOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Container(
                  width: 120,
                  child: Text(
                    widget.option,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                Container(
                  height: 30,
                  child: const VerticalDivider(
                    color: Colors.black,
                    thickness: 1.5,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
          ),
        ],
      ),
    );
  }
}
