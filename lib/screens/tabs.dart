import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/data/category_data.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() =>
      _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  final List<Meal> _favoriteMeals = [];
  void toggleFavorite(Meal meal) {
    final isExisting = _favoriteMeals.contains(
      meal,
    );
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
    }
    ;
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      Categories(
        onToggleFavorite: (categoryId) {
          final selectedCategory =
              availableCategories.firstWhere(
                (category) =>
                    category.id == categoryId,
              );
          final filteredMeals = meals
              .where(
                (meal) =>
                    meal.categories.contains(
                      selectedCategory.id,
                    ),
              )
              .toList();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MealsScreen(
                title: selectedCategory.title,
                meals: filteredMeals,
                onToggleFavorite: toggleFavorite,
              ),
            ),
          );
        },
      ),
      MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: toggleFavorite,
      ),
    ];
    var appBarTitle = 'Categories';
    if (_selectedIndex == 1) {
      appBarTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
      ),
      body: _screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(
          context,
        ).colorScheme.primary,
        onTap: (index) {
          _selectScreen(index);
        },
      ),
    );
  }
}
