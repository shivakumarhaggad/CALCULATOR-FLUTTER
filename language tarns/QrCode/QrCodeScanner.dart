import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
class ScanQrCode extends StatefulWidget {
  const ScanQrCode({Key? key}) : super(key: key);

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrResult = "Scanned OR will be displayed here";
  Future<void> scanqr()async{
    try{
      final qrcode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true,ScanMode.BARCODE);
      if(!mounted)return;
      setState(() {
        this.qrResult = qrcode.toString();
      });
    }on PlatformException{
      qrResult = 'Fail to read QR code';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR code Scanner"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text(qrResult, style: TextStyle(color: Colors.black12 ),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: scanqr, child: Text("Scan OR code"))
          ],
        ),
      ),
    );
  }
}