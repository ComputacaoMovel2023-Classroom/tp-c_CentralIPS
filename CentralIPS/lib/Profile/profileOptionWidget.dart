
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/**
 * Widget que é uma opção de perfil
 */
class ProfileOptionWidget extends StatefulWidget {
  final String option;
  String value;
  bool editable;
  bool isDate;
  TextInputType textInputType;
  String? Function(String?)? validator;
  TextEditingController controller;

  ProfileOptionWidget(
      {Key? key,
      required this.option,
      required this.value,
      required this.editable,
      required this.validator,
      required this.controller,
      this.textInputType = TextInputType.text,
      this.isDate = false})
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
                  child: !widget.isDate
                      ? TextFormField(
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom +
                                  100),
                          keyboardType: widget.textInputType,
                          validator: widget.validator,
                          enabled: widget.editable,
                          controller: widget.controller,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 45, 161, 255)),
                            ),
                            border: InputBorder.none,
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                            hintText: widget.value,
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        )
                      : GestureDetector(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null) {
                              // Format the date to show only the date part
                              final formattedDate =
                                  DateFormat('yyyy-MM-dd').format(picked);
                              widget.controller.text = formattedDate;
                            }
                          },
                          child: AbsorbPointer(
                            child: TextField(
                              enabled: widget.editable,
                              textAlign: TextAlign.center,
                              controller: widget.controller,
                              keyboardType: TextInputType.datetime,
                              style: const TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 45, 161, 255)),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.only(top: 6, left: 10),
                                  hintText: widget.value,
                                  hintStyle: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w900)),
                            ),
                          ),
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
