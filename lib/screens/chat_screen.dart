import 'package:flutter/material.dart';
import '../models/contact.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Contact contact =
        ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Chat with ${contact.name}'),
      ),
    );
  }
}
