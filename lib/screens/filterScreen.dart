import 'package:flutter/material.dart';
import '../widgets/mainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const route = '/filter';
  const FilterScreen({Key? key}) : super(key: key);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Meals')),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10,),
          Container(
            alignment:Alignment.center,
            child: const Text("Adjust Your Meal Selection ",
            style:TextStyle(fontSize:16,fontWeight:FontWeight.bold)),
          ),
          SwitchListTile(
              value: isGlutenFree,
              onChanged: (val) {
                setState(() {
                  isGlutenFree = !isGlutenFree;
                });
              },
              title: const Text('Gluten Free'),
              subtitle: const Text('Only include Gluten free meals.')
              ),
              SwitchListTile(
              value: isVegan,
              onChanged: (val) {
                setState(() {
                  isVegan = !isVegan;
                });
              },
              title: const Text('Vegan Free'),
              subtitle: const Text('Only include Vegan free meals.')
              ),
              SwitchListTile(
              value: isVegetarian,
              onChanged: (val) {
                setState(() {
                  isVegetarian = !isVegetarian;
                });
              },
              title: const Text('Vegetarian Free'),
              subtitle: const Text('Only include Vegetarian free meals.')
              ),
              SwitchListTile(
              value: isLactoseFree,
              onChanged: (val) {
                setState(() {
                  isLactoseFree = !isLactoseFree;
                });
              },
              title: const Text('Lactose Free'),
              subtitle: const Text('Only include Lactose free meals.')
              )
        ],
      ),
    );
  }
}
