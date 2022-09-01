import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget BuildListTile(
    IconData icon, String title, BuildContext ctx, String route) {
  return ListTile(
    leading: Icon(
      icon,
    ),
    title: Text(title),
    onTap: () async {
      Navigator.of(ctx).pushReplacementNamed(route);
    },
  );
}

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Text(
              "Cooking up",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: 20),
          BuildListTile(
              Icons.restaurant_outlined, "Meal", context, "/tabscreen"),
          BuildListTile(Icons.filter_1_outlined, "Filter", context, "/filter"),
        ],
      ),
    );
  }
}
