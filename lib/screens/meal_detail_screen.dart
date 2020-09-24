import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealId;

  MealDetailScreen(this.mealId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
      ),
      body: Center(
        child: Text('The meal - $mealId!'),
      ),
    );
  }
}
