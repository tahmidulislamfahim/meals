import 'package:flutter/material.dart';

// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/mainDrawer.dart';
enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filters, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;
  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.currentFilters[Filters.glutenFree]!;
    _isLactoseFree = widget.currentFilters[Filters.lactoseFree]!;
    _isVegetarian = widget.currentFilters[Filters.vegetarian]!;
    _isVegan = widget.currentFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      // drawer: Maindrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop(); // Close the drawer
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (context) => const TabsScreen()),
      //       );
      //     }
      //   },
      // ),
      body: PopScope(
        canPop: false, // Prevents popping the screen
        onPopInvokedWithResult: (didpop, result) {
          if (!didpop) {
            Navigator.of(context).pop({
              Filters.glutenFree: _isGlutenFree,
              Filters.lactoseFree: _isLactoseFree,
              Filters.vegetarian: _isVegetarian,
              Filters.vegan: _isVegan,
            });
          }
        },
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              value: _isGlutenFree,
              onChanged: (value) {
                setState(() {
                  _isGlutenFree = value;
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              value: _isLactoseFree, // Placeholder for lactose-free switch
              onChanged: (value) {
                setState(() {
                  _isLactoseFree = value; // Update lactose-free state
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Only include vegetarian meals.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              value: _isVegetarian, // Placeholder for vegetarian switch
              onChanged: (value) {
                setState(() {
                  _isVegetarian = value; // Update vegetarian state
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              value: _isVegan, // Placeholder for vegan switch
              onChanged: (value) {
                setState(() {
                  _isVegan = value; // Update vegan state
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
