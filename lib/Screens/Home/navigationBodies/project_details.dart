import 'package:community_on_demand_code_demo/Services/classes_data_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProjectDetailsPage {
  final String title;
  final String description;
  final List<String> members;

  const ProjectDetailsPage(this.title, this.description, this.members);
}

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({Key? key, required this.pages}) : super(key: key);

  final List<ProjectDetailsPage> pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pages[index].title),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(page: pages[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  static const double paddingHeight = 20;
  static const Color barColor = Colors.white;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Cookie');
  // In the constructor, require a Todo.
  const DetailScreen({Key? key, required this.page}) : super(key: key);

  // Declare a field that holds the Todo.
  final ProjectDetailsPage page;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Text(page.title, style: optionStyle),
      ),
      body: new Center(
          child: Column(
              children: <Widget>[
                SizedBox(height: paddingHeight),
                listOfWidgets(context, screenWidth)
              ]
          )
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget listOfWidgets(BuildContext context, double screenWidth) {
    List<Widget> list = <Widget>[];
    getClassesData()!.forEach((key, value) {
      int code = key;
      if (!studentInClass(code)) {
        list.add(
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(screenWidth - 30, 70),
              primary: Colors.lightGreenAccent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide(color: Colors.grey, width: 1),
            ),
            onPressed: () {
              String z = "";
            },
            child: Text(
              "Bleh",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }});
    return Wrap(
        spacing: 20.0, // gap between adjacent chips
        runSpacing: 20.0, // gap between lines
        children: list
    );
  }
}