import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class CardGame extends StatefulWidget {
  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> with SingleTickerProviderStateMixin {
  static const double paddingHeight = 20;
  static const Color barColor = Colors.white;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Cookie');

  // UPDATE LIST FOR CARDS TO COME IN
  List<Card> cards = [
    Card(
      data[0]['color'], false
    ),
    Card(
      data[1]['color'], false
    ),
    Card(
      data[2]['color'], false
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text('Card Game', style: optionStyle),
        backgroundColor: Colors.white,
      ),

      body: Container(
        padding: EdgeInsets.all(50),
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Stack(
          children: cards,
        ),
      ),
    );
  }
}

//  USE THIS CLASS TO PUT WHATS IN A CARD
class Card extends StatelessWidget {
  final Color color;
  bool haveSkill;
  //
  // void initState() {
  //   haveSkill = false;
  // }
  //
  // // final VoidCallback swipedLeft;
  //
  Card(this.color, this.haveSkill);
  //
  @override
  Widget build(BuildContext context) {
    return Swipable(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: color,
          // image: DecorationImage(
          //
          // )
        ),
      ),
    );

  //   return Scaffold(
  //     body: ListView(
  //       children: <Widget>[
  //         Container(
  //           child: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(16.0),
  //               color: color,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  }


}


// INFORMATION OF EACH INDIVIDUAL CARD, LINK TO DATABASE
final List data = [
  {
    'color': Colors.red,
  },
  {
    'color': Colors.green,
  },
  {
    'color': Colors.blue,
  },
];


