import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {

  final String title;
  final TextStyle _kopStyle = new TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );
  
  TitleWidget(this.title);

  @override
  Widget build(BuildContext ctx) {
    return new Padding(
      padding: EdgeInsets.only(top: 48.0, bottom: 18.0),
      child: new Text(
        this.title,
        style: this._kopStyle,
      ),
    );
  }
}