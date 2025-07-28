import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,
  });
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onToggleFavorite: (Meal meal) {
          // Handle favorite toggle logic here
        },
      ),
    );

    if (meals.isEmpty) {
      return Scaffold(
        appBar: title != null
            ? AppBar(
                title: Text(title!),
                centerTitle: true,
              )
            : null,
        body: Center(
          child: Text(
            'No meals found for this category.',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface,
                ),
          ),
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        centerTitle: true,
      ),
      body: content,
    );
  }
}
