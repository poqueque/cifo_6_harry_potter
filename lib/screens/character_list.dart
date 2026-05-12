import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:harry_potter/services/hogwarts_data.dart';
import 'package:harry_potter/services/preferences.dart';
import 'package:harry_potter/styles/app_styles.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({super.key});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  bool showSubtitles = false;

  @override
  void initState() {
    super.initState();
    showSubtitles = Preferences.instance.getShowSubtitles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Benvinguts a Hogwarts", style: AppStyles.potterStyle),
        actions: [
          Switch(
            value: showSubtitles,
            onChanged: (value) {
              showSubtitles = value;
              Preferences.instance.setShowSubtitle(value);
              setState(() {});
            },
          ),
        ],
      ),
      body: Consumer<HogwartsData>(
        builder: (context, hogwartsData, child) {
          return ListView(
            children: [
              for (Character character in hogwartsData.characters)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    leading: Hero(
                      tag: character.name,
                      child: Image.network(character.urlImage),
                    ),
                    title: Text(character.name),
                    subtitle: showSubtitles
                        ? Text("${character.ratings} valoracions")
                        : null,
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
