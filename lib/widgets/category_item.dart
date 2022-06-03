import 'package:flutter/material.dart';
import '../screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final String title;
  final String id;
  CategoryItem({required this.color, required this.title, required this.id});
  void selectCategory(context) {
    Navigator.of(context).pushNamed(
       '/category-meals',
       arguments: {
         'title':title,
         'id':id,
       }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        alignment: Alignment.center,
        child: Text(title),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.7),
            color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
