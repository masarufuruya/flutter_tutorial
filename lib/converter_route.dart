import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'unit.dart';

class ConverterAppBar extends StatelessWidget {
  final String title;

  const ConverterAppBar({@required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title));
  }
}

class ConverterRoute extends StatelessWidget {
  /// Units for this [Category].
  final List<Unit> units;

  const ConverterRoute({
    @required this.units,
  }) : assert(units != null);

  @override
  Widget build(BuildContext context) {
    final unitWidgets = units.map((Unit unit) {
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
        backgroundColor: Colors.green[100],
        body: ListView(
          children: unitWidgets,
        ));
  }
}
