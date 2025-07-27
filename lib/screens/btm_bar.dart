import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/screens/cart.dart';
import 'package:grocery_app/screens/categoris.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/user.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 1;
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': 'Home'},
    {'page': const CategorisScreen(), 'title': 'Categories'},
    {'page': const CartScreen(), 'title': 'Cart'},
    {'page': const UserScreen(), 'title': 'User'},
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDarkMode = themeState.getDarkTheme;
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedIndex]['title'])),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDarkMode
            ? Theme.of(context).cardColor
            : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        unselectedItemColor: _isDarkMode ? Colors.white10 : Colors.black12,
        selectedItemColor: _isDarkMode
            ? Colors.lightBlue.shade200
            : Colors.black87,

        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? IconlyBold.category : IconlyLight.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2,
            ),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
