import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_recipe_app/screens/tabs_screen.dart';
import '../models/meal.dart';
import 'package:flutter_recipe_app/main.dart';

Widget BuildSectionTitle(BuildContext context, String text) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}

Widget BuildSectionBody(Widget child) {
  return Container(
    child: child,
    width: 300,
    height: 300,
    //constraints: BoxConstraints(maxHeight: 500, minHeight: 200),
  );
}

class MealDetailScreen extends StatefulWidget {
  final List<Meal> favoriteList;
  final Function setFavoriteList;

  MealDetailScreen(this.favoriteList, this.setFavoriteList);

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, Object>{}) as Map;
    final meal = arguments["meal"];
    bool isFav = false;
    setState(() {
      isFav = favoriteList.contains(meal);
    });
    @override
    void initState() {
      super.initState();
      isFav = favoriteList.contains(meal);
    }

    IconData icon = Icons.abc;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF87474),
        title: Text("${meal.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              BuildSectionTitle(context, "Ingredients"),
              BuildSectionBody(
                ListView.builder(
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 2.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("${meal.ingredients[index]}"),
                    );
                  },
                  itemCount: meal.ingredients.length,
                ),
              ),
              BuildSectionTitle(context, "Steps"),
              BuildSectionBody(
                ListView.builder(
                  itemBuilder: (BuildContext ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffF87474),
                            child: Text("${index + 1}"),
                          ),
                          title: Text("${meal.steps[index]}"),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    );
                  },
                  itemCount: meal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          isFav = widget.setFavoriteList(meal, isFav);
          isFav ? icon = Icons.abc : Icons.access_alarm;
        }),
        child: Icon(isFav ? Icons.star : Icons.star_border),
      ),
    );
  }
}
