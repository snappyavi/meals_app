import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_meals_app/screens/meal_details.dart';
import 'package:udemy_meals_app/widgets/meal_item.dart';

import '../model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    // required this.onToggleFavourite,
  });

  //? makes things optional
  final String? title;
  final List<Meal> meals;

  // //this is for button
  // //takes meal as an input
  // //ontoggle is name
  // //adds or remove
  // final void Function(Meal meal) onToggleFavourite;

  void selectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealDetailsScreen(
              meal: meal,
              // onToggleFavourite: onToggleFavourite,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Uh oh.....nothing here!",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Try different category",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder:
            (ctx, index) => MealItem(
              meal: meals[index],

              //this way only meal is passed to the page
              onSelectMeal: (meal) {
                selectMeal(meal, context);
              },
            ),
      );
    }

    //if title returns null the next one do not execute
    if (title == null) {
      return content;
    }

    //! ensures its not null as if null this wont be executed
    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
