class Contact {
  final String name;
  final String imageUrl; //
  final bool isOnline; //ສະຖານະອອນ
  final String phoneNumber; // ເບີ

  Contact({
    required this.name,
    required this.imageUrl,
    required this.isOnline,
    required this.phoneNumber,
  });
}

List<Contact> contacts = [
  Contact(
      name: 'ຕຳຫຼວດ  ',
      imageUrl: 'images/wo.jpg',
      isOnline: true,
      phoneNumber: '02097672008'),
  Contact(
      name: 'ແຈ້ງໄຟໄໝ້',
      imageUrl: 'images/12.jpg',
      isOnline: false,
      phoneNumber: '02056803315'),
  Contact(
      name: 'ກູ້ໄພມູນນິທິ',
      imageUrl: 'images/logo.png',
      isOnline: true,
      phoneNumber: '1122334455'),
  Contact(
      name: 'ນ້ຳປະປາ  ',
      imageUrl: 'images/74.jpg',
      isOnline: true,
      phoneNumber: '02097672008'),
  Contact(
      name: 'ໝ່ວຍກູ້ຊີບ ອົງການກາແດງ',
      imageUrl: 'images/747.jpg',
      isOnline: true,
      phoneNumber: '02097672008'),
  Contact(
      name: 'ລົດໂຮງໝໍ  ',
      imageUrl: 'images/qw.jpg',
      isOnline: true,
      phoneNumber: '02097672008'),
  Contact(
      name: 'ໄຟຟ້າ  ',
      imageUrl: 'images/logo.png',
      isOnline: true,
      phoneNumber: '02097672008'),
];
