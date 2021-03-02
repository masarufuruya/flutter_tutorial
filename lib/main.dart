import 'package:flutter/material.dart';
import 'package:flutter_tutorial/converter_route.dart';
import 'package:flutter_tutorial/unit.dart';
import 'category_route.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => CategoryRoute(),
        '/cover': (BuildContext context) => ConverterRoute(
              units: [
                Unit(name: 'hoge', conversion: 1),
                Unit(name: 'fuga', conversion: 2)
              ],
            )
      },
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
    );
  }
}
