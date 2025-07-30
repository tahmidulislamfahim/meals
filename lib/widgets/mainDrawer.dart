import 'package:flutter/material.dart';

class Maindrawer extends StatelessWidget {
  const Maindrawer({
    super.key,
    required this.onSelectScreen,
  });
  final void Function(String identifier)
  onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 50,
                  color: Theme.of(
                    context,
                  ).colorScheme.primary,
                ),
                const SizedBox(width: 20),
                Text(
                  "Cooking Up",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text(
              "Meals",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                    color: Color.fromARGB(
                      255,
                      255,
                      255,
                      255,
                    ),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              "Filters",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(
                      255,
                      255,
                      255,
                      255,
                    ),
                  ),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
