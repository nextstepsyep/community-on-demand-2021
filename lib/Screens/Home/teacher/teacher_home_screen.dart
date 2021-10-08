import 'package:community_on_demand_code_demo/Screens/Home/teacher/navigationBodies/teacher_classes_screen.dart';
import 'package:community_on_demand_code_demo/Services/classes_data_services.dart';
import 'package:flutter/material.dart';

import '../teacher/navigationBodies/TeacherProfile.dart';
import 'animations/add_class_dialog_route.dart';

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
  static List<Widget> _navigationBodies =[
    TeacherClassesScreen(),
    Container(),
    Container(),
    Container(),
    TeacherProfileScreen()
  ];
  static const Color barColor = Colors.white;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Cookie');

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
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
                Navigator.of(context).push(AddClassDialogRoute(
                    builder: (context) {
                      return _AddClassPopupCard();
                    }
                ));
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

/// Tag-value used for the add classes popup button.
const String _heroAddClass = 'add-class-hero';

class _AddClassPopupCard extends StatelessWidget {
  _AddClassPopupCard({Key? key}) : super(key: key);

  final TextEditingController classNameController =
  TextEditingController(text: getData()['className']);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddClass,
          createRectTween: (begin, end) {
            return RectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildTextField("Enter your class' name", 1, 1, classNameController),
                    SizedBox(height: 20),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.2,
                    ),
                    TextButton(
                      onPressed: () {
                        addClass(classNameController.text);
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: const Text('Create Class'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField buildTextField(String labelText, int minLines, int maxLines,
      TextEditingController controller) {
    return TextField(
      textAlignVertical: TextAlignVertical.top,
      minLines: minLines,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}