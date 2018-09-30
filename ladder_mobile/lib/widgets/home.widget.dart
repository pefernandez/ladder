import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {

  final RadialGradient _gradient = const RadialGradient(
    center: const Alignment(0.7, -1.0),
    stops: [0.2, 1.0],
    radius: 1.9,
    colors: [
      const Color.fromARGB(255, 109, 82, 190),
      const Color.fromARGB(255, 226, 51, 51),
    ]
  );

  final TextStyle _kopStyle = new TextStyle(
    fontSize: 47.0,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext ctx) => new Scaffold(
    body: new Container(
      decoration: new BoxDecoration(
        gradient: this._gradient,
      ),
      child: new Column(children: [
        new Padding(
          padding: EdgeInsets.fromLTRB(22.0, 58.0, 0.0, 18.0),
          child: new Text('King of Pong', style: this._kopStyle)
        ),
        new Center(child: new Text('test')),
      ]),
    )
  );
}