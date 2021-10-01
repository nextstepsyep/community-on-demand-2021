import 'package:community_on_demand_code_demo/Features/AlertMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class CardGameScreen extends StatefulWidget {
  @override
  CardGameScreenState createState() => CardGameScreenState();
}

class CardGameScreenState extends State<CardGameScreen> {
  static const double paddingHeight = 20;
  static const Color barColor = Colors.white;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Cookie');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text('Card Game', style: optionStyle),
        backgroundColor: Colors.white,
      ),
      // stuff
      body: Center(
          child: CardGame()
      ),
    );
  }

}

class CardGame extends StatefulWidget {
  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {

  List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<Card> cards = [
    Card(
      text: 'Red',
      color: Colors.red,
      name: 'name',
      type: 'type',
      imgUrl: 'imgUrl',
    ),
    Card(
      text: 'Blue',
      color: Colors.blue,
      name: 'name',
      type: 'type',
      imgUrl: 'imgUrl',
    ),
    Card(
      text: 'Green',
      color: Colors.green,
      name: 'name',
      type: 'type',
      imgUrl: 'imgUrl',
    ),
    Card(
      text: 'Yellow',
      color: Colors.yellow,
      name: 'name',
      type: 'type',
      imgUrl: 'imgUrl',
    ),
    Card(
      text: 'Orange',
      color: Colors.orange,
      name: 'name',
      type: 'type',
      imgUrl: 'imgUrl',
    ),
  ];

  @override
  void initState() {
    for (int i = 0; i < cards.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Card(
              text: cards[i].text,
              color: cards[i].color,
              name: cards[i].name,
              type: cards[i].type,
              imgUrl: cards[i].imgUrl,
          ),
          likeAction: () {
            cards[i].hasSkill = true;
          },
          nopeAction: () {
            cards[i].hasSkill = false;
          },
          superlikeAction: () {
            cards[i].somewhatHas = true;
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
            child: Column(children: [
              Container(
                height: 550,
                child: SwipeCards(
                  matchEngine: _matchEngine,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: _swipeItems[index].content.color,
                      child: Text(
                        _swipeItems[index].content.text,
                        style: TextStyle(fontSize: 100),
                      ),
                    );
                  },
                  onStackFinished: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            AlertMenu(
                              content: "Finished",
                              actions: [],
                            )
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                      onPressed: () {
                        _matchEngine.currentItem!.nope();
                      },
                      child: Text("Don't Have")),
                  RaisedButton(
                      onPressed: () {
                        _matchEngine.currentItem!.superLike();
                      },
                      child: Text("Somewhat Have")),
                  RaisedButton(
                      onPressed: () {
                        _matchEngine.currentItem!.like();
                      },
                      child: Text("Have"))
                ],
              )
            ])));
  }
  
}

class Card {
  final String text;
  final Color color;
  final String name;
  final String type;
  final String imgUrl;
  dynamic hasSkill;
  dynamic somewhatHas;

  Card({
    required this.text,
    required this.color,
    required this.name,
    required this.type,
    required this.imgUrl,
    hasSkill = false,
    somewhatHas = false,
  });
}


