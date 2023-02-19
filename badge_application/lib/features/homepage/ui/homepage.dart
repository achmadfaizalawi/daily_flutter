import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as Badges;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int valueShow = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text("Badge Notifications"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Badges.Badge(
              badgeStyle: const Badges.BadgeStyle(
                badgeColor: Colors.red, 
                padding: EdgeInsets.all(12),
                shape: Badges.BadgeShape.instagram),
              badgeAnimation: const Badges.BadgeAnimation.fade(),
              badgeContent: Text(
                "$valueShow", 
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white
                  )
              ),
              child: ElevatedButton.icon(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(20))
                ),
                onPressed: (){
                  setState(() {
                    valueShow = valueShow + 1;
                  });
                }, 
                icon: const Icon(Icons.notification_add), 
                label: const Text(
                  "Add Notifications", 
                style: TextStyle(fontSize: 20),)
              ),
            )
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10))
                ),
              onPressed: (){
                setState(() {
                  valueShow = valueShow - 1;
                  if(valueShow < 0){
                    valueShow = 0;
                  }
                });
              }, 
              icon: const Icon(Icons.notifications_off), 
              label: const Text(
                "Delete Notifications", 
              style: TextStyle(fontSize: 20))
            ),
          )
        ],
      ),
    );
  }
}