import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';

// 使う時はWidgetクラスを呼び出す
class CategoryRoute extends StatefulWidget {
  @override
  _CategoryRouteState createState() => new _CategoryRouteState();
}

// 具体的な処理はStateクラスに書く
class _CategoryRouteState extends State<CategoryRoute> {
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
    _categoryNames.asMap().forEach((index, categoryName) {
      list.add(Center(
          child: Category(
              icon: Icons.cake,
              textColor: Colors.black,
              activeBackgroundColor: _baseColors[index],
              text: categoryName,
              units: _retrieveUnitList(categoryName))));
    });
    return list;
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final listView = ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: buildCategoryList());

    final appBar = AppBar(
      backgroundColor: Colors.green[100],
      elevation: 0,
      title: const Text(
        'Unit Converter',
        style: TextStyle(
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.green[100],
      body: listView,
    );
  }
}
