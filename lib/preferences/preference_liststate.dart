import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPref() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get estado {
    return _prefs.getBool('estado') ?? true;
  }

  set estado(bool value) {
    _prefs.setBool('estado', value);
  }

  get id {
    return _prefs.getInt('id');
  }

  set id(int value) {
    _prefs.setInt('id', value);
  }

//Setter and Getter ultima pagina
}
