import 'package:flutter/material.dart';

import 'navigationBodies/Profile.dart';
import 'navigationBodies/project.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationScreen();
  }
}

/// This is the stateful widget that the main application instantiates.
class NavigationScreen extends StatefulWidget {
  //const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _NavigationState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  static List<Widget> _navigationBodies = <Widget>[
    ProjectScreen(),
    Container(),
    Container(),
    ProfileScreen()
  ];
  static const Color barColor = Colors.white;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Cookie');
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Projects',
      style: optionStyle,
    ),
    Text(
      'Feedback',
      style: optionStyle,
    ),
    Text(
      'Requests',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _widgetOptions.elementAt(_selectedIndex),
        backgroundColor: Colors.white,
      ),
      body: _navigationBodies.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'Projects',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Feedback',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hail),
            label: 'Requests',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
