import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _GenerateQrCodeState();

}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate QR code"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if(urlController.text.isNotEmpty)
                QrImageView(data: urlController.text , size: 200,),
              SizedBox(height: 40,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: urlController,
                    decoration: InputDecoration(
                      hintText: "Enter your data",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: (){
                setState(() {

                });
              }, child: Text("Geneerate"))
            ],
          )
        ),
      ),
    );
  }
}