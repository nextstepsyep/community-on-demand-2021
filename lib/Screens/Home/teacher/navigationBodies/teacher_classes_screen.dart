import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:community_on_demand_code_demo/Services/classes_data_services.dart';

class TeacherClassesScreen extends StatelessWidget {
  List classes = [];
  @override
  void initState() {
    fetchData();
  }

  void fetchData() async {
    classes = await getClasses();
    if (classes == null) {
      print("Unable to fetch list of classes");
    }
  }
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Center(
      widthFactor: screenWidth * 0.95,
      heightFactor: screenHeight * 0.95,
      child: Column(
        children: <Widget>[
          Text(
            'Current Class: ?',
            style: TextStyle(
              fontFamily: 'Cookie',
              fontSize: screenWidth * 0.1,
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: classes.length,
            itemBuilder: (context, index) {
              return Column(
                  children: <Widget> [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(screenWidth - 30, 60),
                        primary: Colors.white,
                        elevation: 0,
                        shape: StadiumBorder(),
                        side: BorderSide(color: Colors.grey, width: 1),
                      ),
                      onPressed: () {
                      },
                      child: Text(
                        'Class Placeholder',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10)
                ]
              );
            }
          ),
        ],
      ),
    );
  }
}
