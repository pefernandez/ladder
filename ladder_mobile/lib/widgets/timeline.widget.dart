import 'package:flutter/material.dart';
import '../models/game-result.model.dart';
import '../models/Timeline.model.dart';

class TimelineWidget extends StatefulWidget {

  final String name;

  TimelineWidget({this.name});

  @override
  State<StatefulWidget> createState() => new TimelineWidgetState(name: this.name);
}

class TimelineWidgetState extends State<TimelineWidget> {
  final String name;
  List<GameResult> games = [];
  TimelineWidgetState({this.name});

  @override
  initState() {
    _getGames();
    super.initState();
  }

  void _getGames() async {
    this.games = await Timeline.getFor(name: this.name);
    setState((){ });
  }

  @override
  Widget build(BuildContext ctx) {

    List<ListTile> list = List.generate(this.games.length, (int i) =>
      new ListTile(
        leading: new Text(this.games[i].winner),
        trailing: new Text(this.games[i].loser),
        subtitle: new Text(this.games[i].timestamp.toIso8601String()),
      )
    );

    return new Scaffold(
      body: new Column(
        children: list,
      ),
    );
  }
}