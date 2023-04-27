import 'package:flutter/material.dart';

class NoticiasListaItem extends StatelessWidget {
  const NoticiasListaItem({
    super.key,
    required this.assetName,
  });

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        child: Image.asset(
          assetName,
          fit: BoxFit.fitHeight,
        ));
  }
}
