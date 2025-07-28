import 'package:flutter/material.dart';
import 'package:meals/data/category_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/category.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.onToggleFavorite,
  });
  final void Function(Meal meal) onToggleFavorite;
  void _selectCategory(
    BuildContext context,
    Category category,
  ) {
    final filteredMeals = meals.where((meal) {
      return meal.categories.contains(
        category.id,
      );
    }).toList();
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
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
      children: [
        ...availableCategories.map(
          (category) => CategoryGridItem(
            category: category,
            onSelectCategory: () =>
                _selectCategory(
                  context,
                  category,
                ),
          ),
        ),
      ],
    );
  }
}
