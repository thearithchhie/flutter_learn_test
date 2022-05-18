import 'package:flutter/material.dart';

import 'lab2_call_screen.dart';
import 'lab2_camera_screen.dart';
import 'lab2_chat_screen.dart';

class Lab2Navigation extends StatefulWidget {
  const Lab2Navigation({Key? key}) : super(key: key);

  @override
  _Lab2NavigationState createState() => _Lab2NavigationState();
}

class _Lab2NavigationState extends State<Lab2Navigation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    const _pages = [
      Lab2CallScreen(),
      Lab2CameraScreen(),
      Lab2ChatScreen(),
    ];

    return Scaffold(
      body: Container(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }

  _onItemTapped (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
