import 'package:flutter/material.dart';
import '../widgets/mainDrawer.dart';

class FilterScreen extends StatefulWidget {
  final Function setFilter;
  static const route = '/filter';
  final Map filter;
  const FilterScreen({Key? key, required this.setFilter, required this.filter})
      : super(key: key);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;
  @override
  void initState() {
   setState(() {
      isGlutenFree = widget.filter['GlutenFree'];
      isVegan = widget.filter['Vegan'];
      isVegetarian = widget.filter['Vegetarian'];
      isLactoseFree = widget.filter['LactoseFree'];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Meals'),
        actions: [
          IconButton(
              onPressed: () {
                widget.setFilter({
                  'GlutenFree': isGlutenFree,
                  'Vegan': isVegan,
                  'Vegetarian': isVegetarian,
                  'LactoseFree': isLactoseFree
                });
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: const Text("Adjust Your Meal Selection ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          SwitchListTile(
              value: isGlutenFree,
              onChanged: (val) {
                setState(() {
                  isGlutenFree = !isGlutenFree;
                });
              },
              title: const Text('Gluten Free'),
              subtitle: const Text('Only include Gluten free meals.')),
          SwitchListTile(
              value: isVegan,
              onChanged: (val) {
                setState(() {
                  isVegan = !isVegan;
                });
              },
              title: const Text('Vegan Free'),
              subtitle: const Text('Only include Vegan free meals.')),
          SwitchListTile(
              value: isVegetarian,
              onChanged: (val) {
                setState(() {
                  isVegetarian = !isVegetarian;
                });
              },
              title: const Text('Vegetarian Free'),
              subtitle: const Text('Only include Vegetarian free meals.')),
          SwitchListTile(
              value: isLactoseFree,
              onChanged: (val) {
                setState(() {
                  isLactoseFree = !isLactoseFree;
                });
              },
              title: const Text('Lactose Free'),
              subtitle: const Text('Only include Lactose free meals.'))
        ],
      ),
    );
  }
}
