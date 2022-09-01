import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/widgets/main_drawer.dart';

import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List favoriteList;
  final Function deleteItemFromFavoriteList;
  FavoriteScreen(this.favoriteList, this.deleteItemFromFavoriteList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: favoriteList.isEmpty
            ? Center(
                child: Text("you haven't add any item to your favorite list"),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Dismissible(
                    onDismissed: (direction) =>
                        deleteItemFromFavoriteList(favoriteList[index]),
                    key: Key("1 $index"),
                    child: mealItem(
                      meal: favoriteList[index],
                    ),
                  );
                },
                itemCount: favoriteList.length),
      ),
      drawer: MainDrawer(),
    );
  }
}
