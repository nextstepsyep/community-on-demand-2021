import 'package:community_on_demand_code_demo/Features/AlertMenu.dart';
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
      body: Container (
        child: Column (
          children: [
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 200,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 51, 204, 255), width: 1),
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                    ),
                    // child: ""
                  ),
                  Positioned(
                      left: 50,
                      top: 12,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        color: Colors.white,
                        child: Text(
                          'Description',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      )),
                  Positioned(
                      left: 30,
                      top: 30,
                      right: 40,
                      bottom: 20,
                      child: Container(
                          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Text(
                              "BCH CHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCHHCHCHCCHCHCHCHCHCCHCHCHCHCHCCHCH" ,
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          )
                      )),
                ],
              ),
            ),
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 100,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 51, 204, 255), width: 1),
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                    ),
                    // child: ""
                  ),
                  Positioned(
                      left: 50,
                      top: 12,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        color: Colors.white,
                        child: Text(
                          'Members',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      )),
                  Positioned(
                      left: 30,
                      top: 30,
                      right: 40,
                      bottom: 20,
                      child: Container(
                          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Column(
                                children: <Widget>[
                                  SizedBox(height: paddingHeight / 2),
                                  listOfWidgets(page.members)
                                ]
                            )
                          )
                      )),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenWidth - screenWidth / 3, 40),
                primary: Colors.yellow,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(color: Colors.grey, width: 1),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        AlertMenu(
                          title: "Confirmation to join",
                          content: "Join " + page.title + "?",
                          actions: [
                            FlatButton(
                              color: Colors.white,
                              textColor: Colors.black,
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true).pop('dialog');
                              },
                            ),
                            FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text('Join'),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true).pop('dialog');
                              },
                            ),
                          ],
                        ));
              },
              child: Text(
                "Join Project",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenWidth - screenWidth / 3, 40),
                primary: Colors.deepOrangeAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(color: Colors.grey, width: 1),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        AlertMenu(
                          title: "Confirmation to join",
                          content: "Join " + page.title + "?",
                          actions: [
                            FlatButton(
                              color: Colors.white,
                              textColor: Colors.black,
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true).pop('dialog');
                              },
                            ),
                            FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text('Join'),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true).pop('dialog');
                              },
                            ),
                          ],
                        ));
              },
              child: Text(
                "Request Feedback",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget listOfWidgets(List<String> members) {
    List<Text> member_display = <Text>[];
    for (int i = 0; i < members.length; i++) {
      member_display.add(
        Text(
          members[i],
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
      );
    }
    return Wrap(
        spacing: 20.0, // gap between adjacent chips
        runSpacing: 20.0, // gap between lines
        children: member_display
    );
  }


}