import 'package:flutter/material.dart';
import 'unit.dart';

class Category extends StatelessWidget {
  final IconData icon;
  final activeBackgroundColor;
  final color;
  final String text;
  final List<Unit> units;

  const Category(
      {@required this.icon,
      @required this.color,
      @required this.activeBackgroundColor,
      @required this.text,
      @required this.units});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: FlatButton(
            highlightColor: activeBackgroundColor,
            splashColor: activeBackgroundColor,
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
            onPressed: () {
              print('dddd');
            }));
  }
}
