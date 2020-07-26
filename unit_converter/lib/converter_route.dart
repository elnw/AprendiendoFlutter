// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:unitconverter/unit.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// Units for this [Category].
  final List<Unit> units;
  final Color containerColor;
  final String categoryName;

  /// This [ConverterRoute] requires the color and units to not be null.
  const ConverterRoute({
    @required this.categoryName,
    @required this.units,
    @required this.containerColor
  }) : assert(units != null), assert(containerColor != null), assert(categoryName != null);

  @override
  _ConverterState createState() => _ConverterState();

}

class _ConverterState extends State<ConverterRoute>{
  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units

    final barra = AppBar(
      title: Center(
        child: Text(widget.categoryName),
      ),
    );

    final unitWidgets = widget.units.map((Unit unit) {
      return Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        color: widget.containerColor,
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: barra,
      body: ListView(
        children: unitWidgets,
      ),
    );
  }
}