import 'package:community_on_demand_code_demo/Screens/Home/teacher/animations/add_class_dialog_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:community_on_demand_code_demo/Services/classes_data_services.dart';

class TeacherClassesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationScreen();
  }
}
class NavigationScreen extends StatefulWidget {
  //const MyStatefulWidget({Key? key}) : super(key: key);
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<NavigationScreen> {
  List classes = [];
  String currentClass = "";
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    dynamic result = await getClasses();
    if (result == null) {
      print("Unable to fetch list of classes");
    } else {
      setState(() {
        classes = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Center(
      widthFactor: screenWidth * 0.95,
      heightFactor: screenHeight * 0.95,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                // TODO: Teacher document needs a current class field.
                'Current Class: ' + currentClass,
                style: TextStyle(
                  fontFamily: 'Cookie',
                  fontSize: screenWidth * 0.1,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                child: ListView.builder(
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
                            onPressed: () => {
                              Navigator.of(context).push(AddClassDialogRoute(
                                  builder: (context) {
                                    _ViewClassPopupCard card = new _ViewClassPopupCard();
                                    card.setId(classes[index].id);
                                    return card;
                                  }
                              ))
                            },
                            child: Text(
                              classes[index].data()['name'],
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
                )
              )
            ],
          )
        )
    );
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
                        // TODO: Implement in database.
                        updateCurrentClass();
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
                        Navigator.of(context).push(AddClassDialogRoute(
                            builder: (context) {
                              return new _ConfirmActionPopupCard();
                            }
                        ));
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

const String _heroConfirmAction = 'confirm-action-hero';

class _ConfirmActionPopupCard extends StatelessWidget {
  _ConfirmActionPopupCard({Key? key}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroConfirmAction,
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
                      onPressed: () { },
                      child: const Text('Action successfully completed!'),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.2,
                    )
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
