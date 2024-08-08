// screens/chat_screen.dart
import 'package:flutter/material.dart';
import '../models/contact.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Contact contact = ModalRoute.of(context)!.settings.arguments
        as Contact; // ຮັບຄວາມສຳພັນຈາກ arguments ໃນ Route

    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name), // ສະແດງຊື່ຂອງຜູ້ຕິດຕໍ່ໃນຫົວຂໍ້
        backgroundColor: Colors.blue, // ສີພື້ນຫລັງຂອງ AppBar
      ),
      body: Center(
        child: Text(
            'ສົນທະນາກັບ ${contact.name}'), // ສະແດງຂໍ້ຄວາມວ່າ "ສົນທະນາກັບ" ຊື່ຂອງຜູ້ຕິດຕໍ່
      ),
    );
  }
}
