import 'package:flutter/material.dart';
import 'package:indigo/modules/common/responsive/directionContent.dart';
import 'package:indigo/modules/profile/widgets/card-info.dart';
import 'package:indigo/modules/profile/widgets/card-user.dart';
import 'package:indigo/utils/HexColor.dart';
import 'profile-state.dart';

class ProfileContent extends StatelessWidget {

  final ProfileState state;

  ProfileContent({Key key, @required this.state});

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
                  child: Text('Perfil', 
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
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child: Text('Perfil de Usuario', style: TextStyle(color: Colors.white),))
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
            height: this.state.screen.width > 856 ? this.state.screen.height : this.state.screen.height + 330,
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
                            labelStyle: this.state.textLabel,
                            titleStyle: this.state.title,
                          ),
                          if(!this.state.screen.isDesktop)
                            SizedBox(height: 20)
                          ,
                          Container(
                            width: this.state.screen.isDesktop ? ((this.state.screen.width * .95) - this.state.widthMenu) * .7 : ((this.state.screen.width * .95) - this.state.widthMenu),
                            padding: EdgeInsets.fromLTRB(this.state.screen.isDesktop ? 10.0 : 0, 0, 0.0, 0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(3))
                                  ),
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 25.0),
                                        child: Text('Información Personal ${this.state.screen.width}', style: state.title),
                                      ),
                                      Container(
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
                                                    width: this.state.screen.width > 1513 ? 450 : null,
                                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color: HexColor.fromHex('#e2e4f3'))
                                                      )
                                                    ),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          width: 130,
                                                          child: Text('Nombre:', style: state.labels),
                                                        ),
                                                        Container(
                                                          child: Text('Juan Pérez', style: state.textLabel),
                                                        )
                                                      ],
                                                    )
                                                  ),
                                                  Container(
                                                    width: this.state.screen.width > 1513 ? 450 : null,
                                                    padding: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color: HexColor.fromHex('#e2e4f3'))
                                                      )
                                                    ),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          width: 130,
                                                          child: Text('Empresa:', style: state.labels),
                                                        ),
                                                        Container(
                                                          child: Text('Índigo', style: state.textLabel),
                                                        )
                                                      ],
                                                    )
                                                  ),
                                                  Container(
                                                    width: this.state.screen.width > 1513 ? 450 : null,
                                                    padding: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color: HexColor.fromHex('#e2e4f3'))
                                                      )
                                                    ),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          width: 130,
                                                          child: Text('Correo:', style: state.labels),
                                                        ),
                                                        Container(
                                                          child: Text('juan.perez@indigo.com', style: state.textLabel),
                                                        )
                                                      ],
                                                    )
                                                  ),
                                                  Container(
                                                    width: this.state.screen.width > 1513 ? 450 : null,
                                                    padding: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                                    decoration: this.state.screen.width > 1513 ? null : BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color: HexColor.fromHex('#e2e4f3'))
                                                      )
                                                    ),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          width: 130,
                                                          child: Text('Teléfono:', style: state.labels),
                                                        ),
                                                        Container(
                                                          child: Text('55 2233 4455', style: state.textLabel),
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
                                                    width: this.state.screen.width > 1513 ? 450 : null,
                                                    padding: EdgeInsets.fromLTRB(0, this.state.screen.width > 1513 ? 0 : 8.0, 0, 8.0),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color: HexColor.fromHex('#e2e4f3'))
                                                      )
                                                    ),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          width: 130,
                                                          child: Text('ID:', style: state.labels),
                                                        ),
                                                        Container(
                                                          child: Text('ABCD1234', style: state.textLabel),
                                                        )
                                                      ],
                                                    )
                                                  ),
                                                  Container(
                                                    width: this.state.screen.width > 1513 ? 450 : null,
                                                    padding: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color: HexColor.fromHex('#e2e4f3'))
                                                      )
                                                    ),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          width: 130,
                                                          child: Text('RFC:', style: state.labels),
                                                        ),
                                                        Container(
                                                          child: Text('INGO781216ES6', style: state.textLabel),
                                                        )
                                                      ],
                                                    )
                                                  ),
                                                  Container(
                                                    width: this.state.screen.width > 1513 ? 450 : null,
                                                    padding: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color: HexColor.fromHex('#e2e4f3'))
                                                      )
                                                    ),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          width: 130,
                                                          child: Text('Dirección:', style: state.labels),
                                                        ),
                                                        Container(
                                                          width: this.state.screen.isMobil ? 280 : 320,
                                                          child: Text('Nombre de Calle, #34, Col. Nombre de Colonia, Nombre de Alcaldia, CDMX, CP. 54060', style: state.textLabel, textAlign: TextAlign.left),
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
                                  height: this.state.screen.width > 856 ? null : 530,
                                  child: DirectionContent(
                                    validationRow: this.state.screen.width > 856,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: CardInfo(
                                          icon: Icons.assignment,
                                          number: '510',
                                          styleLabel: this.state.labels,
                                          title: 'Prueba creadas',
                                          titleStyle: this.state.title,
                                          upNumber: '+11%',
                                          upString: 'Respecto al mes pasado',
                                          margin: EdgeInsets.fromLTRB(0, 0, MediaQuery.of(context).size.width > 856 ? 10.0 : 0, 0),
                                        )
                                      ),
                                      if (this.state.screen.width <= 856)
                                        SizedBox(height: 20,)
                                      ,
                                      Expanded(
                                        flex: 2,
                                        child: CardInfo(
                                          icon: Icons.business,
                                          number: '16',
                                          styleLabel: this.state.labels,
                                          title: 'Sponsors',
                                          titleStyle: this.state.title,
                                          upNumber: '+2',
                                          upString: 'Respecto al mes pasado',
                                          margin: EdgeInsets.fromLTRB(0, 0, MediaQuery.of(context).size.width > 856 ? 10.0 : 0, 0),
                                        ),
                                      ),
                                      if (this.state.screen.width <= 856)
                                        SizedBox(height: 20,)
                                      ,
                                      Expanded(
                                        flex: 2,
                                        child: CardInfo(
                                          icon: Icons.people_outline,
                                          number: '47',
                                          styleLabel: this.state.labels,
                                          title: 'Empresas',
                                          titleStyle: this.state.title,
                                          upNumber: '+9',
                                          upString: 'Respecto al mes pasado',
                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        )
                                      ),
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