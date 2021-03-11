import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';

const _padding = EdgeInsets.all(16.0);

class ConverterRoute extends StatefulWidget {
  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  Unit _fromValue;
  Unit _toValue;
  double _inputValue;
  String _convertedValue = '';
  bool _showValidationError = false;

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  void _updateConversion() {
    setState(() {
      _convertedValue =
          _format(_inputValue * (_toValue.conversion / _fromValue.conversion));
    });
  }

  void _updateInputValue(String input) {
    setState(() {
      if (input == null || input.isEmpty) {
        _convertedValue = '';
      } else {
        // Even though we are using the numerical keyboard, we still have to check
        // for non-numerical input such as '5..0' or '6 -3'
        try {
          final inputDouble = double.parse(input);
          _showValidationError = false;
          _inputValue = inputDouble;
          _updateConversion();
        } on Exception catch (e) {
          print('Error: $e');
          _showValidationError = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final CoverArguments args = ModalRoute.of(context).settings.arguments;

    final appBar = AppBar(
        backgroundColor: args.categoryColor,
        elevation: 0,
        title: Text(args.categoryName,
            style: TextStyle(fontSize: 32, color: Colors.black54)));

    final input = Padding(
        padding: _padding,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          TextField(
            style: Theme.of(context).textTheme.headline4,
            // これを指定しないとただの下線のみのTextFiedになる
            decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.headline4,
                errorText:
                    _showValidationError ? 'Invalid number entered' : null,
                //左上のラベル
                labelText: 'Input',
                // TextFieldのボーダー
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0))),
            keyboardType: TextInputType.number,
            onChanged: _updateInputValue,
          )
        ]));

    return Scaffold(
        appBar: appBar, backgroundColor: args.categoryColor, body: input);
  }
}
