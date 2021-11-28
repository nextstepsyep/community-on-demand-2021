import 'package:community_on_demand_code_demo/Features/AlertMenu.dart';
import 'package:community_on_demand_code_demo/Services/user_data_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:csv/csv.dart';

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
      body: Center(child: CardGame()),
    );
  }
}

class CardGame extends StatefulWidget {
  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Map<String, List<int>> categoryTotals = {};
  List<Card> cards = [];

  Future<List<Card>> getCards() async {
    if (cards.isNotEmpty) {
      return cards;
    } else {
      final _rawData = await rootBundle.loadString('assets/data/Card Data.csv');
      List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);
      _listData.removeAt(0);
      List<Card> cardList = [];
      for (List<dynamic> item in _listData) {
        String cardName = item[0];
        String cardType = item[1];
        int cardValue = item[2];
        String cardImgUrl = 'assets/images/cards/' + item[3];
        Card aCard = Card(
            name: cardName,
            type: cardType,
            value: cardValue,
            imgUrl: cardImgUrl);
        cardList.add(aCard);
      }
      return cardList;
    }
  }

  Future<Map<String, List<int>>> getCategoryTotals(List<Card> cardList) async {
    Map<String, List<int>> catTotals = {};
    for (Card card in cardList) {
      if (!catTotals.containsKey(card.type)) {
        catTotals[card.type] = [0, 0, 0, 0];
      }
    }
    return catTotals;
  }

  Future<void> initializeSwipeItems() async {
    cards = await getCards();
    categoryTotals = await getCategoryTotals(cards);
    for (int i = 0; i < cards.length; i++) {
      _swipeItems.add(SwipeItem(
          content: cards[i],
          likeAction: () {
            cards[i].skillLevel = 2;
            categoryTotals[cards[i].type]![2] += 1;
            categoryTotals[cards[i].type]![3] += cards[i].value;
          },
          nopeAction: () {
            cards[i].skillLevel = 0;
            categoryTotals[cards[i].type]![0] += 1;
            categoryTotals[cards[i].type]![3] += 0;
          },
          superlikeAction: () {
            cards[i].skillLevel = 1;
            categoryTotals[cards[i].type]![1] += 1;
            categoryTotals[cards[i].type]![3] += cards[i].value ~/ 2;
          }));
    }

    setState(() {
      _matchEngine = MatchEngine(swipeItems: _swipeItems);
    });
  }

  @override
  void initState() {
    super.initState();
    initializeSwipeItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: _matchEngine != null
            ? Container(
                child: Column(children: [
                Container(
                  height: 550,
                  child: SwipeCards(
                    matchEngine: _matchEngine!,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Image.asset(_swipeItems[index].content.imgUrl),
                            ],
                          ),
                        ),
                      );
                    },
                    onStackFinished: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertMenu(
                                content: "Finished",
                                actions: [],
                              ));
                      categoryTotals.forEach((key, value) {
                        updateSkillCount(
                            key, value[2], value[1], value[0], value[3]);
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          _matchEngine!.currentItem!.nope();
                        },
                        child: Text("Don't Have")),
                    ElevatedButton(
                        onPressed: () {
                          _matchEngine!.currentItem!.superLike();
                        },
                        child: Text("Somewhat Have")),
                    ElevatedButton(
                        onPressed: () {
                          _matchEngine!.currentItem!.like();
                        },
                        child: Text("Have"))
                  ],
                )
              ]))
            : Text("Loading"));
  }
}

class Card {
  final String name;
  final String type;
  final String imgUrl;
  final int value;
  dynamic skillLevel;

  Card({
    required this.name,
    required this.type,
    required this.imgUrl,
    required this.value,
    skillLevel = 0,
  });

  @override
  String toString() {
    return "{ name : ${this.name}, type: ${this.type}, value: ${this.value}, imgUrl: ${this.imgUrl}, skillLevel: ${this.skillLevel} }";
  }
}
