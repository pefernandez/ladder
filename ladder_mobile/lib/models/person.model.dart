import './game-result.model.dart';

class Person {
  final String name;
  final int points;
  Person({this.name, this.points});

  static getAll() {

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
    if (people.containsKey(match.winner)) {
      people.update(match.winner, (int covariant) => people[match.winner] + 1);
    } else {
      people[match.winner] = 1;
    }

    if (people.containsKey(match.loser)) {
      people.update(match.loser, (int covariant) => people[match.loser] - 1);
    } else {
      people[match.loser] = -1;
    }
    List<GameResult> rest = matches.skip(1).toList();
    return scores(people, rest);
  }
}




