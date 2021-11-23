import 'package:community_on_demand_code_demo/Features/AlertMenu.dart';
import 'package:community_on_demand_code_demo/Services/user_data_services.dart';
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
  Map<String, List<int>> categoryTotals = {};

  List<Card> cards = [
    //awareness: 5 cards
    Card(
      name: 'career awareness',
      type: 'awareness',
      imgUrl: 'assets/images/cards/awareness - career awareness.jpg',
      value: 10,
    ),
    Card(
      name: 'career exploration',
      type: 'awareness',
      imgUrl: 'assets/images/cards/awareness - career exploration.jpg',
      value: 10,
    ),
    Card(
      name: 'fafsa',
      type: 'awareness',
      imgUrl: 'assets/images/cards/awareness - fafsa.jpg',
      value: 10,
    ),
    Card(
      name: 'mission statement',
      type: 'awareness',
      imgUrl: 'assets/images/cards/awareness - mission statement.jpg',
      value: 10,
    ),
    Card(
      name: 'salary',
      type: 'awareness',
      imgUrl: 'assets/images/cards/awareness - salary.jpg',
      value: 10,
    ),

    //innovation: 12 cards
    Card(
      name: 'competitive advantage',
      type: 'innovation',
      imgUrl: 'assets/images/cards/innovation - competitive advantage.jpg',
      value: 20,
    ),
    Card(
      name: 'copyrights',
      type: 'innovation',
      imgUrl: 'assets/images/cards/innovation - copyrights.jpg',
      value: 20,
    ),
    Card(
      name: 'education program',
      type: 'innovation',
      imgUrl: 'assets/images/cards/innovation - education program.jpg',
      value: 20,
    ),
    Card(
      name: 'entertainment program',
      type: 'innovation',
      imgUrl: 'assets/images/cards/innovation - entertainment program.jpg',
      value: 20,
    ),
    Card(
      name: 'guest services program',
      type: 'innovation',
      imgUrl: 'assets/images/cards/innovation - guest services programs.jpg',
      value: 20,
    ),
    Card(
      name: 'operations',
      type: 'innovation',
      imgUrl: 'assets/images/cards/innovation - operations.png',
      value: 20,
    ),
    Card(
      name: 'product life cycle',
      type: 'innovation',
      imgUrl: 'assets/images/cards/innovation - product life cycle.jpg',
      value: 20,
    ),
    Card(
      name: 'products _ services i',
      type: 'innovation',
      imgUrl: 'assets/images/cards/innovation - products _ services i.jpg',
      value: 20,
    ),
    Card(
      name: 'products _ services ii',
      type: 'innovation',
      imgUrl: 'assets/images/cards/innovation - products _ services ii.jpg',
      value: 20,
    ),
    Card(
      name: 'research',
      type: 'innovation',
      imgUrl: 'assets/images/cards/innovation - research.png',
      value: 20,
    ),
    Card(
      name: 'speaker program',
      type: 'innovation',
      imgUrl: 'assets/images/cards/innovation - speaker program.jpg',
      value: 20,
    ),
    Card(
      name: 'supplier',
      type: 'innovation',
      imgUrl: 'assets/images/cards/innovation - supplier.png',
      value: 20,
    ),

    //lead: 11 cards
    Card(
      name: 'communications director',
      type: 'lead',
      imgUrl: 'assets/images/cards/lead - communications director.jpg',
      value: 50,
    ),
    Card(
      name: 'community ecosystem',
      type: 'lead',
      imgUrl: 'assets/images/cards/lead - community ecosystem.jpg',
      value: 50,
    ),
    Card(
      name: 'conflict resolution',
      type: 'lead',
      imgUrl: 'assets/images/cards/lead - conflict resolution.jpg',
      value: 50,
    ),
    Card(
      name: 'culture',
      type: 'lead',
      imgUrl: 'assets/images/cards/lead - culture.jpg',
      value: 50,
    ),
    Card(
      name: 'family _ peers',
      type: 'lead',
      imgUrl: 'assets/images/cards/lead - family _ peers.jpg',
      value: 50,
    ),
    Card(
      name: 'finance director',
      type: 'lead',
      imgUrl: 'assets/images/cards/lead - finance director.jpg',
      value: 50,
    ),
    Card(
      name: 'general manager',
      type: 'lead',
      imgUrl: 'assets/images/cards/lead - general manager.jpg',
      value: 50,
    ),
    Card(
      name: 'leadership',
      type: 'lead',
      imgUrl: 'assets/images/cards/lead - leadership.jpg',
      value: 50,
    ),
    Card(
      name: 'network director',
      type: 'lead',
      imgUrl: 'assets/images/cards/lead - network director.jpg',
      value: 50,
    ),
    Card(
      name: 'team operations',
      type: 'lead',
      imgUrl: 'assets/images/cards/lead - team operations.jpg',
      value: 50,
    ),
    Card(
      name: 'workshops',
      type: 'lead',
      imgUrl: 'assets/images/cards/lead - workshops.jpg',
      value: 50,
    ),

    //skill: 18 cards
    Card(
      name: 'agriculture',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - agriculture.jpg',
      value: 40,
    ),
    Card(
      name: 'architecture',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - architecture.jpg',
      value: 40,
    ),
    Card(
      name: 'art',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - art.jpg',
      value: 40,
    ),
    Card(
      name: 'business',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - business.jpg',
      value: 40,
    ),
    Card(
      name: 'education',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - education.jpg',
      value: 40,
    ),
    Card(
      name: 'film',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - film.jpg',
      value: 40,
    ),
    Card(
      name: 'finance',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - finance.jpg',
      value: 40,
    ),
    Card(
      name: 'government',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - government.jpg',
      value: 40,
    ),
    Card(
      name: 'green energy',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - green energy.jpg',
      value: 40,
    ),
    Card(
      name: 'health sciences',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - health sciences.jpg',
      value: 40,
    ),
    Card(
      name: 'hospitality',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - hospitality.jpg',
      value: 40,
    ),
    Card(
      name: 'human services',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - human services.jpg',
      value: 40,
    ),
    Card(
      name: 'info tech',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - info tech.jpg',
      value: 40,
    ),
    Card(
      name: 'law',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - law.jpg',
      value: 40,
    ),
    Card(
      name: 'manufacturing',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - manufacturing.jpg',
      value: 40,
    ),
    Card(
      name: 'marketing',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - marketing.jpg',
      value: 40,
    ),
    Card(
      name: 'STEAM IP',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - STEAM IP.jpg',
      value: 40,
    ),
    Card(
      name: 'transportation',
      type: 'skill',
      imgUrl: 'assets/images/cards/skill - transportation.jpg',
      value: 40,
    ),

    //workforce:
    Card(
      name: 'advancement',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - advancement.jpg',
      value: 30,
    ),
    Card(
      name: 'appearance',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - appearance.jpg',
      value: 30,
    ),
    Card(
      name: 'budget',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - budget.jpg',
      value: 30,
    ),
    Card(
      name: 'contributions',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - contributions.jpg',
      value: 30,
    ),
    Card(
      name: 'effective communications',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - effective communications.jpg',
      value: 30,
    ),
    Card(
      name: 'feedback',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - feedback.jpg',
      value: 30,
    ),
    Card(
      name: 'help',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - help.jpg',
      value: 30,
    ),
    Card(
      name: 'job market',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - job market.jpg',
      value: 30,
    ),
    Card(
      name: 'job search',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - job search.jpg',
      value: 30,
    ),
    Card(
      name: 'mock interviews',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - mock interviews.jpg',
      value: 30,
    ),
    Card(
      name: 'negotiations',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - negotiations.jpg',
      value: 30,
    ),
    Card(
      name: 'resume',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - resume.jpg',
      value: 30,
    ),
    Card(
      name: 'takes initiative',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - takes initiative.jpg',
      value: 30,
    ),
    Card(
      name: 'thank you',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - thank you.jpg',
      value: 30,
    ),
    Card(
      name: 'time management',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - time management.jpg',
      value: 30,
    ),
    Card(
      name: 'transition',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - transition.jpg',
      value: 30,
    ),
    Card(
      name: 'workplace',
      type: 'workforce',
      imgUrl: 'assets/images/cards/workforce - workplace.jpg',
      value: 30,
    ),
  ];

  @override
  void initState() {
    categoryTotals = {
      'awareness': [0, 0, 0, 0], // [didn't have or use, had but didn't use, had and used, total points]
      'innovation': [0, 0, 0, 0],
      'lead': [0, 0, 0, 0],
      'skill': [0, 0, 0, 0],
      'workforce': [0, 0, 0, 0],
    };
    for (int i = 0; i < cards.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Card(
              name: cards[i].name,
              type: cards[i].type,
              imgUrl: cards[i].imgUrl,
              value: cards[i].value,
          ),
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
                        builder: (BuildContext context) =>
                            AlertMenu(
                              content: "Finished",
                              actions: [],
                            )
                    );
                    categoryTotals.forEach((key, value) {
                      updateSkillCount(key, value[2], value[1], value[0], value[3]);
                    });
                    print(categoryTotals);
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
}


