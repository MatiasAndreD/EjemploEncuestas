import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prueba_formgoogle_app/models/EncuestaModel.dart';
import 'package:prueba_formgoogle_app/providers/ProviderEncuesta.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  Encuesta encuesta = new Encuesta();
  final formKey = GlobalKey<FormState>();
  ProviderEncuesta providerEncuesta = new ProviderEncuesta();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear nueva Encuesta"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _crearNombre(),
              _crearLinkU(),
              SizedBox(height: 20.0),
              _crearBoton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre encuesta'),
      onSaved: (value) => encuesta.nombre = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre de la encuesta';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearLinkU() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Link encuesta'),
      onSaved: (value) => encuesta.link = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el link de la encuesta';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      icon: Icon(Icons.save),
      onPressed: _submit,
      label: Text('Guardar'),
      color: Colors.deepPurple,
      textColor: Colors.white,
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    if (encuesta.id != null) {
      providerEncuesta.putEncuestaById(encuesta);

      Timer(Duration(milliseconds: 1000), () => Navigator.pop(context, 'home'));
    } else {
      providerEncuesta.crearEncuesta(encuesta);
    }
  }
}
