import 'package:flutter/material.dart';
import 'package:harry_potter/styles/app_styles.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final String url =
      "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        title: Text("Harry Potter App", style: AppStyles.potterStyle),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            url,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.image, size: 100);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < 3; i++) Icon(Icons.star),
                  for (int i = 0; i < 2; i++) Icon(Icons.star_border),
                ],
              ),
              Text("89 reviews"),
            ],
          ),
          Text("Harry Potter", style: AppStyles.potterStyleBold),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.fitness_center),
                  Text("Força"),
                  Text("9"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.auto_fix_normal),
                  Text("Màgia"),
                  Text("10"),
                ],
              ),
              Column(
                children: [Icon(Icons.speed), Text("Velocitat"), Text("8")],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
