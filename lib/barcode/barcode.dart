import 'dart:async';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CameraBarcode {
  Future<String> scan() async {
    try {
      ScanMode scanMode = ScanMode.BARCODE;
      var barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ffffff',
        'Cancela',
        true,
        scanMode,
      );
      print(barcode);
      return barcode;
    } on Exception catch (e) {
      print(e);
      return 'null';
    }
  }
}
