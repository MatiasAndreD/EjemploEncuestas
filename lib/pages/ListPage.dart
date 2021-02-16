import 'package:flutter/material.dart';
import 'package:prueba_formgoogle_app/providers/providers.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formularios"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    /* menuProvider.cargarData(); */
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        print(snapshot.data);

        return ListView(children: _listaItems(snapshot.data, context));
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    int conteo = 0;

    data.forEach((opt) {
      conteo = conteo + 1;
      final ruta = opt['ruta'];

      final widgetTemp = ListTile(
        title: Text('Encuesta $conteo'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          /* final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.push(context, route); */
          Navigator.pushNamed(context, 'home', arguments: ruta);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
