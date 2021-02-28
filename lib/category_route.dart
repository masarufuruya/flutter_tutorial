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

  List<Widget> buildCategoryList() {
    List<Widget> list = [];
    _categoryNames.forEach((categoryName) {
      list.add(Center(
          child: Category(
        icon: Icons.cake,
        color: Colors.black,
        text: categoryName,
      )));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final listView = ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: buildCategoryList());

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
