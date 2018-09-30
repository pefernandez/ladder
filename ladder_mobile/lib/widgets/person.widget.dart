import 'package:flutter/material.dart';
import '../models/person.model.dart';

class PersonWidget extends StatelessWidget{

  final Person person;
  PersonWidget({this.person});

  @override
  Widget build(BuildContext ctx) => new Row(children: [
    new Text(this.person.name);
  ]);

}