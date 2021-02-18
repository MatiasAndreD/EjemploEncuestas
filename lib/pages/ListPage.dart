import 'package:flutter/material.dart';
import 'package:prueba_formgoogle_app/models/EncuestaModel.dart';
import 'package:prueba_formgoogle_app/providers/ProviderEncuesta.dart';
import 'package:prueba_formgoogle_app/providers/db_provider.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final providerEncuesta = new ProviderEncuesta();
  @override
  Widget build(BuildContext context) {
    //TODO: Temporal leer la base de datos
    DBProvider.db.database;

    return Scaffold(
        appBar: AppBar(
          title: Text("Formularios"),
        ),
        body: _crearListado(),
        floatingActionButton: _crearBoton(context));
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: providerEncuesta.cargarEncuesta(),
      builder: (BuildContext context, AsyncSnapshot<List<Encuesta>> snapshot) {
        if (snapshot.hasData) {
          final encuestas = snapshot.data;

          return ListView.builder(
            itemCount: encuestas.length,
            itemBuilder: (BuildContext context, int i) =>
                crearItem(encuestas[i]),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'create')
          .then((value) => setState(() {})),
      backgroundColor: Colors.deepPurple,
    );
  }

  Widget crearItem(Encuesta encuesta) {
    return ListTile(
      title: Text(encuesta.nombre),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.pushNamed(context, 'home', arguments: encuesta);
      },
    );
  }
}
