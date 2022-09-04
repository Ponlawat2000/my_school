import 'package:flutter/material.dart';
import 'package:my_school/screen/about_screen.dart';
import 'package:my_school/screen/contact_screen.dart';
import 'package:my_school/screen/home_screen.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  final List<Map<String, dynamic>> _manu = [
    {
      "title": "ข่าวสาร",
      "icon": Icons.newspaper,
      "screen": homescreen(),
    },
    {
      "title": "ติดต่อเรา",
      "icon": Icons.phone,
      "screen": contactscreen(),
    },
    {
      "title": "เกี่ยวกับเรา",
      "icon": Icons.info,
      "screen": aboutscreen(),
    }
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Ponlawat'),
              accountEmail: Text('ponlawat1872s@gmail.com'),
              currentAccountPicture: CircleAvatar(
                radius: 50,
                backgroundImage: Image.network(
                  'https://64.media.tumblr.com/71d57a844fc61d5c8261e62a67ec0cf9/f9765608d9e5a320-07/s1280x1920/12108996e2933179c4848918cde6f4101e2de974.jpg',
                ).image,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("หน้าหลัก"),
            ),
            ListTile(
              leading: Icon(Icons.dangerous),
              title: Text("หน้าอื่นๆ"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(_manu[_currentIndex]['title']),
      ),
      body: _manu[_currentIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: _manu
            .map(
              (e) => BottomNavigationBarItem(
                  icon: Icon(e['icon']), label: e['title']),
            )
            .toList(),
      ),
    );
  }
}
