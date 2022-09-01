import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/dummy_data.dart';
import 'package:flutter_recipe_app/widgets/meal_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  bool Gluten_free = false;
  bool Lactose_free = false;
  bool isVegetarian = false;
  bool isVegan = false;
  void getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      Gluten_free = pref.getBool("gluten") ?? false;
      Lactose_free = pref.getBool("lactose") ?? false;
      isVegetarian = pref.getBool("vegetarian") ?? false;
      isVegan = pref.getBool("vegan") ?? false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    final id = arguments["id"];
    final title = arguments["title"];
    var availableMealsList;
    setState(() {
      final mealList = DUMMY_MEALS.where((element) {
        if (!element.isGlutenFree && Gluten_free) {
          return false;
        }
        if (!element.isLactoseFree && Lactose_free) {
          return false;
        }
        if (!element.isVegetarian && isVegetarian) {
          return false;
        }
        if (!element.isVegan && isVegan) {
          return false;
        }
        return true;
      }).toList();
      print("g $Gluten_free");
      print("l $Lactose_free");
      print("Vgt $isVegetarian");
      print("v $isVegan");
      availableMealsList = mealList
          .where(
            (element) => element.categories.contains(id),
          )
          .toList();
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF87474),
        title: Text(arguments["title"]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemBuilder: (ctx, index) {
              return mealItem(
                meal: availableMealsList[index],
              );
            },
            itemCount: availableMealsList.length),
      ),
    );
  }
}
