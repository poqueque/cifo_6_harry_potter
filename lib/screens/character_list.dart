import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:harry_potter/styles/app_styles.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Benvinguts a Hogwarts", style: AppStyles.potterStyle),
      ),
      body: ListView(
        children: [
          for (Character character in characters)
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                leading: Hero(
                  tag: character.name,
                  child: Image.network(character.urlImage),
                ),
                title: Text(character.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CharacterDetail(character: character),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
