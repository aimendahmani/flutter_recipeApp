import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/screens/category-screen.dart';
import 'package:flutter_recipe_app/screens/category_meals_screen.dart';
import 'package:flutter_recipe_app/screens/favorite_screen.dart';
import 'package:flutter_recipe_app/screens/filter.dart';
import 'package:flutter_recipe_app/screens/meal_detail_screen.dart';
import 'package:flutter_recipe_app/screens/tabs_screen.dart';
import 'package:flutter_recipe_app/widgets/meal_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/meal.dart';

void main() => runApp(
      beginApp(),
    );
List<Meal> favoriteList = [];

class beginApp extends StatefulWidget {
  const beginApp({Key? key}) : super(key: key);

  @override
  State<beginApp> createState() => _beginAppState();
}

class _beginAppState extends State<beginApp> {
  Map<String, bool> filters = {
    "gluten": false,
    "lactose": false,
    "vegetarian": false,
    "vegan": false,
  };

  void setFilters(Map<String, bool> filtersData) {
    filters = filtersData;
  }

  bool setFavoriteList(Meal meal, bool isFavorable) {
    setState(() {
      if (favoriteList.contains(meal)) {
        favoriteList.remove(meal);
        isFavorable = false;
      } else {
        favoriteList.add(meal);
        isFavorable = true;
      }
    });
    return isFavorable;
  }

  void deleteItemFromFavoriteList(Meal meal) {
    setState(() {
      favoriteList.remove(meal);
    });
  }

  late Meal meal;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/category": (context) => categoryScreen(),
        "/category_item": (context) => CategoryMealsScreen(),
        "/meal_detail": (context) =>
            MealDetailScreen(favoriteList, setFavoriteList),
        "/tabscreen": (context) =>
            TabScreen(favoriteList, deleteItemFromFavoriteList),
        "/filter": (context) => Filter(setFilters),
        "/favorite": (context) =>
            FavoriteScreen(favoriteList, deleteItemFromFavoriteList),
      },
      theme: ThemeData(
        primaryColor: Color(0xff3AB0FF),
        scaffoldBackgroundColor: Color(0xffF9F2ED),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffF87474),
        ),
        //accentColor: Color(0xffFFB562),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            //fontFamily: "assets/fonts/RobotoCondensed",
            fontSize: 22,
            color: Color(0xffF87474),
          ),
        ),
      ),
      home: myapp(deleteItemFromFavoriteList),
    );
  }
}

class myapp extends StatefulWidget {
  final Function deleteItemFromFavoriteList;
  const myapp(this.deleteItemFromFavoriteList);

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return TabScreen(favoriteList, widget.deleteItemFromFavoriteList);
  }
}
