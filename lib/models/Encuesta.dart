import 'dart:convert';

Encuesta encuestaFromJson(String str) => Encuesta.fromJson(json.decode(str));

String encuestaToJson(Encuesta data) => json.encode(data.toJson());

class Encuesta {
  Encuesta({
    this.id,
    this.link,
    this.estado,
  });

  int id;
  String link;
  bool estado;

  factory Encuesta.fromJson(Map<String, dynamic> json) => Encuesta(
        id: json["id"],
        link: json["link"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "estado": estado,
      };
}
