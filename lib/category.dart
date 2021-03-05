import 'package:flutter/material.dart';
import 'unit.dart';

class CoverArguments {
  final Color categoryColor;
  final String categoryName;
  final List<Unit> units;

  CoverArguments(this.categoryColor, this.categoryName, this.units);
}

class Category extends StatelessWidget {
  final IconData icon;
  final Color activeBackgroundColor;
  final Color textColor;
  final String text;
  final List<Unit> units;

  const Category(
      {@required this.icon,
      @required this.textColor,
      @required this.activeBackgroundColor,
      @required this.text,
      @required this.units});

  void _navigateToConverter(
      BuildContext context, Color categoryColor, String categoryName) {
    Navigator.of(context).pushNamed('/cover',
        arguments: CoverArguments(categoryColor, categoryName, units));
  }

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
            textColor: textColor,
            height: 100,
            onPressed: () {
              _navigateToConverter(context, activeBackgroundColor, text);
            }));
  }
}
