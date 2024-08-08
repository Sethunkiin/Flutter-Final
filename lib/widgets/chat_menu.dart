// widgets/chat_menu.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/contact.dart'; // ສັນນິຖານວ່າສິ່ງນີ້ແມ່ນທີ່ທ່ານໄດ້ນິຍາມຮູບແບບ Contact

class ChatMenu extends StatefulWidget {
  final TextEditingController searchController;

  // ໃຊ້ const constructor ຖ້າບໍ່ມີຕົວແປ mutable
  const ChatMenu({Key? key, required this.searchController}) : super(key: key);

  @override
  _ChatMenuState createState() => _ChatMenuState();
}

class _ChatMenuState extends State<ChatMenu> {
  List<Contact> filteredContacts =
      contacts; // ລາຍຊື່ຂອງການຕິດຕໍ່ທີ່ໄດ້ຖືກກັ່ນຕອງ

  @override
  void initState() {
    super.initState();
    widget.searchController
        .addListener(_onSearchChanged); // ຟັງເປີດການຄົ້ນຫາທີ່ປ່ຽນແປງ
  }

  @override
  void dispose() {
    widget.searchController
        .removeListener(_onSearchChanged); // ນຳຕົວຟັງເອກະອອນອອກ
    super.dispose();
  }

  // ຟັງຊັນທີ່ຈະອັບເດດລາຍຊື່ເຂົ້າໃນສະມາຄົມຂອງການຄົ້ນຫາຂອງຜູ້ໃຊ້
  void _onSearchChanged() {
    String query =
        widget.searchController.text.toLowerCase(); // ແປງໃຫ້ເປັນຕົວຕ່ຳສຸດ
    setState(() {
      filteredContacts = contacts
          .where((contact) => contact.name.toLowerCase().contains(query))
          .toList(); // ກັ່ນຕອງຂໍ້ມູນຕິດຕໍ່ອີງຕາມຄຳສັງຂອງຜູ້ໃຊ້
    });
  }

  // ຟັງຊັນທີ່ຈະເອີ້ນໂທລະສັບ
  void _makeCall(String phoneNumber) async {
    final Uri url = Uri(
        scheme: 'tel',
        path:
            phoneNumber); // ໃຊ້ Uri ເພື່ອໃຫ້ປ້ອນຂໍ້ຜິດພາດ string interpolation
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // ຈັດການຂໍ້ຜິດພາດດ້ວຍຂໍ້ຄວາມຫາຜູ້ໃຊ້ແທນທີ່ຈະໂຍນ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ບໍ່ສາມາດເປີດໂທລະສັບ')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filteredContacts.length, // ຈຳນວນຂອງການຕິດຕໍ່ທີ່ໄດ້ກັ່ນຕອງ
      itemBuilder: (context, index) {
        final contact = filteredContacts[index]; // ຂໍ້ມູນຕິດຕໍ່ໃນລາຍຊື່
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(contact.imageUrl), // ຮູບຂອງການຕິດຕໍ່
            backgroundColor: Colors.grey[200], // ສີພື້ນປ່າຍຄໍສຳລັບ avatar
          ),
          title: Text(contact.name), // ຊື່ຂອງການຕິດຕໍ່
          subtitle: Text(contact.isOnline
              ? 'ອອນລາຍ'
              : 'ອອບລາຍ'), // ສະຖານະອອນລາຍຂອງການຕິດຕໍ່
          trailing: IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              _makeCall(contact.phoneNumber); // ໂທຫາຟັງຊັນດ້ວຍໝາຍເລກໂທລະສັບ
            },
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/chat', // ເສັ້ນທາງໄປ chat screen
              arguments: contact, // ສົ່ງຂໍ້ມູນການຕິດຕໍ່
            );
          },
        );
      },
    );
  }
}
