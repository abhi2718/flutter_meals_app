import 'package:flutter/material.dart';
import '../dummayData/dummay_data.dart';

class MealItem extends StatelessWidget {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final Affordability affordability;
  final Complexity complexity;
  MealItem({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isLactoseFree,
    required this.isVegetarian,
    required this.affordability,
    required this.complexity,
  });
  String getAffordability() {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
    }
  }
  String getComplexity() {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32,
                    padding: const EdgeInsets.all(10),
                    color: Colors.black54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  )),
            ]),
           Container(
             padding:const EdgeInsets.symmetric(vertical: 10),
             child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(children: [
                  const Icon(
                    Icons.schedule,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('${duration.toString()} min')
                ]),
                Row(children: [
                  const Icon(
                    Icons.work_outline
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('${getComplexity()} ')
                ]),
                Row(children: [
                  const Icon(
                    Icons.attach_money_rounded,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('${getAffordability()} ')
                ]),
              ],
            ),
           )
          ],
        ),
      ),
    );
  }
}
