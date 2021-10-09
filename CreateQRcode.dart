import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class QRCreatePage extends StatefulWidget {
  @override
  _QRCreatePageState createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      //backgroundColor: Hexcolor('#242d59'),
      title: Text('Create Your QR code'),
    ),
    body: Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarcodeWidget(
              barcode: Barcode.qrCode(),
              color: Colors.black,
              data: controller.text ?? 'Hello world',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 70),
            Row(
              children: [

                Expanded(child: buildTextField(context)),
                const SizedBox(width: 12),
                FloatingActionButton(
                  backgroundColor: Colors.green[800],
                  child: Icon(Icons.done, size: 30),
                  onPressed: () => setState(() {}),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );

  Widget buildTextField(BuildContext context) => TextField(
    controller: controller,
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      hintText: 'Enter the data',
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
       // borderSide: BorderSide(color:  Hexcolor('#242d59')),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.green[800],
        ),
      ),
    ),
  );
}