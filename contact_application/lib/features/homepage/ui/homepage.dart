import 'package:contact_application/features/data_contact/data_contact.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  ContactData contact = ContactData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Contact Application"),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView.builder(
                itemCount: contact.getUsernameContactData().length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      maxRadius: 25,
                      child: Text(contact.getUsernameContactData()[index][0].toString().toUpperCase(), 
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white),
                      ),
                    ),
                    title: Text(contact.getUsernameContactData()[index],
                    style: const TextStyle(
                      fontSize: 18),
                    ),
                    subtitle: Text(contact.getPhoneContactData()[index],
                    style: const TextStyle(
                      fontSize: 15),
                    ),
                  );
                })
            ],
          ),
        ) 
        )
    );
  }
}