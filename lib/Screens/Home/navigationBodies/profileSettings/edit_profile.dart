import 'package:community_on_demand_code_demo/Services/data_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../home_screen.dart';
// import 'classes_screen.dart';

class EditProfile extends StatelessWidget {
  static const double paddingHeight = 20;
  static const Color barColor = Colors.white;
  final TextEditingController firstNameController =
      TextEditingController(text: getData()['firstName']);
  final TextEditingController lastNameController =
      TextEditingController(text: getData()['lastName']);
  final TextEditingController bioController =
      TextEditingController(text: getData()['bio']);
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Cookie');

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text('Edit Profile', style: optionStyle),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(height: paddingHeight),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.blue),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://i.kym-cdn.com/entries/icons/original/000/027/475/Screen_Shot_2018-10-25_at_11.02.15_AM.png"))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.blue,
                            ),
                            color: Colors.blue,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(height: paddingHeight),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    buildTextField("First Name", 1, 1, firstNameController),
                    SizedBox(height: paddingHeight),
                    buildTextField("Last Name", 1, 1, lastNameController),
                    SizedBox(height: paddingHeight),
                    buildTextField("Biography", 5, 10, bioController),
                    SizedBox(height: paddingHeight),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      padding: EdgeInsets.symmetric(horizontal: 65),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        updateProfile(firstNameController.text,
                            lastNameController.text, bioController.text);
                      },
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 65),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
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
