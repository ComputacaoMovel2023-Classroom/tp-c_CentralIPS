import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scanner extends StatelessWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus QR')),
      body: MobileScanner(
        fit: BoxFit.contain,
        controller: MobileScannerController(
          // facing: CameraFacing.back,
          // torchEnabled: false,
          returnImage: true,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            debugPrint('QR ENCONTRADO! ${barcode.rawValue}');
          }
          if (image != null) {
            showDialog(
              context: context,
              builder: (context) => Image(image: MemoryImage(image)),
            );
            Future.delayed(const Duration(seconds: 5), () {
              Navigator.pop(context);
            });
          }
        },
      ),
    );
  }
}
