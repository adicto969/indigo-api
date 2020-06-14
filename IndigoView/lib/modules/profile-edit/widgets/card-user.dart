import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:indigo/modules/common/responsive/directionContent.dart';
import 'package:indigo/modules/profile-edit/models/profile-model.dart';
import 'package:indigo/utils/HexColor.dart';
import 'package:indigo/utils/HoverExtensions.dart';
import 'dart:html' as html;

class CardUser extends StatelessWidget {

  final double width;
  final EdgeInsetsGeometry padding;
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;
  final TextStyle labelStyle;
  final Function(Uint8List) onChangeImageProfile;
  final Uint8List imageTemp;
  final Function(Uint8List) onChangeImageCompany;
  final Uint8List imageTempCompany;
  final ProfileModel profile;

  CardUser({
    Key key, 
    this.width, 
    this.padding, 
    this.titleStyle, 
    this.labelStyle, 
    this.subTitleStyle,
    this.onChangeImageProfile,
    this.imageTemp,
    this.imageTempCompany,
    this.onChangeImageCompany,
    this.profile
  });

  bool validWigth(context) {
    return MediaQuery.of(context).size.width > 1470 || MediaQuery.of(context).size.width < 1024;
  }

  changeImage() {
    final html.InputElement input = html.document.createElement('input');
    input
      ..type = 'file'
      ..accept = 'image/*';

    input.onChange.listen((e) {
      if (input.files.isEmpty) return;
      final reader = html.FileReader();
      reader.readAsDataUrl(input.files[0]);
      
      reader.onError.listen((err) => (){});

      reader.onLoad.first.then((res) {
        final encoded = reader.result as String;
        // remove data:image/*;base64 preambule
        final stripped =
            encoded.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');

        this.onChangeImageProfile(base64.decode(stripped));
      });
    });

    input.click();
  }

  changeImageCompany() {
    final html.InputElement input = html.document.createElement('input');
    input
      ..type = 'file'
      ..accept = 'image/*';

      input.onChange.listen((e) {
        if (input.files.isEmpty) return;
        final reader = html.FileReader();
        reader.readAsDataUrl(input.files[0]);

        reader.onError.listen((err) => () {});

        reader.onLoad.first.then((res) {
          final encoded = reader.result as String;

          final stripped = 
              encoded.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');

          this.onChangeImageCompany(base64.decode(stripped));
        });
      });

      input.click();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      padding: this.padding,
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3)
              )
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 150,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Mi Perfil', style: this.titleStyle)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: HexColor.fromHex('#E1E2F4')
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('FOTO USUARIO', style: this.subTitleStyle)
                    ],
                  ),
                )
              ],
            )
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: this.width - 70,
                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Tamaño recomendado 500 x 500 pixeles',
                        overflow: TextOverflow.clip,
                        maxLines: 2
                      )
                    ],
                  ),
                )
              ],
            )
          ),
          Container(
            width: this.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: this.width - 70, // 130
                  margin: EdgeInsets.fromLTRB(30, 15, 0, 0),
                  child: DirectionContent(
                    validationRow: this.validWigth(context),
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: imageTemp != null ? MemoryImage(imageTemp) : AssetImage('assets/images/profile.jpg'),
                            fit: BoxFit.cover
                          )
                        ),
                        child: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Center(
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: FloatingActionButton(
                                    backgroundColor: Theme.of(context).primaryColor,
                                    elevation: 0,
                                    child: Icon(Icons.camera_alt, color: Colors.white),
                                    onPressed: changeImage,
                                  ),
                                ).showCursorOnHover,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: this.validWigth(context) ? this.width - 200 : this.width - 70,
                        padding: EdgeInsets.fromLTRB(this.validWigth(context) ? 20 : 0, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(0, this.validWigth(context) ? 0 : 20, 0, 5),
                              child: Text(this.profile.name, style: this.titleStyle.apply(color: Colors.black))
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Text('Súper Administrador'),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text.rich(
                                TextSpan(
                                  text: '',
                                  style: TextStyle(fontSize: 12),
                                  children: <TextSpan>[
                                    TextSpan(text: 'ID USUARIO: ', style: this.labelStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 12)),
                                    TextSpan(text: 'ABCD1234')
                                  ]
                                )
                              )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('LOGOTIPO EMPRESA', style: this.subTitleStyle)
                    ],
                  ),
                )
              ],
            )
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  width: this.width - 70,
                  child: Text(
                      'Tamaño máximo recomendado 800 pixeles en su lado más largo.',
                      overflow: TextOverflow.clip,
                      maxLines: 2
                    ),
                )
              ],
            )
          ),
          Container(
            height: 140,
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: HexColor.fromHex('#E1E2F4'),
                borderRadius: BorderRadius.all(Radius.circular(3)),
                image: DecorationImage(
                  image: imageTempCompany != null ? MemoryImage(imageTempCompany) : AssetImage('assets/images/logo-login-color.png')
                )
              ),
              margin: EdgeInsets.fromLTRB(30, 15, 30, 30),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Center(
                      child: Container(
                        width: 40,
                        height: 40,
                        child: FloatingActionButton(
                          backgroundColor: Theme.of(context).primaryColor,
                          elevation: 0,
                          child: Icon(Icons.camera_alt, color: Colors.white),
                          onPressed: changeImageCompany,
                        ),
                      ).showCursorOnHover,
                    ),
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}