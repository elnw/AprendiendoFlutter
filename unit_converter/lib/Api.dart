// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// TODO: Import relevant packages
import 'dart:convert';
import 'dart:io';

import 'package:unitconverter/unit.dart';

/// The REST API retrieves unit conversions for [Categories] that change.
///
/// For example, the currency exchange rate, stock prices, the height of the
/// tides change often.
/// We have set up an API that retrieves a list of currencies and their current
/// exchange rate (mock data).
///   GET /currency: get a list of currencies
///   GET /currency/convert: get conversion from one currency amount to another
class Api {

  // TODO: Add any relevant variables and helper functions
  final  httpclient = HttpClient();
  final url = 'flutter.udacity.com';

  // TODO: Create getUnits()
  Future<List<Unit>> getUnits(String nombreCategoria) async{
    if(nombreCategoria.isNotEmpty){
      final uri = Uri.https(url, '/$nombreCategoria');
      final httpRequest = await httpclient.getUrl(uri);
      final httpResponse = await httpRequest.close();

      if(httpResponse.statusCode != HttpStatus.ok){
        return new List();
      }

      final responseBody = await httpResponse.transform(utf8.decoder).join();
      final jsonresponse = json.decode(responseBody);

      if(jsonresponse == null || jsonresponse['units'] == null){
        return new List<Unit>();
      }else{
        return jsonresponse['units'].map<Unit>((dynamic data) => Unit.fromJson(data)).toList();
      }


    }else{
      return null;
    }
  }
  /// Gets all the units and conversion rates for a given category.
  ///
  /// The `category` parameter is the name of the [Category] from which to
  /// retrieve units. We pass this into the query parameter in the API call.
  ///
  /// Returns a list. Returns null on error.
  // TODO: Create convert()
  /// Given two units, converts from one to another.
  ///
  /// Returns a double, which is the converted amount. Returns null on error.

  Future<double> convert(String categoria, Unit from, Unit to, String cantidad) async{
    categoria = categoria.toLowerCase();
    final uri = Uri.https(url, '/$categoria/convert',{
      'from': from.name,
      'to': to.name,
      'amount': cantidad
    });

    final httpRequest = await httpclient.getUrl(uri);
    final httpResponse = await httpRequest.close();

    if(httpResponse.statusCode != HttpStatus.ok){
      return null;
    }

    final responseBody = await httpResponse.transform(utf8.decoder).join();
    final jsonresponse = json.decode(responseBody);

    return jsonresponse['conversion'].toDouble();
  }

}