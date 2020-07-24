import 'package:flutter/material.dart';


class Category extends StatelessWidget {
  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // TODO: You'll need the name, color, and iconLocation from main.dart

  String name;
  Color color;
  String rutaIcono;

  final double altura = 100.0;

  Category(this.name, this.color, this.rutaIcono);

  @override
  Widget build(BuildContext context) {
    // TODO: Build the custom widget here, referring to the Specs.
    return Container(child: InkWell(
      onTap: (){print('me la tocaste xd');},
      splashColor: color,
        highlightColor: color,
        borderRadius: BorderRadius.circular(altura/2),
      child: Padding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
                child: Padding(
                  child: Image.asset(
                    rutaIcono,
                    width: 60.0,
                    height: 60.0,),
                  padding: EdgeInsets.all(16.0),
                )
            ),
            Flexible(
              child: Text(
                  "Cake",
              style: TextStyle(
                fontSize: 24.0
              ),),
            )
          ],
        ),
        padding: EdgeInsets.all(8.0),
      )
    ),
    height: altura,
      width: MediaQuery.of(context).size.width,
    );
  }
}