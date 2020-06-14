import 'package:flutter/material.dart';
import 'package:indigo/modules/common/responsive/directionContent.dart';

class CardInfo extends StatelessWidget {

  final String title;
  final TextStyle titleStyle;
  final String number;
  final IconData icon;
  final String upNumber;
  final String upString;
  final TextStyle styleLabel;
  final EdgeInsets margin;

  CardInfo({
    this.title, 
    this.titleStyle, 
    this.number, 
    this.icon, 
    this.upNumber, 
    this.upString, 
    this.styleLabel,
    this.margin
  });

  bool validWigth(context) {
    return MediaQuery.of(context).size.width > 856;
  }

  bool hiddenIcon(context) {
    return MediaQuery.of(context).size.width < 1277 && MediaQuery.of(context).size.width > 1022 ;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(3))
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Row(
              mainAxisAlignment: this.hiddenIcon(context) ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: this.hiddenIcon(context) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(this.title, style: titleStyle),
                      ),
                      Container(
                        child: Text(this.number, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 45, fontFamily: 'NunitoSansBack')),
                      )
                    ],
                  ),
                ),
                if (!this.hiddenIcon(context)) 
                  Container(
                    child: Icon(this.icon, size: 82, color: Theme.of(context).primaryColor,),
                  )
              ],
            ),
          ),
          Container(
            child: DirectionContent(
              validationRow: !this.hiddenIcon(context),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 45,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(3)
                  ),
                  padding: EdgeInsets.all(3),
                  child: Center(
                    child: Text(this.upNumber, textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: this.hiddenIcon(context) ? EdgeInsets.fromLTRB(0, 10.0, 0, 0) : EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(this.upString, overflow: TextOverflow.ellipsis, style: this.styleLabel, textAlign: TextAlign.justify,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}