import 'package:flutter/material.dart';
import '../models/person.model.dart';

class PersonWidget extends StatelessWidget{

  final Person person;
  final TextStyle _nameStyle = new TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  final TextStyle _pointStyle = new TextStyle(
    fontFamily: 'Montserrat',
    color: Colors.grey.shade200,
    fontSize: 14.0,
  );
  PersonWidget({this.person});

  @override
  Widget build(BuildContext ctx) => new Padding(
    padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        new Text(this.person.name, style: _nameStyle),
        new Text(this.person.points.toString(), style: _pointStyle),
      ]
    )
  );

}