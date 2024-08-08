// screens/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ກຳນົດເປັນ Scaffold ເພື່ອສ້າງຮູບແບບໜ້າຫຼັກຂອງແອັບ
    return Scaffold(
      // ກຳນົດ AppBar ເພື່ອສະແດງຫົວຂໍ້
      appBar: AppBar(
        title: Text('ຍິນດີຕ້ອນຮັບສູ່ໜ້າຫຼັກ'),
      ),
      // ສ້າງເນື້ອໃນຫຼັກຂອງແອັບ
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ກຳນົດ Padding ເພື່ອໃສ່ຂໍ້ຄວາມ
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'ອັບເດດຂ່າວສານ ແລະ ກິດຈະກຳລ່າສຸດ.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 20),
            // ສ້າງ EventCard ເພື່ອສະແດງຂ່າວສານ
            EventCard(
              imageUrl: 'images/12.jpg',
              title: 'ຂ່າວສານທີ່ຕື່ນເຕັ້ນ',
              description: 'ນີ້ແມ່ນຄຳອະທິບາຍສັ້ນໆຂອງເຫດການຂ່າວສານ.',
            ),
            EventCard(
              imageUrl: 'images/logo.png',
              title: 'ກິດຈະກຳທີ່ຈະມາຮອດ',
              description: 'ລາຍລະອຽດກ່ຽວກັບກິດຈະກຳທີ່ຈະມາຮອດຢູ່ທີ່ນີ້.',
            ),
            EventCard(
              imageUrl: 'images/ip.png',
              title: 'ກິດຈະກຳທີ່ຜ່ານມາ',
              description: 'ຄຳອະທິບາຍກ່ຽວກັບກິດຈະກຳທີ່ຜ່ານມາ ແລະ ການອັບເດດ.',
            ),
            SizedBox(height: 20),
            // ສ້າງປຸ່ມ ElevatedButton ໃຫ້ຢູ່ກາງ
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // ການກະທຳຕົວຢ່າງຂອງປຸ່ມ
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('ປຸ່ມ "ສຳຫຼວດເພີ່ມຕື່ມ" ໄດ້ຖືກກົດແລ້ວ!')),
                  );
                },
                child: Text('ສຳຫຼວດເພີ່ມຕື່ມ'),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const EventCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  void _viewDetails(BuildContext context) {
    // ນຳທ່ານໄປຫາໜ້າລາຍລະອຽດຫຼືສະແດງລາຍລະອຽດ
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          title: title,
          imageUrl: imageUrl,
          description: description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ກຳນົດ Padding ເພື່ອກຳນົດ Card
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () => _viewDetails(context),
                      child: Text('ເບິ່ງລາຍລະອຽດ'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const DetailsPage({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ສ້າງໜ້າລາຍລະອຽດຂອງກິດຈະກຳ
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'ຂໍ້ມູນລາຍລະອຽດເກີດຂຶ້ນທີ່ນີ້. ທ່ານສາມາດຂະຫຍາຍພື້ນທີ່ນີ້ໃຫ້ສົມບູນດ້ວຍຂໍ້ຄວາມເພີ່ມ, ຮູບພາບ, ຫຼືຄວາມໃດໜຶ່ງທີ່ໃຫ້ຂໍ້ມູນເພີ່ມຕື່ມ.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
