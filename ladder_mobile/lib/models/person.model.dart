import './game-result.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    people.update(
      match.winner,
      (int c) => people[match.winner] + 1,
      ifAbsent: () => 1
    );

    people.update(
      match.loser,
      (int c) => people[match.loser] - 1,
      ifAbsent: () => -1
    );
    List<GameResult> rest = matches.skip(1).toList();
    return scores(people, rest);
  }
}




