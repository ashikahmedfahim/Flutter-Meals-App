import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => MealDetailsScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text(
        'No meals found',
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: ((context, index) => MealItem(
            meal: meals[index],
            onSelectMeal: (meal) {
              selectMeal(context, meal);
            })),
        itemCount: meals.length,
      );
    }

    if (title == null) return content;

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
