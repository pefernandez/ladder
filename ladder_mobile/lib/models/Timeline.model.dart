import 'package:cloud_firestore/cloud_firestore.dart';
import './game-result.model.dart';
import 'dart:async';

class Timeline {
  static Future<List<GameResult>> getFor({String name}) async {
    QuerySnapshot matches = await Firestore.instance
      .collection('matches')
      .orderBy('timestamp', descending: false)
      .getDocuments();

    return matches.documents
    .where((dynamic player) => player['winner'] == name || player['loser'] == name)
    .map((game) => new GameResult(
      winner: game['winner'],
      loser: game['loser'],
      timestamp: game['timestamp'],
    )).toList();
  }
}