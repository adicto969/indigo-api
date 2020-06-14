import 'package:flutter/material.dart';
import 'package:indigo/modules/common/responsive/directionContent.dart';
import 'package:indigo/utils/HexColor.dart';
import 'package:indigo/utils/HoverExtensions.dart';

class CardUser extends StatelessWidget {

  final double width;
  final EdgeInsetsGeometry padding;
  final TextStyle titleStyle;
  final TextStyle labelStyle;

  CardUser({Key key, this.width, this.padding, this.titleStyle, this.labelStyle});

  bool validWigth(context) {
    return MediaQuery.of(context).size.width > 1470 || MediaQuery.of(context).size.width < 1024;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      padding: this.padding,
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: HexColor.fromHex('#E1E2F4'),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 50,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        top: -20,
                        left: this.validWigth(context) ? 30 : (this.width / 2) - 75,
                        child: Text('Bienvenido', style: this.titleStyle),
                      )
                    ],
                  ),
                ),
                if (this.validWigth(context))
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
                    child: Image(image: AssetImage('assets/images/logo-login-color.png'))
                  )
              ],
            ),
          ),
          Container(
            width: this.width,
            height: this.validWigth(context) ? 150 : 200, //150
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(3)
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 130,
                  height: 65,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        top: -65,
                        left: this.validWigth(context) ? 30 : (this.width / 2) - 75,
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(65)
                          ),
                          padding: EdgeInsets.all(3),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(65),
                              image: DecorationImage(
                                image: AssetImage('assets/images/profile.jpg'),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: this.validWigth(context) ? null : this.width, // 130
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: DirectionContent(
                    validationRow: this.validWigth(context),
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: this.validWigth(context) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: this.validWigth(context) ? MainAxisAlignment.start : MainAxisAlignment.center,
                          crossAxisAlignment: this.validWigth(context) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(this.validWigth(context) ? 30 : 0, 0, 0, 5),
                              child: Text('Juan Pérez', style: this.titleStyle.apply(color: Colors.black))
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(this.validWigth(context) ? 30 : 0, 0, 0, 0),
                              child: Text('Súper Administrador', style: this.labelStyle),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: this.validWigth(context) ? EdgeInsets.fromLTRB(0, 0, 30, 0) : null,
                        child: FlatButton.icon(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)
                          ),
                          color: Theme.of(context).primaryColor,
                          icon: Icon(Icons.edit, color: Colors.white),
                          label: Text('Editar Perfil', style: TextStyle(color: Colors.white, fontSize: 15)),
                          onPressed: () {}
                        ).showCursorOnHover,
                      )
                    ],
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