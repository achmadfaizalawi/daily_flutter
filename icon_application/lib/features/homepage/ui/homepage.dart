import '../../icon_data/icon_data.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final DataIcon dataIcon = DataIcon();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Icon Application"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
          child: GridView.builder(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            itemCount: 28,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue
                  ),
                child: IconButton(
                  iconSize: 40,
                  color: Colors.white,
                  onPressed: (){},
                  icon: dataIcon.icon[index]),
              );
            }
          ),
        )
      ),
    );
  }
}