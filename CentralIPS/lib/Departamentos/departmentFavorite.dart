import 'package:flutter/material.dart';

class DepartmentFavorite extends StatelessWidget {
  bool greyColor = false;
  double size = 0;

  DepartmentFavorite(this.greyColor, this.size, {super.key});

  void changeGreyColor() {
    greyColor = !greyColor;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Icon(Icons.favorite,
          color: greyColor ? Colors.grey : Colors.red[300]),
    );
  }
}
