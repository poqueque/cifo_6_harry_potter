import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  const Rating({super.key, required this.stars, this.onClickStar});

  final double stars;
  final Function(int)? onClickStar;

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  late double starsDisplayed;

  @override
  void initState() {
    super.initState();
    starsDisplayed = widget.stars;
  }

  @override
  void didUpdateWidget(covariant Rating oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.onClickStar == null) starsDisplayed = widget.stars;
  }

  @override
  Widget build(BuildContext context) {
    final Color color = (widget.onClickStar == null)
        ? Colors.black87
        : Colors.purple;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          InkWell(
            onTap: () {
              if (widget.onClickStar == null) return;
              debugPrint("Clicked $i");
              starsDisplayed = i.toDouble();
              setState(() {});
              widget.onClickStar!(i);
            },
            child: (i <= starsDisplayed)
                ? Icon(Icons.star, color: color)
                : (i <= starsDisplayed + 0.5)
                ? Icon(Icons.star_half, color: color)
                : Icon(Icons.star_border, color: color),
          ),
      ],
    );
  }
}
