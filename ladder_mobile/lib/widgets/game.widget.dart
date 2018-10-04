import 'package:flutter/material.dart';
import '../models/game.model.dart';

class GameWidget extends StatelessWidget {
  
  final Game game;
  final String name;
  final TextStyle activeStyle = new TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w400,
    color: Colors.deepOrange.shade400,
  );
  final TextStyle passiveStyle = const TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );

  GameWidget({this.game, this.name});
  
  TextStyle _getStyle(String name, String compare) {
    return name == compare ? this.activeStyle : this.passiveStyle;
  }

  @override
  Widget build(BuildContext ctx) {
    return new Padding(
      padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          new Text(this.game.winner, style: _getStyle(this.game.winner, name)),
          new Text(' beat ', style: this.passiveStyle),
          new Text(' ' + this.game.loser, style: _getStyle(this.game.loser, name))
        ],
      )
    );
  }
}