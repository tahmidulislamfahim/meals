import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

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
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      title = index == 0
          ? "Pick your Category"
          : "Your Favorites";
    });
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
        title: Text(title),
        centerTitle: true,
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
