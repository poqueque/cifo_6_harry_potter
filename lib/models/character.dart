import 'package:isar_community/isar.dart';

part 'character.g.dart';

@collection
class Character {
  Id id = Isar.autoIncrement;
  final String urlImage;
  final String name;
  final int strength;
  final int magic;
  final int speed;
  int totalStars = 0;
  int ratings = 0;

  @ignore
  double get average => (ratings == 0) ? 0 : totalStars / ratings;

  Character({
    required this.urlImage,
    required this.name,
    required this.strength,
    required this.magic,
    required this.speed,
  });
}
