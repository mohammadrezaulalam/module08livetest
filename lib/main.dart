import 'package:flutter/material.dart';

void main() {
  runApp(ContactListApp());
}

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}

class ContactListApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'Khalid Ahmad',
      email: 'khalid_ahmad123@gmail.com',
      phoneNumber: '01950321456',
    ),
    Contact(
      name: 'Arman Akter Sadi',
      email: 'armanakter@gmail.com',
      phoneNumber: '01792632514',
    ),
    Contact(
      name: 'Mihal Kaykobad',
      email: 'mihal.kaykobad@live.com',
      phoneNumber: '01592367841',
    ),
  ];

  ContactListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListScreen(contacts: contacts),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts;

  const ContactListScreen({super.key, required this.contacts});

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Contact Details",
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text('Name: ${contact.name}', style: const TextStyle(fontSize: 18.0),),
              const SizedBox(height: 8.0),
              Text('Email: ${contact.email}', style: const TextStyle(fontSize: 18.0),),
              const SizedBox(height: 8.0),
              Text('Phone: ${contact.phoneNumber}', style: const TextStyle(fontSize: 18.0),),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact List'), centerTitle: true,),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(contacts[index].name),
            onTap: () {
              _showContactDetails(context, contacts[index]);
            },
          );
        },
      ),
    );
  }
}
