import 'package:flutter/material.dart';
import 'package:meals/data/category_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onToggleFavorite,
  });
  final Category category;
  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final filteredMeals = meals
            .where(
              (meal) => meal.categories.contains(
                category.id,
              ),
            )
            .toList();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
              onToggleFavorite:
                  onToggleFavorite, // Replace with actual meals for the category
            ),
          ),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category.title,
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
}
