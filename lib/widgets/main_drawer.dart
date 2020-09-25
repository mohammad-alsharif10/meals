import 'package:flutter/material.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/utils/screen_size_config.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenSizeConfig.blockSizeVertical * 30,
            width: double.infinity,
            padding: EdgeInsets.all(ScreenSizeConfig.blockSizeVertical * 5),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: ScreenSizeConfig.blockSizeVertical * 5,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) {
                  return FiltersScreen();
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
