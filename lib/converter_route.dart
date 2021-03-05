import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'unit.dart';
import 'category.dart';

class ConverterAppBar extends StatelessWidget {
  final String title;

  const ConverterAppBar({@required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title));
  }
}

class ConverterRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CoverArguments args = ModalRoute.of(context).settings.arguments;

    final appBar = AppBar(
        backgroundColor: args.categoryColor,
        elevation: 0,
        title: Text(args.categoryName,
            style: TextStyle(fontSize: 32, color: Colors.black54)));

    final unitWidgets = args.units.map((Unit unit) {
      return Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
        appBar: appBar,
        backgroundColor: args.categoryColor,
        body: ListView(
          children: unitWidgets,
        ));
  }
}
