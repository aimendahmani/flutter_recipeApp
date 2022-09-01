import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:flutter_recipe_app/main.dart';

class mealItem extends StatelessWidget {
  final Meal meal;

  const mealItem({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed("/meal_detail", arguments: {
            "meal": meal,
          });
        },
        child: SizedBox(
          height: 300,
          width: 150,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      meal.imageUrl,
                      fit: BoxFit.fill,
                      height: 240,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      constraints: BoxConstraints(minWidth: 100, maxWidth: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black54,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        meal.title,
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    newMethod(
                      Icon(Icons.av_timer),
                      meal.duration.toString(),
                    ),
                    newMethod(
                      Icon(Icons.work_outline),
                      meal.complexity.name,
                    ),
                    newMethod(
                      Icon(Icons.attach_money_outlined),
                      meal.affordability.name,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row newMethod(Icon icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        icon,
        SizedBox(width: 6),
        Text("$text"),
      ],
    );
  }
}
