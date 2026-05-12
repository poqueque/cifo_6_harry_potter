import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/services/database.dart';
import 'package:isar_community/isar.dart';

class HogwartsData extends ChangeNotifier {
  List<Character> initialCharacters = [
    Character(
      urlImage:
          "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg",
      name: "Harry Potter",
      strength: 8,
      magic: 9,
      speed: 9,
    ),
    Character(
      urlImage:
          "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1000?cb=20120729103114&path-prefix=es",
      name: "Hermione Granger",
      strength: 7,
      magic: 10,
      speed: 9,
    ),
    Character(
      urlImage:
          "https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg",
      name: "Ron Weasley",
      strength: 8,
      magic: 8,
      speed: 6,
    ),
  ];

  List<Character> characters = [];

  List<int> favorites = [];

  Future<void> init() async {
    characters = await Database.instance.getAllCharacters();
    if (characters.isEmpty) {
      for (Character character in initialCharacters) {
        Database.instance.updateCharacter(character);
        characters.add(character);
      }
    }
    notifyListeners();
  }

  Character getCharacterById(Id characterId) {
    return characters
            .where((character) => characterId == character.id)
            .firstOrNull ??
        characters.first;
  }

  void addRating(Character character, int newRating) {
    character.ratings++;
    character.totalStars += newRating;
    Database.instance.updateCharacter(character);
    notifyListeners();
  }

  void toggleFavorite(int characterId) {
    if (favorites.contains(characterId)) {
      favorites.remove(characterId);
    } else {
      favorites.add(characterId);
    }
    notifyListeners();
  }

  bool isFavorite(int characterId) => favorites.contains(characterId);
}
