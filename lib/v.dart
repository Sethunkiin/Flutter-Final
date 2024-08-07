// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       home: MyHome(),
//       theme: ThemeData(
//         splashColor: Colors.transparent, // ลบเอฟเฟกต์ระลอกปุ่ม
//         highlightColor: Colors.transparent, // ลบเอฟเฟกต์ไฮไลต์ปุ่ม
//       ),
//     );
//   }
// }

// class MyHome extends StatefulWidget {
//   const MyHome({super.key});

//   @override
//   State<MyHome> createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     Center(child: Text('Home Page')),
//     Center(child: Text('Emergency Page')),
//     Center(child: Text('School Page')),
//     Center(child: Text('School Page 1')),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('🚨 PeePoremercall'),
//       ),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.emergency),
//             label: 'Emergency',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'settings',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         backgroundColor: Colors.white,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         selectedFontSize: 11.0,
//         unselectedFontSize: 11.0,
//         iconSize: 24.0,
//       ),
//     );
//   }
// }
// //////////////////////////////////////////////////
// ///
// ///
// ///
// ///
// ///
// // home.dart
// // import 'package:fiutter/FormAdd.dart';
// // import 'package:fiutter/detail.dart';
// // import 'package:fiutter/About.dart';
// //import 'package:fiutter/v.dart';
// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//       ),
//       body: Column(
//         children: [
//           const Text('Hello'),
//           const Text('to'),
//           const Text('My first app'),
//           // ElevatedButton(
//           //   onPressed: () {
//           //     Navigator.push(
//           //       context,
//           //     //  MaterialPageRoute(builder: (context) => const v()),
//           //     );
//           //   },
//           //   child: const Text("Go to About"),
//           // ),
//           // ElevatedButton(
//           //   onPressed: () {
//           //     Navigator.push(
//           //       context,
//           //       MaterialPageRoute(builder: (context) => const Detail()),
//           //     );
//           //   },
//           //     child: const Text("Go to detail"),
//           //   ),
//           //   ElevatedButton(
//           //     onPressed: () {
//           //       Navigator.push(
//           //         context,
//           //         MaterialPageRoute(builder: (context) => const FormAdd()),
//           //       );
//           //     },
//           //     child: const Text("Go to FormAdd"),
//           //   ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const Home());
// }






// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ///

// import 'package:flutter/material.dart';
// import 'widgets/chat_screen.dart'; // Import the ChatScreen widget

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       home: MyHome(),
//       theme: ThemeData(
//         splashColor: Colors.transparent, // ลบเอฟเฟกต์ระลอกปุ่ม
//         highlightColor: Colors.transparent, // ลบเอฟเฟกต์ไฮไลต์ปุ่ม
//       ),
//       routes: {
//         '/chat': (context) => ChatScreen(),
//       },
//     );
//   }
// }

// class MyHome extends StatefulWidget {
//   const MyHome({super.key});

//   @override
//   State<MyHome> createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     Center(child: Text('Home Page')),
//     Center(child: ChatMenu()),
//     Center(child: Text('School Page')),
//     Center(child: Text('School Page 1')),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('🚨 PeePoremercall'),
//         backgroundColor: Colors.blue,
//       ),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.emergency),
//             label: 'Emergency',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'settings',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         backgroundColor: Colors.white,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         selectedFontSize: 11.0,
//         unselectedFontSize: 11.0,
//         iconSize: 24.0,
//       ),
//     );
//   }
// }

// class Contact {
//   final String name;
//   final String imageUrl;
//   final bool isOnline;

//   Contact({required this.name, required this.imageUrl, required this.isOnline});
// }

// List<Contact> contacts = [
//   Contact(name: 'John Doe', imageUrl: '#', isOnline: true),
//   Contact(name: 'Jane Doe', imageUrl: '#', isOnline: false),
//   Contact(name: 'Peter Jones', imageUrl: '#', isOnline: true),
// ];

// class ChatMenu extends StatefulWidget {
//   @override
//   _ChatMenuState createState() => _ChatMenuState();
// }

// class _ChatMenuState extends State<ChatMenu> {
//   TextEditingController _searchController = TextEditingController();
//   List<Contact> filteredContacts = contacts;

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_onSearchChanged);
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _onSearchChanged() {
//     String query = _searchController.text.toLowerCase();
//     setState(() {
//       filteredContacts = contacts
//           .where((contact) => contact.name.toLowerCase().contains(query))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             controller: _searchController,
//             decoration: InputDecoration(
//               labelText: 'Search',
//               prefixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(),
//             ),
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: filteredContacts.length,
//             itemBuilder: (context, index) {
//               final contact = filteredContacts[index];
//               return ListTile(
//                 leading: CircleAvatar(
//                   backgroundImage: AssetImage(contact.imageUrl),
//                 ),
//                 title: Text(contact.name),
//                 subtitle: Text(contact.isOnline ? 'Online' : 'Offline'),
//                 onTap: () {
//                   Navigator.pushNamed(context, '/chat', arguments: contact);
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
