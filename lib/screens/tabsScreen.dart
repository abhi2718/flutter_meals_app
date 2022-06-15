import 'package:flutter/material.dart';
import './categories.dart';
import './favorites.dart';
import '../widgets/mainDrawer.dart';

class TabScreen extends StatefulWidget {
  final List favoritesMeals;
  const TabScreen({Key? key, required this.favoritesMeals}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedScreenIndex = 0;
   List _tabScreen = [];
  @override
  void initState() {
    setState(() {
      _tabScreen = [
        ..._tabScreen,
        {
          'title': 'Category',
          'screen': CategoriesScreen(),
        },
        {
          'title': 'Favourite',
          'screen': FavoritesMeals(
            favoritesMeals: widget.favoritesMeals,
          ),
        }
      ];
    });
    super.initState();
  }

  void _selectTab(index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tabScreen[_selectedScreenIndex]['title'])),
      body: _tabScreen[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        //type:BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite"),
        ],
      ),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
    );
  }
}





// Top Tab Bar 
// DefaultTabController(
//       length: 2, 
//       child: Scaffold(
//         appBar:AppBar(
//           title: const Text('Meals'),
//           bottom: const TabBar(tabs: [
//              Tab(
//               icon: Icon(
//                 Icons.category,
//               ),
//                text:'Category'
//             ),
//              Tab(
//               icon: Icon(
//                 Icons.star,
//               ),
//                text:'Favorites'
//             ),
//           ]),
//         ),
//         body: TabBarView(
//       children: [
//        CategoriesScreen(),
//        const FavoritesMeals()
//       ],    
//         ),
//         )
//       );