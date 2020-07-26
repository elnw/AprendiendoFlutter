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
class CategoryRoute extends StatefulWidget {
  const CategoryRoute();

  @override
  _CategoryState createState() => _CategoryState();

  }

  class _CategoryState extends State<CategoryRoute>{
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

    final listaCategorias = <Category>[];

    @override
    void initState() {
    super.initState();
    for(var i=0; i< _categoryNames.length;i++){
      listaCategorias.add(Category(
          name: _categoryNames[i],
          color:  _baseColors[i],
          iconLocation: 'assets/Images/me-gusta.png',
          units: _retrieveUnitList(_categoryNames[i])
      ));
    }
  }

    @override
    Widget build(BuildContext context) {
      final listView = Container(
        child: _myListView(context),
        color: Colors.greenAccent,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
      );

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
            return listaCategorias[index];
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: _categoryNames.length);
    }

  }