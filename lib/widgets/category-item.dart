import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/screens/category_meals_screen.dart';

class categoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const categoryItem({
    Key? key,
    required this.id,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.of(context).pushNamed("/category_item", arguments: {
          "id": id,
          "title": title,
        });
      }),
      child: Container(
        child: Text(title),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color.withOpacity(1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
      ),
    );
  }
}
