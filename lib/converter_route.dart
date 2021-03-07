import 'package:flutter/material.dart';
import 'unit.dart';
import 'category.dart';

class ConverterRoute extends StatefulWidget {
  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
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
