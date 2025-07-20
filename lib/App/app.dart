import 'package:flutter/material.dart';
import 'package:meals/screans/categories.dart';
import 'package:meals/main.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Categories(
        key: const Key('categories_screen'),
      ),
    );
  }
}
