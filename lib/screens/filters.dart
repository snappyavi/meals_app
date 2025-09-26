import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_meals_app/screens/tabs.dart';
import 'package:udemy_meals_app/widgets/main_drawer.dart';

import '../providers/filters_provider.dart';

//Why: It needs to remember changes (like turning a filter on or off), so it uses StatefulWidget.
class FiltersScreen extends ConsumerWidget {
  //to know the current settings.
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //sets up a listener that reexecutes the build method
    //whenever the state in the provider changes
    //filter change- reexecutes
    final activeFilters = ref.watch(filtersProvider);
    //What it does: Wraps the screen with a special widget (PopScope).
    //
    // Why: To control what happens when the user tries to leave (presses back).
    //
    // How: Instead of just leaving, it will first save the filter settings.
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters")),

      body: Column(
        children: [
          SwitchListTile(
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            subtitle: Text(
              "Only Include gluten free meals",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
            //wont be null
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              //event handler- onchanged
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
          ),

          SwitchListTile(
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            subtitle: Text(
              "Only Include Lactose free meals",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
            //wont be null
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              //event handler- onchanged
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
          ),

          SwitchListTile(
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            subtitle: Text(
              "Only Include vegetarian meals",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
            //wont be null
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              //event handler- onchanged
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
          ),

          SwitchListTile(
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            subtitle: Text(
              "Only Include vegan meals",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
            //wont be null
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              //event handler- onchanged
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
          ),
        ],
      ),
    );
  }
}
