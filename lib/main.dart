// main.dart
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/chat_screen.dart'; // Import the ChatScreen widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHome(),
      theme: ThemeData(
        splashColor: Colors.transparent, // ลบเอฟเฟกต์ระลอกปุ่ม
        highlightColor: Colors.transparent, // ลบเอฟเฟกต์ไฮไลต์ปุ่ม
      ),
      routes: {
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}
