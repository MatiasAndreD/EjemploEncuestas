import 'package:flutter/material.dart';
import 'package:prueba_formgoogle_app/pages/CreatePage.dart';
import 'package:prueba_formgoogle_app/pages/HomePage.dart';
import 'package:prueba_formgoogle_app/pages/ListPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'list',
      routes: {
        'list': (BuildContext context) => ListPage(),
        'home': (BuildContext context) => HomePage(),
        'create': (BuildContext context) => CreatePage()
      },
    );
  }
}
