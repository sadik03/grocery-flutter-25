import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/categories_widgets.dart';

class CategorisScreen extends StatelessWidget {
  const CategorisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 240 / 250,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(6, (index) {
                return CategoriesWidget();
              }),
            ),
          ),
        ),
      ),
    );
  }
}
