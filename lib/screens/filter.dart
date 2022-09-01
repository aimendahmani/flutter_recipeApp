import 'package:flutter/material.dart';

import 'package:flutter_recipe_app/widgets/main_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Filter extends StatefulWidget {
  void setFilters;
  Filter(
    this.setFilters,
  );

  @override
  State<Filter> createState() => _FilterState();
}

bool _Gluten_free = false;

bool _Lactose_free = false;

bool _isVegan = false;

bool _isVegetarian = false;

class _FilterState extends State<Filter> {
  Widget buildSwitchListTile(String title, String description, bool cur_value) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      onChanged: (bool val) => setState(() {
        cur_value = val;
        print(val);
      }),
      value: cur_value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                setState(() {
                  prefs.setBool("gluten", _Gluten_free);
                  prefs.setBool("lactose", _Lactose_free);
                  prefs.setBool("vegetarian", _isVegetarian);
                  prefs.setBool("vegan", _isVegan);
                });
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal filters"),
          ),
          Expanded(
            child: ListView(
              children: [
                // buildSwitchListTile("Gluten_free",
                //     "Only include Gluten free meals", _Gluten_free),
                // buildSwitchListTile("Lactose_free",
                //     "Only include Lactose free meals", _Lactose_free),
                // buildSwitchListTile(
                //     "isVegan", "Only include Vegan meals", _isVegan),
                // buildSwitchListTile("isVegetarian",
                //     "Only include Vegetarian meals", _isVegetarian),
                SwitchListTile(
                  title: Text("gluten free"),
                  subtitle: Text("description"),
                  value: _Gluten_free,
                  onChanged: (bool val) {
                    setState(() {
                      _Gluten_free = val;
                      print(_Gluten_free);
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("lactose free"),
                  subtitle: Text("description"),
                  value: _Lactose_free,
                  onChanged: (bool val) {
                    setState(() {
                      _Lactose_free = val;
                      print(_Lactose_free);
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("vegetarian"),
                  subtitle: Text("description"),
                  value: _isVegetarian,
                  onChanged: (bool val) {
                    setState(() {
                      _isVegetarian = val;
                      print(_isVegetarian);
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("vegan"),
                  subtitle: Text("description"),
                  value: _isVegan,
                  onChanged: (bool val) {
                    setState(() {
                      _isVegan = val;
                      print(_isVegan);
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
