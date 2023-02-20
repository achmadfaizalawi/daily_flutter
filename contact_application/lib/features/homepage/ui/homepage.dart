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
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: contact.data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(4),
                child: SizedBox(
                  height: 80,
                  width: 50,
                  child: ElevatedButton(    
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(left: 5),
                      backgroundColor: Colors.blue[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),           
                    ),
                    onPressed: (){},
                    child: ListTile(
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
                        fontSize: 16),
                      ),
                    ),
                  ),
                ),
              );
            }),
        ) 
        )
    );
  }
}