import 'package:flutter/material.dart';
import 'package:unitconverter/category.dart';
import 'package:unitconverter/unit.dart';

// TODO: Define any constants

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create a list of the eight Categories, using the names and colors
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.

    // TODO: Create a list view of the Categories
    final listView = Container(
      child: _myListView(context),
      color: Colors.greenAccent,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
    );

    // TODO: Create an App Bar
    final appBar = AppBar(
      title: Center(
          child: Text(
        'Unit Converter',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.black,

        ),
      )),
      backgroundColor: Colors.greenAccent,
      elevation: 0.0,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }

  Widget _myListView(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Category(
              name: _categoryNames[index],
          color:  _baseColors[index],
          iconLocation: 'assets/Images/me-gusta.png',
          units: _retrieveUnitList(_categoryNames[index]));
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: _categoryNames.length);
    }
  }