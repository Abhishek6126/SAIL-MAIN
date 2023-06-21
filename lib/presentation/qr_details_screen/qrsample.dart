import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(const QrCodeScreen());

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  QrCodeScreenState createState() => QrCodeScreenState();
}


class QrCodeScreenState extends State<QrCodeScreen> {
  String _scanBarcode = '';

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: const Text('Barcode and QR code scan')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    OutlinedButton(
                        onPressed: () => scanQR(),
                        child: const Text('Start QR scan')),
                    Text('Scan result : $_scanBarcode\n',
                        style: const TextStyle(fontSize: 20))
                  ]
              ),
            ),
        ),
    );
  }
}