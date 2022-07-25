import 'package:flutter/material.dart';
import 'package:helloworld/screens/profileScreen.dart';
import 'package:helloworld/screens/homeScreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);
  @override
  State<BottomNav> createState() => _BottomNav();
}
int _selectedIndex = 0;
class _BottomNav extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      switch (_selectedIndex) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
          break;
      }
    }
    return BottomNavigationBar(
      currentIndex: _selectedIndex, // this will be set when a new tab is tapped
      onTap: _onItemTapped,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        )
      ],
    );
  }
}
