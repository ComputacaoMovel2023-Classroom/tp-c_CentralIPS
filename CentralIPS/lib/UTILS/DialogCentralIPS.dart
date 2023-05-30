import 'package:flutter/material.dart';

class CentralIPSDialog extends StatelessWidget {
  CentralIPSDialog(this.header, this.assetPath, {super.key});
  String header;
  String assetPath;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            Image.asset(
              assetPath,
              height: 80,
            ),
            Text(
              header,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                      Colors.white, //change background color of button
                  backgroundColor: Colors.black, //change text color of button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 5.0,
                ),
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
