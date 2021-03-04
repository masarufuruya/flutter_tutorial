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
        backgroundColor: Colors.green[100],
        elevation: 0,
        title: Text(args.categoryName));

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
        backgroundColor: Colors.green[100],
        body: ListView(
          children: unitWidgets,
        ));
  }
}
