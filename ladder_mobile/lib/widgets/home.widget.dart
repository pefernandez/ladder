import 'package:flutter/material.dart';
import '../models/person.model.dart';
import './person.widget.dart';
import './title.widget.dart';
import '../models/game-result.model.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {

  List<Person> people = [];
  Person me = new Person(name: 'Damoon', points: 1500);
  final RadialGradient _gradient = const RadialGradient(
    center: const Alignment(0.7, -1.0),
    stops: [0.2, 1.4],
    radius: 1.8,
    colors: [
      const Color.fromARGB(255, 109, 82, 190),
      const Color.fromARGB(255, 226, 51, 51),
    ]
  );

  @override
  initState() {
    _getPeople();
    super.initState();
  }

  _getPeople () {
    GameResult.getAll().listen((snapshot) {
      List<GameResult> matches = snapshot.documents.map((match) => new GameResult(
        winner: match['winner'],
        loser: match['loser'],
        timestamp: match['timestamp'],
      )).toList();
      setState(() {
        this.people = Person.scores({}, matches);
        this.people.sort((a, b) => a.points > b.points ? -1 : 1);
      });
    });
  }

  @override
  Widget build(BuildContext ctx) {

    List<PersonWidget> list = this.people.map(
      (Person person) => new PersonWidget(person: person, me: this.me)
    ).toList();

    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          gradient: this._gradient,
        ),
        child: new Column(children: [
          new TitleWidget('The King of Pong'),
          new Expanded(
            child: new Padding(
              padding: new EdgeInsets.only(left: 24.0, right: 24.0),
              child: new ListView(children: list)
            )
          ),
        ]),
      ),
    );
  }
}