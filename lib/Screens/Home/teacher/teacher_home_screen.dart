import 'package:community_on_demand_code_demo/Screens/Home/teacher/navigationBodies/teacher_classes_screen.dart';
import 'package:flutter/material.dart';

import '../teacher/navigationBodies/TeacherProfile.dart';

class TeacherHomeScreen extends StatelessWidget {
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
    TeacherClassesScreen(),
    Container(),
    Container(),
    Container(),
    TeacherProfile()
  ];
  static const Color barColor = Colors.white;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Cookie');
  static List<Widget> _widgetOptions = <Widget>[
    Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Text(
              "Classes",
              style: optionStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            // TODO : Firebase data for class objects need to be implemented.
          },
          child: const Icon(
              Icons.add,
              color: Colors.black
          ),
          backgroundColor: Colors.white
        )
      ],
    ),
    Text(
      'Projects',
      style: optionStyle,
    ),
    Text(
      'Students',
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
            icon: Icon(Icons.menu_book),
            label: 'Classes',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'Projects',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Students',
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
