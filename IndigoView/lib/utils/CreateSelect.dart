import 'package:flutter/material.dart';

class CreateSelect extends StatelessWidget {

  final String placeholder;
  final String label;
  final double width;
  final String Function(String) validator;
  final Function(dynamic value) onChanged;
  final Function(dynamic value) onSaved;

  const CreateSelect({
    Key key, 
    @required this.label,
    this.placeholder = '',
    this.width,
    this.validator,
    this.onChanged,
    this.onSaved
    }) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          Container(
            width: width,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text (label, textAlign: TextAlign.left, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold))
                ],
              ),
            )
          ),
          Container(
            width: width,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
              child: new DropdownButton(
                hint: Text(this.placeholder),
                items: <String>['Prueba 1', 'Prueba 2', 'PRUEBA 3', 'Prueba 4'].map((String value) {
                  return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                  );
                }).toList(),
                onChanged: (value) => this.onChanged(value),
              ),
            ),
          )
        ],
      ),
    );
  }
}