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

  int _currentIndex = 0;
  final _pages = [
    const Lab2CallScreen(),
    const Lab2CameraScreen(),
    const Lab2ChatScreen(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: _pages.elementAt(_currentIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.black87,
        // type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        onTap: (int index) => setState(() => _currentIndex = index),
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
            backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
            backgroundColor: Colors.blue
          ),
        ],
      ),
    );
  }

  // _onItemTapped (int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }
}
