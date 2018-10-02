import 'package:flutter/material.dart';

class RaisedIconButton extends StatelessWidget {

  final Icon icon;
  final Text label;
  final Function onPressed;

  RaisedIconButton({this.icon, this.label, @required this.onPressed});

  @override
  Widget build(BuildContext ctx) => new Container(
    width: 120.0,
    child: new RaisedButton(
      textColor: Colors.white,
      color: Colors.red,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          this.icon,
          this.label,
        ]
      ),
      onPressed: this.onPressed,
    )
  );
}