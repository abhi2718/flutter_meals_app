import 'package:flutter/material.dart';
import '../dummayData/dummay_data.dart';

class MealDetail extends StatelessWidget {
  static const String route = '/mealDetail';
  Widget buildHeading(String text) {
    return Text(text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget buildIngredientItem(String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(text),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? id = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (element) => element.id == id,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child:Column(
        children: [
          Image.network(
            selectedMeal.imageUrl,
            width: double.infinity,
            fit: BoxFit.fill,
            height: 200,
          ),
          const SizedBox(
            height: 6,
          ),
          buildHeading('Ingredients'),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemBuilder: ((context, index) =>
                Column(
                children: [
                ListTile(
                leading: CircleAvatar(
                   child:Text('${index+1}')
                ),
                title:Text('${selectedMeal.ingredients[index]}'),
              ),
              const Divider(
                thickness: 1,
              )
              ],
              )),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          buildHeading('Steps'),
          SizedBox(
            height: 200,
            child: ListView.builder(itemBuilder: (context, index) {
              return Column(
                children: [
                ListTile(
                leading: CircleAvatar(
                   child:Text('#${index+1}')
                ),
                title:Text('${selectedMeal.steps[index]}'),
              ),
              const Divider(
                thickness: 1,
              )
              ],
              );
            },
            itemCount: selectedMeal.steps.length
            ),
          ),
          
        ],
      ),
      )
    );
  }
}
