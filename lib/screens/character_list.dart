import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/models/hogwarts_data.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:harry_potter/styles/app_styles.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Benvinguts a Hogwarts", style: AppStyles.potterStyle),
      ),
      body: Consumer<HogwartsData>(
        builder: (context, hogwartsData, child) {
          return ListView(
            children: [
              for (Character character in hogwartsData.characters.values)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    leading: Hero(
                      tag: character.name,
                      child: Image.network(character.urlImage),
                    ),
                    title: Text(character.name),
                    subtitle: Text("${character.ratings} valoracions"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CharacterDetail(characterId: character.id),
                        ),
                      );
                    },
                    trailing: IconButton(
                      icon: (hogwartsData.isFavorite(character.id))
                          ? Icon(Icons.favorite, color: Colors.purple)
                          : Icon(Icons.favorite_border, color: Colors.purple),
                      onPressed: () {
                        hogwartsData.toggleFavorite(character.id);
                      },
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
