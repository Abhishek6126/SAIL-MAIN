import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sail_test/core/app_export.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  void _scanQRCode(BuildContext context) async {
    final qrCodeKey = GlobalKey(debugLabel: 'QR');

    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => QRViewExample(
          qrCodeKey: qrCodeKey,
        ),
      ),
    );

    // Handle the scanned data
    if (result != null) {
      print('Scanned QR code: $result');
      // Do something with the scanned QR code
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: ColorConstant.gray10001,
        // body:
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background2.png', // Replace with your actual image path
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.maxFinite,
              padding: getPadding(
                left: 13,
                top: 44,
                right: 13,
                bottom: 44,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: getPadding(
                      left: 18,
                      top: 4,
                      right: 18,
                      bottom: 4,
                    ),
                    decoration: AppDecoration.outlineBlack9003f.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder32,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: getHorizontalSize(
                            154,
                          ),
                          margin: getMargin(
                            left: 5,
                            top: 2,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "QR\n",
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      32,
                                    ),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: "SCANNER",
                                  style: TextStyle(
                                    color: ColorConstant.blue50001,
                                    fontSize: getFontSize(
                                      32,
                                    ),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgQrcode2,
                            height: getVerticalSize(
                              95,
                            ),
                            width: getHorizontalSize(
                              81,
                            ),
                            radius: BorderRadius.circular(
                              getHorizontalSize(
                                22,
                              ),
                            ),
                            margin: getMargin(
                              top: 5,
                              bottom: 6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _scanQRCode(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(getHorizontalSize(40)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: -20,
                            blurRadius: 7,
                            offset: Offset(32, 35), // Modify this line
                          ),
                        ],
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgQrscan1,
                        height: getVerticalSize(327),
                        width: getHorizontalSize(267),
                        radius: BorderRadius.circular(getHorizontalSize(40)),
                        margin: getMargin(top: 72),
                      ),
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      287,
                    ),
                    margin: getMargin(
                      left: 23,
                      top: 49,
                      right: 24,
                      bottom: 5,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Click ",
                            style: TextStyle(
                              color: ColorConstant.indigo500,
                              fontSize: getFontSize(
                                32,
                              ),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: "above image to scan ",
                            style: TextStyle(
                              color: ColorConstant.gray800,
                              fontSize: getFontSize(
                                32,
                              ),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: "QR",
                            style: TextStyle(
                              color: ColorConstant.indigo500,
                              fontSize: getFontSize(
                                32,
                              ),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QRViewExample extends StatefulWidget {
  final GlobalKey qrCodeKey;

  const QRViewExample({required this.qrCodeKey});

  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: widget.qrCodeKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      if (scanData.code!.isNotEmpty) {
        // Pass the scanned data back to the previous screen
        Navigator.pop(context, scanData.code);
      }
    });
  }
}
