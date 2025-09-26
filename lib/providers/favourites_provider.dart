import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_meals_app/providers/filters_provider.dart';
import 'package:udemy_meals_app/providers/meals_provider.dart';

import '../model/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  //initialised with an empty list value
  FavouriteMealsNotifier() : super([]);

  //method

  //takes meal as an input of type Meal
  bool toggleMealFavouriteStatus(Meal meal) {
    //checks whether meal is favourite by checking the state contains that meal or not
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      //update the state ie, the list
      //gets a new iterable
      //converted to list
      state = state.where((m) => m.id != meal.id).toList();
      return false; //if the item was removed
    } else {
      //spread operator, adds data from list one by one by breaking its elements
      //state is a List<meal>
      //there will be 2 meals here, one favourite and another all
      state = [...state, meal];

      return true; // if the item was added
    }
  }
}

//stateNotifierProvider yields data: favouriteMeansNotifier and List of meals
final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>(
      //returns instance of the stateNotifier class
      (ref) {
        return FavouriteMealsNotifier();
      },
    );

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  //What it does:
  //meals = the big list of all meals (like a menu with everything).
  // .where(...) = goes through each meal one by one and checks a condition. If the condition is true, the meal stays. If false, it gets filtered out.
  // .toList() = turns the remaining meals back into a proper list.
  // Why: Because we don’t want to show ALL meals, only the ones that match the chosen filters.
  return meals.where((meal) {
    //_selectedFilter[Filter.glutenFree]! → Did the user turn ON the gluten-free filter?
    //
    // !meal.isGlutenFree → Is this meal NOT gluten-free?
    //
    // If both are true, then this meal doesn’t fit → return false (throw it away).
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    //filter is set and active and meal is not lactose free
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
