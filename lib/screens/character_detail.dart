import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/styles/app_styles.dart';
import 'package:harry_potter/widgets/rating.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.character});
  final Character character;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
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
            tag: widget.character.name,
            child: Image.network(
              widget.character.urlImage,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.image, size: 100);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Rating(stars: widget.character.average),
              Text("${widget.character.ratings} reviews"),
            ],
          ),
          Text(widget.character.name, style: AppStyles.potterStyleBold),
          Rating(stars: 0, onClickStar: onClickStar),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.fitness_center),
                  Text("Força"),
                  Text("${widget.character.strength}"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.auto_fix_normal),
                  Text("Màgia"),
                  Text("${widget.character.magic}"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.speed),
                  Text("Velocitat"),
                  Text("${widget.character.speed}"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onClickStar(int value) {
    widget.character.ratings++;
    widget.character.totalStars += value;
    setState(() {});
  }
}
