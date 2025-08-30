import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favourites_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref
        .watch(favoriteMealsProvider)
        .contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.primary,
              ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(
                    begin: 0.5,
                    end: 1,
                  ).animate(animation),

                  //turns: animation,
                  child: child,
                );
              },
              child: Icon(
                favoriteMeals
                    ? Icons.favorite
                    : Icons.favorite_border,
                key: ValueKey(favoriteMeals),
              ),
            ),
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleFavorite(meal);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Warning',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  content: Text(
                    wasAdded
                        ? 'Meal added to favorites!'
                        : 'Meal removed from favorites!',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface,
                        ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Hero(
                    tag: meal.id,
                    child: Image.network(
                      meal.imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Ingredients',
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
            ),
            // Displaying ingredients in a simple list
            for (final ingredient in meal.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Text(
                  ingredient,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface,
                      ),
                ),
              ),
            // Optional: Uncomment if you want to display ingredients in a list
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics:
            //       NeverScrollableScrollPhysics(),
            //   itemCount: meal.ingredients.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       leading: Icon(Icons.check),
            //       title: Text(
            //         meal.ingredients[index],
            //       ),
            //     );
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Steps',
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
            ),
            // Displaying steps in a simple list
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Text(
                  step,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface,
                      ),
                ),
              ),
            // Optional: Uncomment if you want to display steps in a list
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics:
            //       NeverScrollableScrollPhysics(),
            //   itemCount: meal.steps.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       leading: CircleAvatar(
            //         child: Text('${index + 1}'),
            //       ),
            //       title: Text(meal.steps[index]),
            //     );
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Duration: ${meal.duration} min',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Complexity: ${meal.complexity.name}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Affordability: ${meal.affordability.name}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
