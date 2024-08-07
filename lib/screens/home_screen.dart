import 'package:flutter/material.dart';
import '../widgets/chat_menu.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;
  bool _isSearching = false; // สถานะว่ากำลังค้นหาอยู่หรือไม่
  TextEditingController _searchController =
      TextEditingController(); // ตัวควบคุม TextField สำหรับการค้นหา

  @override
  void dispose() {
    _searchController.dispose(); // ทำลายตัวควบคุมเมื่อ Widget ถูกลบ
    super.dispose();
  }

  // ฟังก์ชันเพื่อสลับสถานะการค้นหา
  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching; // สลับสถานะการค้นหา
      if (!_isSearching) {
        _searchController.clear(); // ล้างข้อความใน TextField
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(child: Text('🚨 PeePoremercall')), // ชื่อแอป
            if (_selectedIndex == 1) // แสดงปุ่มค้นหาเมื่ออยู่ในหน้า ChatMenu
              IconButton(
                icon: Icon(_isSearching ? Icons.close : Icons.search),
                onPressed: _toggleSearch,
              ),
          ],
        ),
        bottom: _isSearching &&
                _selectedIndex ==
                    1 // แสดง TextField เมื่อกำลังค้นหาและอยู่ในหน้า ChatMenu
            ? PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              )
            : null,
      ),
      body: IndexedStack(
        // ใช้ IndexedStack เพื่อเก็บสถานะของแต่ละหน้า
        index: _selectedIndex,
        children: [
          Center(child: Text('Home Page')),
          ChatMenu(
              searchController:
                  _searchController), // ส่ง searchController เข้าไป
          Center(child: Text('School Page')),
          Center(child: Text('School Page 1')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (_selectedIndex != 1) {
              _isSearching = false; // ปิดการค้นหาเมื่อไม่อยู่ในหน้า ChatMenu
            }
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 11.0,
        unselectedFontSize: 11.0,
        iconSize: 24.0,
      ),
    );
  }
}
