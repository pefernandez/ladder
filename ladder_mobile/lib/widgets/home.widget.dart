import 'package:flutter/material.dart';
import '../models/person.model.dart';
import './person.widget.dart';
import './title.widget.dart';
import '../models/game.model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {

  List<Person> people = [];
  List<PersonWidget> list = [];
  final RadialGradient _gradient = const RadialGradient(
    center: const Alignment(0.7, -1.0),
    stops: [0.2, 1.4],
    radius: 1.8,
    colors: [
      const Color.fromARGB(255, 109, 82, 190),
      const Color.fromARGB(255, 226, 51, 51),
    ]
  );

  final Function _onReport = (String name) {
    return () async {
      await http.post('https://us-central1-ladder-41a39.cloudfunctions.net/reportMatch', body: {
        'winner': 'Damoon',
        'loser': name,
      });
    };
  };

  @override
  initState() {
    _getPeople();
    super.initState();
  }

  _getPeople () {
    Game.getAll().listen((snapshot) {
      List<Game> matches = snapshot.documents.map((match) => new Game(
        winner: match['winner'],
        loser: match['loser'],
        timestamp: match['timestamp'],
      )).toList();
      setState(() {
        this.people = Person.scores({}, matches);
        this.people.sort((a, b) => a.points > b.points ? -1 : 1);
        this.list = this.people.map(
          (Person person) => new PersonWidget(person: person, onReport: this._onReport(person.name))
        ).toList();
      });
    });
  }

  @override
  Widget build(BuildContext ctx) {

    Widget first = new Container(
      decoration: new BoxDecoration(
        gradient: this._gradient,
      ),
      child: new Column(children: [
        new TitleWidget('The Monarch of Pong'),
        new Expanded(
          child: new Padding(
            padding: new EdgeInsets.only(left: 24.0, right: 24.0),
            child: new ListView(children: list)
          )
        ),
      ]),
    );

    Widget second = new Center(child: new Text('Implement global history here'));
    List<Widget> widgetList = [first, second];

    return new Scaffold(
      body: new Swiper(
        itemCount: widgetList.length,
        itemBuilder: (BuildContext context, int i) => widgetList[i],
      )
    );
  }
}