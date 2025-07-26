import 'package:flutter/material.dart';
import 'package:grocery_app/const/theme_data.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/screens/btm_bar.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themechangeProvider = DarkThemeProvider();

  void getCurrentTheme() async {
    // This function can be used to retrieve the current theme status
    // from DarkThemePrefs if needed in the future.
    themechangeProvider.setDarkTheme = await themechangeProvider.darkThemePrefs
        .getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){
          return themechangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider , child) {
        
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(  themeProvider.getDarkTheme, context),
          
            home: BottomBarScreen(),
          );
        }
      ),
    );
  }
}
