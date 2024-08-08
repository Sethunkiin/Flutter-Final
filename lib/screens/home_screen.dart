// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'google_map_screen.dart'; // ນຳເຂົ້າ GoogleMapScreen ທີ່ຈະເປັນໜ້າແຜນທີ່
import '../widgets/chat_menu.dart'; // ນຳເຂົ້າ ChatMenu widget
import 'home_page.dart'; // ນຳເຂົ້າ HomePage widget
import 'settings_page.dart'; // ນຳເຂົ້າ SettingsPage widget

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key); // ໃຊ້ Key? ເພື່ອຄວາມປອດໄພຈາກ null

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0; // ຕິດຕາມຄ່າດັດຊະນີຂອງລາຍການເມນູດ້ານລຸ່ມທີ່ເລືອກ
  bool _isSearching = false; // ຕິດຕາມສະຖານະການມອງເຫັນຂອງແຖບຄົ້ນຫາ
  TextEditingController _searchController =
      TextEditingController(); // ຕົວຄວບຄຸມເພື່ອຈັດການຂໍ້ມູນຂອງການປ້ອນຄົ້ນຫາ

  @override
  void dispose() {
    _searchController.dispose(); // ທຳຄວາມສະອາດຕົວຄວບຄຸມເມື່ອ widget ຖືກລົບອອກ
    super.dispose();
  }

  // ຟັງຊັນເພື່ອສະຫຼັບບາຄົ້ນຫາ
  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching; // ສະຫຼັບຄວາມສາມາດເຫັນຂອງບາຄົ້ນຫາ
      if (!_isSearching) {
        _searchController
            .clear(); // ລ້າງຂໍ້ມູນໃນສະຫຼັບບາຄົ້ນຫາເມື່ອບໍ່ໄດ້ຄົ້ນຫາ
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text('🚨 PeePoremercall'),
            ), // ຫົວຂໍ້ຂອງແອັບທີ່ມີ emoji
            if (_selectedIndex == 1) // ສະແດງປຸ່ມຄົ້ນຫາສະເພາະໃນໜ້າ Emergency
              IconButton(
                icon: Icon(_isSearching ? Icons.close : Icons.search),
                onPressed: _toggleSearch, // ສະຫຼັບບາຄົ້ນຫາເມື່ອກົດປຸ່ມ
              ),
          ],
        ),
        bottom: _isSearching && _selectedIndex == 1
            ? PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'ຄົ້ນຫາ', // ຂໍ້ຄວາມຂອງການຄົ້ນຫາ
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              )
            : null,
      ),
      body: IndexedStack(
        index: _selectedIndex, // ສະແດງໜ້າທີ່ເລືອກ
        children: [
          HomePage(), // ໃຊ້ HomePage widget
          ChatMenu(
              searchController:
                  _searchController), // ChatMenu ທີ່ມີຄວາມສາມາດຄົ້ນຫາ
          GoogleMapScreen(), // ໜ້າຈໍ Google Map ທີ່ສະແດງແຜນທີ່ໃນຫົວຂໍ້ຂອງແອັບ
          SettingsPage(), // ໃຊ້ SettingsPage widget ທີ່ນີ້
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // ປະເພດແຖບນຳທາງດ້ານລຸ່ມທີ່ຖຶກກຳນົດ
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ໜ້າຫຼັກ', // ສະແດງໜ້າຫຼັກ
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'ສຸກເສີນ', // ສະແດງໜ້າ Emergency
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'ແຜນທີ່', // ໜ້າຈໍ Google Map ສຳລັບສະແດງແຜນທີ່
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'ການຕັ້ງຄ່າ', // ໜ້າການຕັ້ງຄ່າ
          ),
        ],
        currentIndex: _selectedIndex, // ຂັບໃຫ້ເມນູທີ່ເລືອກໄດ້ແມ່ນເງົາ
        selectedItemColor: Colors.blue, // ສີຂອງເມນູທີ່ເລືອກແລ້ວ
        unselectedItemColor: Colors.grey, // ສີຂອງເມນູທີ່ບໍ່ໄດ້ເລືອກ
        backgroundColor: Colors.white, // ສີພື້ນຫລັງ
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // ອັບເດດຄ່າດັດຊະນີທີ່ເລືອກ
            if (_selectedIndex != 1) {
              _isSearching = false; // ປິດບາຄົ້ນຫາເມື່ອບໍ່ໃຊ້ໜ້າ Emergency
            }
          });
        },
        showSelectedLabels: true, // ສະແດງສັນຍາລັກສໍາລັບເມນູທີ່ເລືອກແລ້ວ
        showUnselectedLabels: true, // ສະແດງສັນຍາລັກສໍາລັບເມນູທີ່ບໍ່ໄດ້ເລືອກ
        selectedFontSize: 11.0, // ຂະໜາດອັກສອນຂອງສັນຍາລັກທີ່ເລືອກແລ້ວ
        unselectedFontSize: 11.0, // ຂະໜາດອັກສອນຂອງສັນຍາລັກທີ່ບໍ່ໄດ້ເລືອກ
        iconSize: 24.0, // ຂະໜາດຂອງສັນຍາລັກ
      ),
    );
  }
}
