import '../../icon_data/icon_data.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  DataIcon dataIcon = DataIcon();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Icon Application"),
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          itemCount: 28,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            ),
          itemBuilder: (context, index) {
            return IconButton(
            splashColor: Colors.blue,
            color: Colors.blue,
            iconSize: 40,
            onPressed: () {}, 
            icon: dataIcon.icon[index],
            );
          }
        )
      ),
    );
  }
}