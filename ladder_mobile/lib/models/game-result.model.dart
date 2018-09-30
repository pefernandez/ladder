import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class GameResult {
  final String winner;
  final String loser;
  final DateTime timestamp;

  GameResult({this.winner, this.loser, this.timestamp});

  @override
  toString() {
    return '${this.winner} beat ${this.loser}';
  }

  static Stream<QuerySnapshot> getAll () {
    return Firestore.instance
      .collection('matches')
      .orderBy('timestamp', descending: false)
      .snapshots();
  }
}