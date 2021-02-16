import 'dart:convert';

Encuesta encuestaFromJson(String str) => Encuesta.fromJson(json.decode(str));

String encuestaToJson(Encuesta data) => json.encode(data.toJson());

class Encuesta {
  Encuesta({
    this.id,
    this.nombre,
    this.link,
    this.estado,
  });

  String id;
  String nombre;
  String link;
  bool estado;

  factory Encuesta.fromJson(Map<String, dynamic> json) => Encuesta(
        id: json["id"],
        nombre: json["nombre"],
        link: json["link"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "link": link,
        "estado": estado,
      };
}
