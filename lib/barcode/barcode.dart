import 'dart:async';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CameraBarcode {
  Future<String> scan() async {
    try {
      ScanMode scanMode = ScanMode.DEFAULT;
      var barcode = await FlutterBarcodeScanner.scanBarcode(
          '#f67676', 'Cancela', true, scanMode);
      print(barcode);
      return barcode;
    } on Exception catch (e) {
      print(e);
      return 'null';
    }
  }
}
