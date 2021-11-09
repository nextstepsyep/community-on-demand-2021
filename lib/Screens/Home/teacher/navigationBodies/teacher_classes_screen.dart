import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_on_demand_code_demo/Screens/Home/teacher/animations/dialog_animation_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:community_on_demand_code_demo/Services/teacher_data_services.dart';

class TeacherClassesScreen extends StatelessWidget {
  String currentClass = "";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return StreamBuilder<QuerySnapshot>(
      stream: getClassesStream(),
      builder: (context, snapshot) {
        return Center(
          widthFactor: screenWidth * 0.95,
          heightFactor: screenHeight * 0.95,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StreamBuilder<DocumentSnapshot>(
                  stream: getDocStream(),
                  builder: (context, snapshot) {
                    return Text(
                      'Current Class: ' + getClass(),
                      style: TextStyle(
                        fontFamily: 'Cookie',
                        fontSize: screenWidth * 0.1,
                      ),
                    );
                  }
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  child: Column(
                    children: listOfWidgets(context, screenWidth)
                  )
                )
              ]
            )
          )
        );
      }
    );
  }

  List<Widget> listOfWidgets(BuildContext context, double screenWidth) {
    List<Widget> list = <Widget>[];
    getClassesData()!.forEach((key, value) {
      int code = key;
      list.add(ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(screenWidth - 30, 60),
          primary: Colors.white,
          elevation: 0,
          shape: StadiumBorder(),
          side: BorderSide(color: Colors.grey, width: 1),
        ),
        onPressed: () =>
        {
          Navigator.of(context).push(DialogAnimationRoute(
              builder: (context) {
                _ViewClassPopupCard card = new _ViewClassPopupCard();
                card.setId(getClassesData()![code]!.id);
                return card;
              }
          ))
        },
        child: Text(
          (getClassesData()![code])!.data()['name'],
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
      ));
      list.add(SizedBox(height: 10));
    });
    return list;
  }
}

const String _heroViewClass = 'view-class-hero';

class _ViewClassPopupCard extends StatelessWidget {
  String id = "";
  _ViewClassPopupCard({Key? key}) :
        super(key: key);

  void setId(String id) {
    this.id = id;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroViewClass,
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
                    TextButton(
                      onPressed: () {
                        switchClass(id);
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: const Text('Switch to this Class'),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.2,
                    ),
                    TextButton(
                      onPressed: () {
                        deleteClass(id);
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: const Text('Delete Class'),
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
}