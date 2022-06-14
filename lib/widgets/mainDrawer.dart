import 'package:flutter/material.dart';
import '../screens/filterScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
       // const Divider(height: 1),
        ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Meals'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
       // const Divider(height: 1),
        const SizedBox(
          height: 10,
        ),
        //const Divider(height: 1),
        ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Filter'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FilterScreen.route);
            }),
        // const Divider(height: 1),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
