import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/styles/app_styles.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Harry Potter App", style: AppStyles.potterStyle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: character.name,
            child: Image.network(
              character.urlImage,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.image, size: 100);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < character.stars.round(); i++)
                    Icon(Icons.star),
                  for (int i = 0; i < 5 - character.stars.round(); i++)
                    Icon(Icons.star_border),
                ],
              ),
              Text("${character.ratings} reviews"),
            ],
          ),
          Text(character.name, style: AppStyles.potterStyleBold),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.fitness_center),
                  Text("Força"),
                  Text("${character.strength}"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.auto_fix_normal),
                  Text("Màgia"),
                  Text("${character.magic}"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.speed),
                  Text("Velocitat"),
                  Text("${character.speed}"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
