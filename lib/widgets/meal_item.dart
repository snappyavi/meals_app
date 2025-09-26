import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:udemy_meals_app/widgets/meal_item_trait.dart';

import '../model/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  //transform enum to tect
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      //ensures the shape is contained
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        //meal value is passed onSelectMeal
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            // network image is loaded smoothly, after displaying nothing as a place holder
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      //wraps the text
                      softWrap: true,
                      //gives ... at the end
                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                   Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      //  crossAxisAlignment: CrossAxisAlignment.,
                        children: [
                          MealItemTrait(
                            icon: Icons.schedule,
                            label: "${meal.duration} min",
                          ),
                          SizedBox(width: 12),
                          MealItemTrait(
                            icon: Icons.work,
                            label: "$complexityText min",
                          ),
                          SizedBox(width: 12),
                          MealItemTrait(icon: Icons.money, label: "$affordabilityText"),
                        ],
                      ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
