import 'package:flutter/material.dart';
import './screens/categories.dart';
import './screens/category_meals.dart';
import './screens/mealDetail.dart';
import './screens/tabsScreen.dart';
import './screens/filterScreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
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
          '/category-meals': (context) => CategoryMealsScreen(),
          MealDetail.route: (context) => MealDetail(),
          FilterScreen.route: (context) => const FilterScreen(),
        });
  }
}

class _HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<_HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
      ),
      body: CategoriesScreen(),
    );
  }
}
