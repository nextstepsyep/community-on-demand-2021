import 'package:community_on_demand_code_demo/Screens/Home/teacher/animations/dialog_animation_route.dart';
import 'package:flutter/material.dart';

import 'navigationBodies/Profile.dart';
import 'navigationBodies/cardGame/card_game_page.dart';
import 'navigationBodies/project.dart';
import 'package:community_on_demand_code_demo/Services/project_data_services.dart';
import 'package:community_on_demand_code_demo/Services/user_data_services.dart';

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
    ProfileScreen(),
    Container()
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
                "Projects",
                style: optionStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(DialogAnimationRoute(
                    builder: (context) {
                      return _AddProjectPopupCard();
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

/// Tag-value used for the add projects popup button.
const String _heroAddClass = 'add-project-hero';

class _AddProjectPopupCard extends StatelessWidget {
  _AddProjectPopupCard({Key? key}) : super(key: key);

  final TextEditingController projectNameController =
  TextEditingController(text: getData()['projectName']);
  final TextEditingController projectDescriptionController =
  TextEditingController(text: getData()['projectDescription']);

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
                    buildTextField("Enter your project's name", 1, 1, projectNameController),
                    SizedBox(height: 20),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.2,
                    ),
                    SizedBox(height: 20),
                    buildTextField("Enter your project's description", 1, 2, projectDescriptionController),
                    SizedBox(height: 20),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.2,
                    ),
                    TextButton(
                      onPressed: () async {
                        addProject(projectNameController.text, projectDescriptionController.text);
                        Navigator.of(context, rootNavigator: true).pop();
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new CardGamePage()));
                      },
                      child: const Text('Create Project'),
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
      textInputAction: TextInputAction.done,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
