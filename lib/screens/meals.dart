import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });
  final String? title;
  final List<Meal> meals;
  void selectMeal(
    BuildContext context,
    Meal meal,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetails(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onSelectMeal: (meal) =>
            selectMeal(context, meal),
      ),
    );
    if (meals.isEmpty) {
      return Scaffold(
        appBar: title != null
            ? AppBar(
                title: Text(
                  title!,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary,
                      ),
                ),
                centerTitle: true,
              )
            : null,
        body: Center(
          child: Text(
            "No meals found!",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary,
                ),
          ),
        ),
      );
    }

    if (title == null || title!.isEmpty) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
      ),
      body: content,
    );
  }
}
