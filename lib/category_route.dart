import 'package:flutter/material.dart';
import 'category.dart';

class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final listView = Center(
        child: Category(
      icon: Icons.cake,
      color: Colors.black,
      text: 'Cake',
    ));

    final appBar = AppBar(
      elevation: 0,
      title: const Text(
        'Unit Converter',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.green[100],
      body: listView,
    );
  }
}
