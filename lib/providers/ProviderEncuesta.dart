import 'dart:convert';

import 'package:prueba_formgoogle_app/models/EncuestaModel.dart';

import 'package:http/http.dart' as http;

class ProviderEncuesta {
  final String _url =
      'https://ejemplo-formulario-acl-default-rtdb.firebaseio.com';

  Future<bool> crearEncuesta(Encuesta encuesta) async {
    final url = '$_url/encuestas.json';

    encuesta.estado = true;

    final resp = await http.post(url, body: encuestaToJson(encuesta));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<Encuesta>> cargarEncuesta() async {
    final url = '$_url/encuestas.json';
    final resp = await http.get(url);
    final List<Encuesta> encuestas = new List();

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    if (decodedData == null) return [];

    decodedData.forEach((id, encuesta) {
      final encTemp = Encuesta.fromJson(encuesta);
      encTemp.id = id;

      if (encTemp.estado == true) {
        encuestas.add(encTemp);
      }
    });

    return encuestas;
  }

  Future<bool> putEncuestaById(Encuesta encuesta) async {
    final url = '$_url/encuestas/${encuesta.id}.json';
    await http.put(url, body: encuestaToJson(encuesta));
    return true;
  }
}
