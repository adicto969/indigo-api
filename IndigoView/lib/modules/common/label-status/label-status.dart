import 'package:flutter/material.dart';
import 'package:indigo/utils/HexColor.dart';

class LabelStatus extends StatelessWidget {

  final String status;
  String color;

  LabelStatus({Key key, this.status}) {
    this.color = '#6598fe';
    switch (this.status.toLowerCase()) {
      case 'activa':
        this.color = '#6598fe';
        break;
      case 'inactiva':
        this.color = '#f04b4b';
        break;
      case 'pausada':
        this.color = '#ffb822';
        break;
      default:
        this.color = '#6598fe';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        color: HexColor.fromHex(this.color),
      ),
      padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
      width: 75,
      height: 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(this.status, style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}