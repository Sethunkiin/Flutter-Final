import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/contact.dart';

class ChatMenu extends StatefulWidget {
  final TextEditingController searchController;

  ChatMenu({required this.searchController});

  @override
  _ChatMenuState createState() => _ChatMenuState();
}

class _ChatMenuState extends State<ChatMenu> {
  List<Contact> filteredContacts = contacts; // รายการผู้ติดต่อที่ผ่านการกรอง
  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(
        _onSearchChanged); // ตั้งค่าตัวควบคุมให้ฟังการเปลี่ยนแปลงข้อความใน TextField
  }

  @override
  void dispose() {
    widget.searchController
        .removeListener(_onSearchChanged); // ลบ listener เมื่อ widget ถูกทำลาย
    super.dispose();
  }

  // ฟังก์ชันเมื่อข้อความใน TextField เปลี่ยนแปลง

  void _onSearchChanged() {
    String query = widget.searchController.text
        .toLowerCase(); // ข้อความค้นหาทั้งหมดเป็นตัวพิมพ์เล็ก
    setState(() {
      filteredContacts = contacts
          .where((contact) => contact.name.toLowerCase().contains(query))
          .toList(); // กรองรายชื่อผู้ติดต่อโดยใช้ข้อความค้นหา
    });
  }

  // ฟังก์ชันสำหรับการโทร
  void _makeCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filteredContacts.length, // จำนวนผู้ติดต่อที่ผ่านการกรอง
      itemBuilder: (context, index) {
        final contact = filteredContacts[index]; // ผู้ติดต่อแต่ละคนในรายการ
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(contact.imageUrl), // รูปภาพผู้ติดต่อ
          ),
          title: Text(contact.name), // ชื่อผู้ติดต่อ
          subtitle: Text(contact.isOnline
              ? 'Online'
              : 'Offline'), // สถานะออนไลน์ของผู้ติดต่อ
          trailing: IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              _makeCall(contact
                  .phoneNumber); // เรียกฟังก์ชันการโทรพร้อมหมายเลขโทรศัพท์
            },
          ),
          onTap: () {
            Navigator.pushNamed(context, '/chat',
                arguments: contact); // นำทางไปยังหน้าจอแชทเมื่อคลิกที่ผู้ติดต่อ
          },
        );
      },
    );
  }
}
