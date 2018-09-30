import 'dart:ui' as ui;
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
      padding: EdgeInsets.fromLTRB(18.0, 48.0, 0.0, 18.0),
      child: new ClipRect(
        child: new Stack(
          children: [
            new Positioned(
              width: 300.0,
              height: 200.0,
              top: 5.0,
              left: 0.0,
              child: new Text(
                this.title,
                style: this._kopStyle.copyWith(color: Colors.black.withOpacity(0.5)),
              ),
            ),
            new BackdropFilter(
              filter: new ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: new Text(this.title, style: this._kopStyle),
            ),
          ],
        ),
      )
    );
  }

}