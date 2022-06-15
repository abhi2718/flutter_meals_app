import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../dummayData/dummay_data.dart';
import '../widgets/mealItem.dart';

class FavoritesMeals extends StatelessWidget {
  final List favoritesMeals;
  const FavoritesMeals({Key? key, required this.favoritesMeals})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    List favorite = DUMMY_MEALS.where((element) {
    return favoritesMeals.contains(element.id);
  }).toList();
   if(favorite.isNotEmpty){
    return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: favorite[index].id,
              categories: favorite[index].categories,
              title: favorite[index].title,
              imageUrl: favorite[index].imageUrl,
              duration: favorite[index].duration,
              ingredients: favorite[index].ingredients,
              steps: favorite[index].steps,
              isGlutenFree: favorite[index].isGlutenFree,
              isVegan: favorite[index].isVegan,
              isLactoseFree: favorite[index].isLactoseFree,
              isVegetarian: favorite[index].isVegetarian,
              affordability: favorite[index].affordability,
              complexity: favorite[index].complexity);
        },
        itemCount: favorite.length);
   }else{
       return const Center(
        child: Text('Add Your Favourite Meals'),
       );
   }
  }
}
