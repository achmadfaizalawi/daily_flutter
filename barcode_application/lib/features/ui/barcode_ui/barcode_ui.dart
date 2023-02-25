import 'package:flutter/material.dart';
import '../barcode_build/barcode_build.dart';

class MyBarcodeApp extends StatelessWidget {
  const MyBarcodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Barcode"),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                Padding(padding: EdgeInsets.all(20)),
                BarcodeContainer(
                  data: "Alterra Academy",
                  width: 300,
                  height: 140
                  ),
                BarcodeContainer(
                  data: "Flutter Asik",
                  width: 300,
                  height: 140
                  ),
                BarcodeContainer(
                  data: "Achmad Faiz Alawi",
                  width: 300,
                  height: 140
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}