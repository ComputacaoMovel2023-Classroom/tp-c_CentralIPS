import 'package:centralips/Departamentos/department.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DepartmentFavorite extends StatefulWidget {
  Department department;
  double size = 26;

  DepartmentFavorite(this.department, this.size, {super.key});

  @override
  State<DepartmentFavorite> createState() => DepartmentFavoriteState();
}

class DepartmentFavoriteState extends State<DepartmentFavorite> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool greyColor = true;

  @override
  void initState() {
    super.initState();
    final user = auth.currentUser;
    greyColor = !widget.inicialState;
  }

  void inputData() {
    final user = auth.currentUser;

    if (widget.department.usersId.contains(user!.uid)) {
      widget.department.usersId.remove(user.uid);
    } else {
      widget.department.usersId.add(user.uid);
    }

    DatabaseReference vlRef =
        FirebaseDatabase.instance.ref().child("Departamentos");
    vlRef
        .child(widget.department.id)
        .update({'usersId': widget.department.usersId});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: IconButton(
        padding: const EdgeInsets.all(0),
        iconSize: widget.size,
        icon: Icon(Icons.favorite,
            color: greyColor ? Colors.grey : Colors.red[300]),
        onPressed: () {
          inputData();
          setState(() {
            greyColor = !greyColor;
          });
        },
      ),
    );
  }
}
