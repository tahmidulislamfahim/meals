import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/mainDrawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() =>
      _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  var title = "Pick your Category";
  final List<Meal> _favoriteMeals = [];
  void toggleFavorite(Meal meal) {
    final isExisting = _favoriteMeals.contains(
      meal,
    );
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        showInfoMessage(
          context,
          "Meal removed from favorites!",
        );
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      showInfoMessage(
        context,
        "Meal added to favorites!",
      );
    }
  }

  void showInfoMessage(
    BuildContext context,
    String message,
  ) {
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
          message,
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

    // Uncomment the following lines to show a SnackBar instead of a dialog

    // ScaffoldMessenger.of(context).removeCurrentSnackBar();
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(message),
    //     duration: const Duration(seconds: 2),
    //   ),
    // );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      title = index == 0
          ? "Pick your Category"
          : "Your Favorites";
    });
  }

  void setScreen(String identifier) {
    if (identifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              const FiltersScreen(),
        ),
      );
    } else {
      Navigator.of(
        context,
      ).pop(); // Close the drawer
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePageIndex = Categories(
      onToggleFavorite: toggleFavorite,
    );
    if (_selectedPageIndex == 1) {
      activePageIndex = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: toggleFavorite,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
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
      drawer: Maindrawer(
        onSelectScreen: setScreen,
      ),
      body: activePageIndex,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
