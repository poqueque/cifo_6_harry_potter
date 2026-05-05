import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';

class HogwartsData extends ChangeNotifier {
  Map<int, Character> characters = {
    1: Character(
      id: 1,
      urlImage:
          "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg",
      name: "Harry Potter",
      strength: 8,
      magic: 9,
      speed: 9,
    ),
    2: Character(
      id: 2,
      urlImage:
          "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1000?cb=20120729103114&path-prefix=es",
      name: "Hermione Granger",
      strength: 7,
      magic: 10,
      speed: 9,
    ),
    3: Character(
      id: 3,
      urlImage:
          "https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg",
      name: "Ron Weasley",
      strength: 8,
      magic: 8,
      speed: 6,
    ),
  };

  List<int> favorites = [];

  void addRating(int characterId, int newRating) {
    Character? character = characters[characterId];
    if (character == null) return;
    character.ratings++;
    character.totalStars += newRating;
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
