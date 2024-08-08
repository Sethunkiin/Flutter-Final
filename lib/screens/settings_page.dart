// screens/settings_page.dart
import 'package:flutter/material.dart';

// ປະກາດຄລາສ SettingsPage ເປັນ StatelessWidget
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ໃຊ້ Padding ເພື່ອໃຫ້ມີລະດັບຄອບໂດຍອັດຕະໂນມັດ 16.0
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // ສະແດງຂໍ້ຄວາມ "ການຕັ້ງຄ່າ"
            Text(
              'ການຕັ້ງຄ່າ',
            ),
            SizedBox(height: 20),
            // ListTile ສຳລັບການຕັ້ງຄ່າບັນຊີ
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('ບັນຊີ'),
              subtitle: Text('ຈັດການການຕັ້ງຄ່າບັນຊີຂອງທ່ານ'),
              onTap: () {
                // ເມື່ອກົດແລ້ວໄປທີ່ໜ້າລາຍລະອຽດ
                _navigateToDetail(context, 'ການຕັ້ງຄ່າບັນຊີ');
              },
            ),
            Divider(),
            // ListTile ສຳລັບການຕັ້ງຄ່າແຈ້ງເຕືອນ
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('ແຈ້ງເຕືອນ'),
              subtitle: Text('ຈັດການການຕັ້ງຄ່າແຈ້ງເຕືອນຂອງທ່ານ'),
              onTap: () {
                _navigateToDetail(context, 'ການຕັ້ງຄ່າແຈ້ງເຕືອນ');
              },
            ),
            Divider(),
            // ListTile ສຳລັບການຕັ້ງຄ່າຄວາມສ່ວນຕົວ
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('ຄວາມສ່ວນຕົວ'),
              subtitle: Text('ຈັດການການຕັ້ງຄ່າຄວາມສ່ວນຕົວ'),
              onTap: () {
                _navigateToDetail(context, 'ການຕັ້ງຄ່າຄວາມສ່ວນຕົວ');
              },
            ),
            Divider(),
            // ListTile ສຳລັບການຕັ້ງຄ່າພາສາ
            ListTile(
              leading: Icon(Icons.language),
              title: Text('ພາສາ'),
              subtitle: Text('ປ່ຽນພາສາແອັບ'),
              onTap: () {
                _navigateToDetail(context, 'ການຕັ້ງຄ່າພາສາ');
              },
            ),
            Divider(),
            // ListTile ສຳລັບການຊ່ວຍເຫຼືອ ແລະ ສະໜັບສະໜູນ
            ListTile(
              leading: Icon(Icons.help),
              title: Text('ຊ່ວຍເຫຼືອ ແລະ ສະໜັບສະໜູນ'),
              subtitle: Text('ຮັບຄວາມຊ່ວຍເຫຼືອ ແລະ ສະໜັບສະໜູນ'),
              onTap: () {
                _navigateToDetail(context, 'ຊ່ວຍເຫຼືອ ແລະ ສະໜັບສະໜູນ');
              },
            ),
            Divider(),
            // ListTile ສຳລັບການຕັ້ງຄ່າກ່ຽວກັບ
            ListTile(
              leading: Icon(Icons.info),
              title: Text('ກ່ຽວກັບ'),
              subtitle: Text('ກ່ຽວກັບແອັບນີ້'),
              onTap: () {
                _navigateToDetail(context, 'ກ່ຽວກັບແອັບ');
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  // ຟັງຊັນເພື່ອນຳທ່ານໄປຍັງຫນ້າລາຍລະອຽດ
  void _navigateToDetail(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(title: title),
      ),
    );
  }
}

// ປະກາດຄລາສ DetailPage ເປັນ StatelessWidget
class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ສະແດງ AppBar ພ້ອມກັບ title ທີ່ໄດ້ຮັບ
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        // ສະແດງຂໍ້ຄວາມລາຍລະອຽດຂອງ title ທີ່ໄດ້ຮັບ
        child: Text(
          '$title ລາຍລະອຽດຈະຖືກສະແດງຢູ່ທີ່ນີ້.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
