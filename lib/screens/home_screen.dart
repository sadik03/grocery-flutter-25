import 'package:flutter/material.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Center(
        child: SwitchListTile(
          title: Text('Enable Feature'),
          secondary: Icon(
            themeState.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
          ),
          onChanged: (bool value) {
            setState(() {
              themeState.setDarkTheme = value;
            });
            // This is where you would handle the switch change
          },
          value: themeState.getDarkTheme,
        ),
      ),
    );
  }
}
