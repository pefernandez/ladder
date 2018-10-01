import 'package:flutter/material.dart';

class GameReporterWidget extends StatelessWidget {

  @override
  Widget build (BuildContext ctx) {
    return BottomSheet(
      builder: (ctx) => new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Center(child: new Text('Who did you beat?')),
        ]
      ),
      onClosing: () {},
    );
  }

}