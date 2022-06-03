import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? categoryId =  routeArgs['id'];
    final String? categoryName = routeArgs['title'];
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName!),
        ),
        body: const Center(
          child: Text("Category Screen"),
        ));
  }
}
