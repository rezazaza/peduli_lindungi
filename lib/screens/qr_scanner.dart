import 'dart:developer';

import 'package:clone_peduli_lindungi/helper/constants.dart';
import 'package:clone_peduli_lindungi/shared/togle_button.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  Barcode? result;
  String? data;
  QRViewController? controller;
  int _toggleValue = 0;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height * 0.2,
        maxHeight: MediaQuery.of(context).size.height * 0.2,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        body: Stack(alignment: Alignment.bottomCenter, children: [
          _buildQrView(context),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Place QR Code inside this square',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'The use of QR Code',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
        panel: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.r)),
              height: 10.h,
              width: 80.w,
            ),
            Text(
              'Check-in Settings',
              style: TextStyle(
                  color: primaryBlack,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(
              height: 2,
              color: Colors.grey,
            ),
            AnimatedToggle(
              values: const ['Just me', 'Group'],
              onToggleCallback: (value) {
                setState(() {
                  _toggleValue = value;
                });
                log('Toggle Value : $_toggleValue');
              },
              buttonColor: Colors.white,
              backgroundColor: Colors.grey.shade200,
              textColor: primaryBlack,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15),
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.white,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea),
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
    );

    // Text(
    //   'Place QR Code inside this square',
    //   style: TextStyle(color: Colors.white, fontSize: 20.sp),
    // )
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      controller.stopCamera();
      result = scanData;
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Need Permission')),
      );
    }
  }
}
