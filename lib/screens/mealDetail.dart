import 'package:flutter/material.dart';
import '../dummayData/dummay_data.dart';

class MealDetail extends StatefulWidget {
  static const String route = '/mealDetail';
  final Function setFavoritesMeals;
  const MealDetail({
    Key? key, 
    required this.setFavoritesMeals
    }) : super(key: key);
  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
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
    double sectionHeight =
        (MediaQuery.of(context).size.height - AppBar().preferredSize.height) /
            3;
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
        child: Column(
          children: [
            Image.network(
              selectedMeal.imageUrl,
              width: double.infinity,
              fit: BoxFit.fill,
              height: sectionHeight,
            ),
            const SizedBox(
              height: 6,
            ),
            buildHeading('Ingredients'),
            SizedBox(
              height: sectionHeight,
              child: ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(child: Text('${index + 1}')),
                          title: Text('${selectedMeal.ingredients[index]}'),
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
              height: sectionHeight,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(child: Text('#${index + 1}')),
                          title: Text('${selectedMeal.steps[index]}'),
                        ),
                        const Divider(
                          thickness: 1,
                        )
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps.length),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.star),
        onPressed: () {
          setState(()=>widget.setFavoritesMeals(id));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
