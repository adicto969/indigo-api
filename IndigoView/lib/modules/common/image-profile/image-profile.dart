import 'dart:math';

import 'package:flutter/material.dart';
import 'package:indigo/utils/HexColor.dart';

class ImageProfile extends StatelessWidget {
  
  final String name;
  final String image;
  List<String> listColors;
  String activeColor;
  String initialsName;

  ImageProfile({Key key, @required this.name, @required this.image}) {
    listColors = <String> [
      '352F5A',
      '43ABB8',
      '6FD7DE',
      'F3EDA8',
      'FA4B4B',
      '064559',
      '138FA2',
      'E7C323',
      'FD7007'
    ];

    initialsName = '';

    for(final String letter in name.split(' ')) {
      if (initialsName.length <= 1) {
        initialsName += letter[0].toUpperCase();
      }
    }

    Random random = new Random();
    activeColor = listColors[random.nextInt(9)];

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: image != null ? Colors.transparent : HexColor.fromHex(activeColor),
        borderRadius: BorderRadius.circular(15.0),
        image: image != null ? DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.contain
        ) : null
      ),
      child: image != null ? null : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(initialsName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}