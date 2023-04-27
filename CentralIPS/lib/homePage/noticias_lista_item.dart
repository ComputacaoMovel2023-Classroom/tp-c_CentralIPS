import 'package:flutter/material.dart';

class NoticiasListaItem extends StatelessWidget {
  const NoticiasListaItem({
    super.key,
    required this.assetName,
    required this.titletext,
  });

  final String assetName;
  final String titletext;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        child: Image.asset(
          assetName,
          height: 150,
          fit: BoxFit.fitHeight,
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(left: 16, top: 175),
          child: Text(titletext,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black,
              )))
    ]);
  }
}
