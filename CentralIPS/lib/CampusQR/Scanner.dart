import 'dart:typed_data';

import 'package:centralips/Maps/get_departments/departments_list.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scanner extends StatelessWidget {
  Scanner({Key? key}) : super(key: key);

  MobileScannerController cameraController = MobileScannerController(
      detectionTimeoutMs: 700, detectionSpeed: DetectionSpeed.noDuplicates);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Campus'),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.grey,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
        // fit: BoxFit.contain,
        controller: cameraController,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            debugPrint('Encontrado! ${barcode.rawValue}');
            routeQR(barcode, context);
          }
        },
      ),
    );
  }

  routeQR(Barcode barcode, BuildContext context) {
    switch (barcode.rawValue) {
      case 'divisaoacademica':
        DepartmentsList m = DepartmentsList();
        m.getDepartment("DA", context);
        break;
      case 'clubedesportivo':
        DepartmentsList m = DepartmentsList();
        m.getDepartment("CD", context);
        break;
      case 'ipstartup':
        DepartmentsList m = DepartmentsList();
        m.getDepartment("IPSUP", context);
        break;
      case 'gaal':
        DepartmentsList m = DepartmentsList();
        m.getDepartment("GAAL", context);
        break;
      case 'cim':
        DepartmentsList m = DepartmentsList();
        m.getDepartment("CIM", context);
        break;

      default:
        break;
    }
  }
}
