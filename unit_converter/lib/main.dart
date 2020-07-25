import 'package:flutter/material.dart';
import 'package:unitconverter/category_route.dart';
// TODO: Import the CategoryRoute widget

/// The function that is called when main.dart is run.
void main() {
  runApp(UnitConverterApp());
}

/// This widget is the root of our application.
///
/// The first screen we see is a list [Categories].
class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      initialRoute: '/categories',
      routes: {
        '/categories': (context) => CategoryRoute(),
      },
    );
  }
}