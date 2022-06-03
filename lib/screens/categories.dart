import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummayData/dummay_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding:const EdgeInsets.all(16),
      children: DUMMY_CATEGORIES.map((item) => CategoryItem(
        color: item.color,
        title: item.title,
        id: item.id,
      )).toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
