import 'package:flutter/material.dart';

class CreateSelect extends StatelessWidget {

  final String placeholder;
  final String label;
  final double width;
  final List<dynamic> models;
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
    this.onSaved,
    this.models
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
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Container(
              child: FormField<String>(
                builder: (FormFieldState<String> stateField) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      filled: true,
                      enabledBorder: OutlineInputBorder(),
                      fillColor: Colors.white
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: 1,
                        isDense: true,
                        icon: Icon(Icons.keyboard_arrow_down, size: 35),
                        onChanged: (int val) {},
                        items: this.models.map((dynamic value) {
                          return new DropdownMenuItem<int>(
                            value: value.id,
                            child: new Text(value.label),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
                validator: (val) {
                  return val.isEmpty ? null : 'Selecciona una opcion';
                },
              )
            ),
          )
        ],
      ),
    );
  }
}