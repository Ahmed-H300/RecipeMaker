import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {

   final List<Meal> favoriteMeals;

   FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
    return const Center(
      child: Text('You have no favorites Yet - start adding some!'),
    );
    }
    else{
return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id!,
            title: favoriteMeals[index].title!,
            imageUrl: favoriteMeals[index].imageUrl!,
            duration: favoriteMeals[index].duration!,
            complexity: favoriteMeals[index].complexity!,
            affordability: favoriteMeals[index].affordability!,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}