import 'package:flutter_riverpod/flutter_riverpod.dart';

// What it does: This creates a list of special "labels" called Filter.
// The labels are glutenFree, lactoseFree, vegetarian, and vegan.
//
// Why: So instead of writing plain text like "glutenFree"
// everywhere (which could cause typos), we have a fixed set of options that the computer understands.
enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  //initial filter state
  //holds the knowledge
  FiltersNotifier()
    : super({
        Filter.vegetarian: false,
        Filter.vegan: false,
        Filter.lactoseFree: false,
        Filter.glutenFree: false,
      });

  //immutable way for data manipulation
  //state the method

  void setFilters(Map<Filter, bool> chosenFilter){
    state=chosenFilter;
  }


  void setFilter(Filter filter, bool isActive) {
    //copies the existing list of key value pair and the new value pair
    //to update our filter
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
    );
