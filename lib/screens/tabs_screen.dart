import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/models/meal.dart';
import 'package:flutter_recipe_app/screens/category-screen.dart';
import 'package:flutter_recipe_app/screens/favorite_screen.dart';
import 'package:flutter_recipe_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteList;
  final Function deleteItemFromFavoriteList;
  TabScreen(this.favoriteList, this.deleteItemFromFavoriteList);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _SelectedPageIndex = 0;
  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _screens = [
      {
        "screen": categoryScreen(),
        "title": "Category",
      },
      {
        "screen": FavoriteScreen(
            widget.favoriteList, widget.deleteItemFromFavoriteList),
        "title": "Favorite",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_SelectedPageIndex]["title"] as String),
      ),
      body: _screens[_SelectedPageIndex]["screen"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        selectedFontSize: 16,
        unselectedFontSize: 10,
        backgroundColor: Color(0xffF87474),
        onTap: _selectPage,
        currentIndex: _SelectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star_border_outlined,
            ),
            label: "Favorite",
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  void _selectPage(int value) {
    setState(() {
      _SelectedPageIndex = value;
    });
  }
}
