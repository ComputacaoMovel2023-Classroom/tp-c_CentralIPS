import 'package:centralips/Bibliographic%20Research/checkBoxTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  final String title;
  List<String> options = List.empty();

  FilterWidget({Key? key, required this.title, required this.options})
      : super(key: key);

  @override
  State<FilterWidget> createState() => FilterWidgetState();
}

class FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return generateOptions(widget.title, widget.options);
  }

  Column generateOptions(String title, List<String> options) {
    List<Widget> listOfOptions = [];

    for (String option in options) {
      listOfOptions.add(
        Row(
          children: [
            Expanded(
              child: Text(
                option,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(child: const CheckBoxTheme())
          ],
        ),
      );
    }

    Column toReturn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.start,
        ),
        Column(
          children: listOfOptions,
        )
      ],
    );

    return toReturn;
  }
}
