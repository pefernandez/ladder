import 'package:flutter/material.dart';

class TimelineWidget extends StatefulWidget {

  final String name;

  TimelineWidget({this.name});

  @override
  State<StatefulWidget> createState() => new TimelineWidgetState(name: this.name);
}

class TimelineWidgetState extends State<TimelineWidget> {

  final String name;
  TimelineWidgetState({this.name});

  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
      body: new Center(child: new Text('Timeline')),
    );
  }
}