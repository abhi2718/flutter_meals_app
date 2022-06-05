import 'package:flutter/material.dart';
import '../dummayData/dummay_data.dart';
import '../widgets/mealItem.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? categoryId = routeArgs['id'];
    final String? categoryName = routeArgs['title'];
    final filteredMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName!),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
               id:filteredMeals[index].id,
               categories: filteredMeals[index].categories,
               title: filteredMeals[index].title,
               imageUrl: filteredMeals[index].imageUrl,
               duration: filteredMeals[index].duration,
               ingredients: filteredMeals[index].ingredients,
               steps: filteredMeals[index].steps,
               isGlutenFree: filteredMeals[index].isGlutenFree,
               isVegan:filteredMeals[index].isVegan,
               isLactoseFree: filteredMeals[index].isLactoseFree,
               isVegetarian: filteredMeals[index].isVegetarian,
              );
          },
          itemCount: filteredMeals.length),
    );
  }
}
