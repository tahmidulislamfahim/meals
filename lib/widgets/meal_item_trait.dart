import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.schedule,
              color: Colors.white,
            ),
            const SizedBox(width: 6),
            Text(
              '${meal.duration} min',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.work,
              color: Colors.white,
            ),
            const SizedBox(width: 6),
            Text(
              meal.complexity.name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.attach_money,
              color: Colors.white,
            ),
            const SizedBox(width: 6),
            Text(
              meal.affordability.name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
