import 'dart:convert';

import 'package:flutter/services.dart';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    /* cargarData(); */
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/data.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['encuestas'];

    return opciones;
  }
}

final menuProvider = new _MenuProvider();
