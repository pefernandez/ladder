import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './game-result.model.dart';

class Person {
  final String name;
  final int points;
  Person({this.name, this.points});

  static getAll() {
    return Firestore.instance
      .collection('people')
      .snapshots();
  }

  @override
  toString() {
    return '${this.name} (${this.points})';
  }

  static List<int> calculateMatch({int a, int b, bool p1Won}) {
    const int K = 32;
    double pA = 1 / (1 + (pow(10, a - b) / 400));
    double pB = 1 / (1 + (pow(10, b - a) / 400));
    double aNew, bNew;
    if (p1Won) { 
      aNew = a + K * (1 - pA); 
      bNew = b + K * (0 - pB); 
    } else { 
      aNew = a + K * (0 - pA); 
      bNew = b + K * (1 - pB); 
    } 

    return [aNew.round(), bNew.round()];
  }

  static List<Person> scores(
    Map<String, int> people,
    List<GameResult> matches
  ) {
    if (matches.length == 0) {
      return people
        .entries
        .map((MapEntry<String, int> entry) => 
          new Person(name: entry.key, points: entry.value)
        ).toList();
    }
    GameResult match = matches[0];
    int ratingWinner = people.containsKey(match.winner) ? people[match.winner] : 1500;
    int ratingLoser = people.containsKey(match.loser) ? people[match.loser] : 1500;
    List<int> newRatings = calculateMatch(a: ratingWinner, b: ratingLoser, p1Won: true);

    debugPrint("${match.timestamp} - ${match.winner} ($ratingWinner) vs. ${match.loser} ($ratingLoser) = ${match.winner} ($newRatings)");

    people.update(
      match.winner,
      (int c) => newRatings[0],
      ifAbsent: () => newRatings[0]
    );

    people.update(
      match.loser,
      (int c) => newRatings[1],
      ifAbsent: () => newRatings[1]
    );
    List<GameResult> rest = matches.skip(1).toList();
    return scores(people, rest);
  }
}




