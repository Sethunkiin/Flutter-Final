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
      imageUrl: '#',
      isOnline: true,
      phoneNumber: '02097672008'),
  Contact(
      name: 'ແຈ້ງໄຟໄໝ້',
      imageUrl: '#',
      isOnline: false,
      phoneNumber: '02056803315'),
  Contact(
      name: 'ກູ້ໄພມູນນິທິ',
      imageUrl: '#',
      isOnline: true,
      phoneNumber: '1122334455'),
];
