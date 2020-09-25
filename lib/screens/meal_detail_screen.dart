import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/utils/dummy_data.dart';
import 'package:meals/utils/screen_size_config.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealId;

  MealDetailScreen(this.mealId);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: ScreenSizeConfig.blockSizeVertical * 1),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius:
            BorderRadius.circular(ScreenSizeConfig.blockSizeVertical * 3),
      ),
      margin: EdgeInsets.all(ScreenSizeConfig.blockSizeVertical * 3),
      padding: EdgeInsets.all(ScreenSizeConfig.blockSizeVertical * 3),
      height: ScreenSizeConfig.blockSizeVertical * 40,
      width: ScreenSizeConfig.blockSizeHorizontal * 80,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == this.mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: ScreenSizeConfig.blockSizeVertical * 30,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenSizeConfig.blockSizeVertical * 3,
                      horizontal: ScreenSizeConfig.blockSizeHorizontal * 10,
                    ),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
