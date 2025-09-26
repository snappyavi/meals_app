import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_meals_app/data/dummy_data.dart';
import 'package:udemy_meals_app/screens/meals.dart';
import 'package:udemy_meals_app/widgets/category_grid_item.dart';

import '../model/category.dart';
import '../model/meal.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  //this is for button
  //takes meal as an input
  //ontoggle is name
  //adds or remove
  // final void Function(Meal meal) onToggleFavourite;

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

//offers multiple features
//for multiple animation; tickerprovider
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  //_animation of type Animation
  //late - value will be available when used first time
  //60 times per second
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      //making sure the animation syncs for every frame
      //this gets the singleticker info to fire animations 60fps
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  //clean up work
  //once the widget is removed
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    //we reach out to dummyMeals
    //where it takes an element meal and retunns list of category ID of categories of meals
    // stored in a variable filteredmeals
    final filteredMeals =
        widget.availableMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();

    //Navigator.push(context, route);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
              // onToggleFavourite: onToggleFavourite,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    //animation: is a listenable object so _animationController
    AnimatedBuilder(
      animation: _animationController,

      child: GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),

        children: [
          //2 methods same output
          //availableCategories.map((category)=>CategoryGridItem(category: category)).toList();

          //category is passed in categoryGridItem
          //o/p 1 grid item per category
          for (final category in availableCategories)
            //return grid item
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
        //  ),
      ),

      //the builder will update the function at every second of tick
      //so here only padding will be evaluated 60fps
      builder:
          //Slide=position=animationController.drive helps based on other values
          //drive - animatable object - tween
          //0 means no offset
          //ends at actual position
          (context, child) => SlideTransition(
            position: Tween(begin: Offset(0, 0.3), end: Offset(0, 0)).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            ),

            child: child,
          ),
    );
    //  Scaffold(
    // // appBar: AppBar(title: Text('Pick your categories')),
    //  body:
  }
}
