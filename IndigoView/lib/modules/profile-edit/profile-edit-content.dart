import 'package:flutter/material.dart';
import 'package:indigo/modules/common/responsive/directionContent.dart';
import 'package:indigo/modules/profile-edit/widgets/card-user.dart';
import 'package:indigo/utils/HexColor.dart';
import 'profile-edit-state.dart';
import 'package:indigo/utils/HoverExtensions.dart';

class ProfileEditContent extends StatelessWidget {

  final ProfileEditState state;

  ProfileEditContent({Key key, @required this.state});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              image: DecorationImage(
                image: AssetImage('assets/images/background-header.png'),
                fit: BoxFit.cover
              )
            ),
            height: 170,
            width: this.state.screen.width - this.state.widthMenu,
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  child: Text('Editar Perfil', 
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.w500,
                      fontSize: 25
                    )
                  ),
                  left: this.state.screen.width * .025,
                  top: 35,
                ),
                Positioned(
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0), child: Text('Índigo', style: TextStyle(color: HexColor.fromHex('#6db8f3')),)),
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0), child: Icon(Icons.arrow_forward_ios, size: 12, color: Colors.white,)),
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child: Text('Ajustes', style: TextStyle(color: Colors.white),))
                    ],
                  ),
                  left: this.state.screen.width * .025,
                  top: 75,
                )
              ],
            ),
          ),
          Container(
            color: HexColor.fromHex('#f4f5fa'),
            height: this.state.screen.height + 330,
            width: this.state.screen.width - this.state.widthMenu,
            child: Center(
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    child: Center(
                      child: Container(
                      width: (this.state.screen.width * .95) - this.state.widthMenu,
                      child: DirectionContent(
                        validationRow: this.state.screen.isDesktop,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CardUser(
                            width: this.state.screen.isDesktop ? ((this.state.screen.width * .95) - this.state.widthMenu) * .3 : ((this.state.screen.width * .95) - this.state.widthMenu),
                            padding: EdgeInsets.fromLTRB(0, 0, this.state.screen.isDesktop ? 10.0 : 0, 0),
                            labelStyle: this.state.labels,
                            titleStyle: this.state.title,
                            subTitleStyle: this.state.subTitle,
                            onChangeImageProfile: this.state.setImageProfile,
                            imageTemp: this.state.imageTemp,
                            imageTempCompany: this.state.imageTempCompany,
                            onChangeImageCompany: this.state.setImageCompany,
                            profile: this.state.profile,
                          ),
                          if(!this.state.screen.isDesktop)
                            SizedBox(height: 20)
                          ,
                          Container(
                            width: this.state.screen.isDesktop ? ((this.state.screen.width * .95) - this.state.widthMenu) * .7 : ((this.state.screen.width * .95) - this.state.widthMenu),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(3))
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                              width: 250,
                                              height: 50,
                                              margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text('Información Personal', style: this.state.title)
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
                                      Form(
                                        key: this.state.formKey,
                                        child: DirectionContent(
                                          validationRow: this.state.screen.width > 1513,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    width: this.state.screen.width > 1513 ? this.state.screen.width > 1514 && this.state.screen.width < 1587 ? 450 : 500 : null,
                                                    padding: EdgeInsets.fromLTRB(30, 0, 30, 8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                            EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
                                                          child: Text('NOMBRE*',
                                                            style: this.state.subTitle
                                                          )
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                                          child: TextFormField(
                                                            validator: (String value) => this.state.validInput(value, 'name'),
                                                            initialValue: this.state.profile.name,
                                                            decoration: InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                                border: OutlineInputBorder()),
                                                            keyboardType: TextInputType.text,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ),
                                                  Container(
                                                    width: this.state.screen.width > 1513 ? this.state.screen.width > 1514 && this.state.screen.width < 1587 ? 450 : 500 : null,
                                                    padding: EdgeInsets.fromLTRB(30, 8.0, 30, 8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                            EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 10.0),
                                                          child: Text('EMPRESA*',
                                                            style: this.state.subTitle
                                                          )
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                                          child: TextFormField(
                                                            validator: (String value) => this.state.validInput(value, 'company'),
                                                            initialValue: this.state.profile.company,
                                                            decoration: InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                                border: OutlineInputBorder()),
                                                            keyboardType: TextInputType.text,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ),
                                                  Container(
                                                    width: this.state.screen.width > 1513 ? this.state.screen.width > 1514 && this.state.screen.width < 1587 ? 450 : 500 : null,
                                                    padding: EdgeInsets.fromLTRB(30, 8.0, 30, 30),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                            EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 10.0),
                                                            child: Text('CORREO ELECTRONICO*',
                                                              style: this.state.subTitle
                                                            )
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                                          child: TextFormField(
                                                            enabled: false,
                                                            initialValue: this.state.profile.email,
                                                            decoration: InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                                border: OutlineInputBorder()),
                                                            keyboardType: TextInputType.text,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    width: this.state.screen.width > 1513 ? this.state.screen.width > 1514 && this.state.screen.width < 1587 ? 450 : 500 : null,
                                                    padding: EdgeInsets.fromLTRB(30, 0, 30, 8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                            EdgeInsets.fromLTRB(0.0, this.state.screen.width > 1513 ? 30 : 0, 0.0, 10.0),
                                                            child: Text('TELÉFONO*',
                                                              style: this.state.subTitle
                                                            )
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                                          child: TextFormField(
                                                            validator: (String value) => this.state.validInput(value, 'telephone'),
                                                            initialValue: this.state.profile.telephone,
                                                            decoration: InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                                border: OutlineInputBorder()),
                                                            keyboardType: TextInputType.text,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ),
                                                  Container(
                                                    width: this.state.screen.width > 1513 ? this.state.screen.width > 1514 && this.state.screen.width < 1587 ? 450 : 500 : null,
                                                    padding: EdgeInsets.fromLTRB(30, 8.0, 30, 8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                            EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 10.0),
                                                            child: Text('RFC*',
                                                              style: this.state.subTitle
                                                            )
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                                          child: TextFormField(
                                                            validator: (String value) => this.state.validInput(value, 'rfc'),
                                                            initialValue: this.state.profile.rfc,
                                                            decoration: InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                                border: OutlineInputBorder()),
                                                            keyboardType: TextInputType.text,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ),
                                                  Container(
                                                    width: this.state.screen.width > 1513 ? this.state.screen.width > 1514 && this.state.screen.width < 1587 ? 450 : 500 : null,
                                                    padding: EdgeInsets.fromLTRB(30, 8.0, 30, 8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                            EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 10.0),
                                                            child: Text('DIRECCIÓN*',
                                                              style: this.state.subTitle
                                                            )
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                                          child: TextFormField(
                                                            validator: (String value) => this.state.validInput(value, 'address'),
                                                            initialValue: this.state.profile.address,
                                                            decoration: InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                                border: OutlineInputBorder()),
                                                            keyboardType: TextInputType.text,
                                                          ),
                                                        )
                                                      ],
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
                                SizedBox(height: 20),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(3)
                                          ),
                                          color: Theme.of(context).primaryColor,
                                          child: Text('Guardar Cambios', style: TextStyle(color: Colors.white, fontSize: 15)),
                                          onPressed: this.state.submit
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
                    )),
                    top: -40,
                    left: this.state.screen.width * .025,
                  ),
                ],
              )
            )
          )
        ],
      ),
    );
  }
}