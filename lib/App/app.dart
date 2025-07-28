import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final brightness = MediaQuery.of(
          context,
        ).platformBrightness;
        final theme = ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(
              255,
              131,
              57,
              0,
            ),
            brightness: brightness,
          ),
          textTheme: GoogleFonts.latoTextTheme(),
        );
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: TabsScreen(
            key: const Key('tabs_screen'),
          ),
        );
      },
    );
  }
}
