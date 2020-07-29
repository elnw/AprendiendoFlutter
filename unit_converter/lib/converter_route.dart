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
  //final ColorSwatch coloresUsar;

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
  bool _validarIngreso = false;
  String unidadEntrada = '', unidadSalida = '';
  final RegExp _expresionNumero = new RegExp(r"^(-{0,1})([0-9]*)(\.[0-9]+){0,1}$");

  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  @override
  void initState() {
    super.initState();
    unidadEntrada = widget.units.first.name;
    unidadSalida = widget.units.first.name;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.units.length);
    final formulario = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (String valorActual){
                    _validarIngreso = !(_expresionNumero.hasMatch(valorActual)) ;
                  },
                  decoration: InputDecoration(
                      errorText: _validarIngreso ? 'Verifique que el texto ingresado sea valido' : null,
                      errorStyle: TextStyle(
                          color: Colors.red
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid
                          )
                      ),
                      hintText: 'Input'
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all()
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: unidadEntrada,
                        items: widget.units.map((Unit unidad){
                          return new DropdownMenuItem(
                            child: Text(unidad.name),
                            value: unidad.name,);
                        }
                        ).toList(),
                        onChanged: (String value){
                          setState(() {
                            unidadEntrada = value;
                          });
                        },
                      ),
                    )
                  )
                ),
              ],
            ),
          ),
        Image.asset(
          'assets/Images/baseline_swap_vert_black_18dp.png',
          width: 40.0,
          height: 40.0,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child:  ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              TextField(
                enabled: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid
                        )
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0, top: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: DropdownButtonHideUnderline(child: DropdownButton<String>(
                    value: unidadSalida,
                    items: widget.units.map((Unit unidad){
                      return new DropdownMenuItem(
                        child: Text(unidad.name),
                        value: unidad.name,);
                    }
                    ).toList(),
                    onChanged: (String value){
                      setState(() {
                        unidadSalida = value;
                      });
                    },
                  ),
                  ),
                )
              )
            ],
          ),
        )
      ],
    );
    final barraSuperior = AppBar(
      title: Center(
        child: Text(
            widget.categoryName,
            style: TextStyle(
              fontSize: 24.0
            ),),
      ),
      backgroundColor: widget.containerColor,
    );

    return Scaffold(
      appBar: barraSuperior,
      body: formulario,
    );
  }

}