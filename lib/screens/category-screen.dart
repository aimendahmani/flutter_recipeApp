import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/dummy_data.dart';
import 'package:flutter_recipe_app/widgets/category-item.dart';

class categoryScreen extends StatelessWidget {
  const categoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: DUMMY_CATEGORIES
          .map((catData) => categoryItem(
                id: catData.id,
                title: catData.title,
                color: catData.color,
              ))
          .toList(),
    );
  }
}
