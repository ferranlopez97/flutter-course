import 'package:flutter/material.dart';

class RatingProgressWidget extends StatelessWidget {
  final double rating;

  const RatingProgressWidget({super.key, required this.rating})
      : assert(rating >= 0.0 && rating <= 10.0);

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;

    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(children: [
        Center(
          child: CircularProgressIndicator(
            value: rating / 10,
            color: Colors.yellow.shade800,
          ),
        ),
        Center(child: Text(rating.toStringAsFixed(1), style: textStyle.titleMedium?.copyWith(color: Colors.orange),)),
      ]),
    );
  }
}
