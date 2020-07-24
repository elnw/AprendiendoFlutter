import 'package:flutter/material.dart';
import 'package:hellorecktangle/Category.dart';

void main(){
runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Category('Cake', Colors.redAccent, 'assets/Images/me-gusta.png'),

        ),
      ),
    );

  }
}