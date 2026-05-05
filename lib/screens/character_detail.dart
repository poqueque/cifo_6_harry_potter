import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/models/hogwarts_data.dart';
import 'package:harry_potter/styles/app_styles.dart';
import 'package:harry_potter/widgets/rating.dart';
import 'package:provider/provider.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({super.key, required this.characterId});
  final int characterId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Harry Potter App", style: AppStyles.potterStyle),
      ),
      body: Consumer<HogwartsData>(
        builder: (context, hogwartsData, child) {
          Character character =
              hogwartsData.characters[characterId] ??
              hogwartsData.characters[1]!;

          return Column(
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
                  Rating(stars: character.average),
                  Text("${character.ratings} reviews"),
                ],
              ),
              Text(character.name, style: AppStyles.potterStyleBold),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Rating(
                    stars: 0,
                    onClickStar: (value) {
                      updateData(context, value);
                    },
                  ),
                  IconButton(
                    icon: (hogwartsData.isFavorite(characterId))
                        ? Icon(Icons.favorite, color: Colors.purple)
                        : Icon(Icons.favorite_border, color: Colors.purple),
                    onPressed: () {
                      hogwartsData.toggleFavorite(characterId);
                    },
                  ),
                ],
              ),
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
          );
        },
      ),
    );
  }

  void updateData(BuildContext context, int value) {
    HogwartsData hogwartsData = context.read<HogwartsData>();
    hogwartsData.addRating(characterId, value);
  }
}
