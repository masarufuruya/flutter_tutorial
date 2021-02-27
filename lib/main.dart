import 'package:flutter/material.dart';
import 'category.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Unit Converter',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
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
