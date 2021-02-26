import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class Category extends StatelessWidget {
  final icon;
  final color;
  final text;

  const Category(
      {@required this.icon, @required this.color, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: FlatButton(
            splashColor: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(16), child: Icon(icon, size: 60)),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            textColor: color,
            height: 100,
            onPressed: () {}));
  }
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: Center(
            child: Category(
          icon: Icons.cake,
          color: Colors.black,
          text: 'Cake',
        )),
      ),
    );
  }
}
