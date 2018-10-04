import 'package:flutter/material.dart';
import '../models/game.model.dart';
import '../models/Timeline.model.dart';
import './game.widget.dart';
import 'title.widget.dart';

class TimelineWidget extends StatefulWidget {

  final String name;

  TimelineWidget({this.name});

  @override
  State<StatefulWidget> createState() => new TimelineWidgetState(name: this.name);
}

class TimelineWidgetState extends State<TimelineWidget> {
  final String name;
  List<Game> games = [];
  TimelineWidgetState({this.name});
  int wins = 0;
  int losses = 0;
  TextStyle infoStyle = new TextStyle(
    color: Colors.white,
    fontSize: 14.0,
    fontFamily: 'Montserrat',
  );
  final RadialGradient gradient = const RadialGradient(
    center: const Alignment(0.7, -1.0),
    stops: [0.2, 1.4],
    radius: 1.8,
    colors: [
      const Color.fromARGB(255, 61, 132, 142),
      const Color.fromARGB(255, 204, 85, 85),
    ]
  );

  @override
  initState() {
    _getGames();
    super.initState();
  }

  void _getGames() async {
    this.games = await Timeline.getFor(name: this.name);
    setState((){
      this.wins = this.games.where((game) => game.winner == this.name).length;
      this.losses = this.games.length - this.wins;
    });
  }
  

  @override
  Widget build(BuildContext ctx) {

    String percent = (wins / games.length * 100).toStringAsFixed(2);
    List<GameWidget> list = List.generate(this.games.length, (int i) =>
      new GameWidget(game: this.games[i], name: this.name)
    );

    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          gradient: this.gradient,
        ),
        child: new Column(children: [
          new TitleWidget('$name\'s History'),
          new Text('${wins}W / ${losses}L ($percent%)', style: infoStyle),
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