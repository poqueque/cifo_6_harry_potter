class Character {
  final String urlImage;
  final String name;
  final int strength;
  final int magic;
  final int speed;
  int totalStars = 0;
  int ratings = 0;

  double get average => (ratings == 0) ? 0 : totalStars / ratings;

  Character({
    required this.urlImage,
    required this.name,
    required this.strength,
    required this.magic,
    required this.speed,
  });
}

List<Character> characters = [
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
