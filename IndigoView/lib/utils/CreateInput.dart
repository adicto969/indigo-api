import 'package:flutter/material.dart';

class CreateInput extends StatelessWidget {

  final TextInputType type;
  final String placeholder;
  final String label;
  final double width;
  final String Function(String) validator;
  final Function(dynamic value) onChanged;
  final Function(dynamic value) onSaved;

  const CreateInput({
    Key key, 
    @required this.label,
    this.placeholder = '',
    this.type = TextInputType.text,
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
              child: TextFormField(
                validator: validator,
                onSaved: (value) => this.onSaved(value),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  hintText: placeholder,
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white
                ),
                keyboardType: type
              ),
            ),
          )
        ],
      ),
    );
  }
}