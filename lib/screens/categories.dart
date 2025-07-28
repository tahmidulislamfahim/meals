import 'package:flutter/material.dart';
import 'package:meals/data/category_data.dart';
import 'package:meals/widgets/category_grid_item.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.onToggleFavorite,
  });
  final void Function(String categoryId)
  onToggleFavorite;

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
            onToggleFavorite: (meal) {
              onToggleFavorite(category.id);
            },
          ),
        ),
      ],
    );
  }
}
