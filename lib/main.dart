import 'package:flutter/material.dart';
import './screens/category_meals.dart';
import './screens/mealDetail.dart';
import './screens/tabsScreen.dart';
import './screens/filterScreen.dart';
import './dummayData/dummay_data.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Map<String, bool> filter = {
    'GlutenFree': false,
    'Vegan': false,
    'Vegetarian': false,
    'LactoseFree': false
  };
  List favoritesMeals = [];
  List filteredMeals = DUMMY_MEALS;
  void _setFilter(filter) {
    setState(() {
      this.filter = filter;
      filteredMeals = DUMMY_MEALS.where((meals) {
        if (filter['GlutenFree'] && !meals.isGlutenFree) {
          return false;
        }
        if (filter['Vegan'] && !meals.isVegan) {
          return false;
        }
        if (filter['Vegetarian'] && !meals.isVegetarian) {
          return false;
        }
        if (filter['LactoseFree'] && !meals.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const TabScreen(),
          CategoryMealsScreen.route: (context) => CategoryMealsScreen(
                filteredMealsList: filteredMeals,
              ),
          MealDetail.route: (context) => MealDetail(),
          FilterScreen.route: (context) => FilterScreen(
                setFilter: _setFilter,
                filter: filter,
              ),
        });
  }
}
