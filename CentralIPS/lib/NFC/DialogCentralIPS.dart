import 'package:flutter/material.dart';

class CentralIPSDialog extends StatelessWidget {
  CentralIPSDialog(this.header, this.assetPath, {super.key});
  String header;
  String assetPath;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            Image.asset(
              assetPath,
              height: 50,
            ),
            Text(
              header,
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Fechar"))
          ],
        ),
      ),
    );
  }
}
