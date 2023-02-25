import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarcodeContainer extends StatelessWidget {
  final String data;
  final double width;
  final double height;

  const BarcodeContainer({
    super.key,
    required this.data,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue)
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      child: BarcodeWidget(
        style: const TextStyle(
          fontSize: 18,
        ),
        barcode: Barcode.code128(),
        data: data, 
        width: width,
        height: height,
      )
    );
  }
}