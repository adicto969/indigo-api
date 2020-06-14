import 'dart:math';

import 'package:flutter/material.dart';
import 'package:indigo/modules/common/graphic/bar-graphic.dart';
import 'package:indigo/modules/common/graphic/donut-graphic.dart';
import 'package:indigo/modules/report-result/report-result-state.dart';
import 'package:indigo/modules/report-result/widget/isps-widget.dart';
import 'package:indigo/utils/HexColor.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportResultContent extends StatelessWidget {

  final ReportResultState state;

  ReportResultContent({Key key, @required this.state});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: this.state.screen.height + 250,
                color: HexColor.fromHex('#f4f5fa'),
              ),
              Positioned(
                top: 0,
                child: Container(
                  height: 170,
                  width: this.state.screen.width - this.state.screen.widthMenu,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    image: DecorationImage(
                      image: AssetImage('assets/images/background-header.png'),
                      fit: BoxFit.cover
                    )
                  )
                )
              ),
              Positioned(
                child: Text('Reporte de Resultados',
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
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child: Text('Índice de Salud Psicosocial (ISPS)', style: TextStyle(color: Colors.white),))
                  ],
                ),
                left: this.state.screen.width * .025,
                top: 75,
              ),
              Positioned(
                child: FlatButton.icon(
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColorDark,
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  splashColor: Colors.blueAccent,
                  onPressed: () { 
                    print('object');
                  },
                  icon: Icon(Icons.save_alt),
                  label: Text(
                    "Descargar Reporte",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                right: this.state.screen.width * .025,
                top: 45,
              ),
              Positioned(
                top: 135,
                child: Container(
                  width: (this.state.screen.width - this.state.screen.widthMenu),
                  height: this.state.screen.height - 175,
                  color: Colors.transparent,
                  child: Center(
                    child: Container(
                      width: (this.state.screen.width - this.state.screen.widthMenu) * .95,
                      color: Colors.white,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: this.state.screen.isDesktop ? 400 : null,
                              child: TabBar(
                                isScrollable: false,
                                onTap: (int tap) {
                                  print(tap);
                                },
                                key: this.state.keyTabBar,
                                labelColor: Theme.of(context).primaryColor,
                                indicatorColor: Theme.of(context).primaryColor,
                                controller: this.state.tabController,
                                tabs: <Widget>[
                                  Tab(child: Text('Resumen', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18))),
                                  Tab(child: Text('Detalle', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)))
                                ],
                              ),
                            ),
                            Container(
                              width: (this.state.screen.width - this.state.screen.widthMenu )* .95,
                              height: this.state.screen.height - 225,
                              child: TabBarView(
                                key: this.state.keyTabBarView,
                                controller: this.state.tabController,
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                                          child: Container(
                                            height: 320,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Column(
                                                            children: <Widget>[
                                                              Center(
                                                                child: Container(
                                                                  width: 300,
                                                                  height: 300,
                                                                  child: Stack(
                                                                    children: <Widget>[
                                                                      DonutGraphic(
                                                                        data: this.state.seriesList,
                                                                        arcWidth: 35,
                                                                      ),
                                                                      Center(
                                                                        child: Container( 
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              Padding(
                                                                                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                                                                child: Icon(Icons.assignment, size: 33, color: HexColor.fromHex('#3e48ac')),
                                                                              ),
                                                                              Text('Total de Pruebas', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                                                                              Text('9', style: TextStyle(fontFamily: 'NunitoSansBack', fontWeight: FontWeight.w900, fontSize: 50))
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Center(
                                                                child: Container(
                                                                  child: Row(
                                                                    children: <Widget>[
                                                                      Container(
                                                                        child: Row(
                                                                          children: <Widget>[
                                                                            Container(
                                                                              width: 20,
                                                                              height: 20,
                                                                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                                              color: HexColor.fromHex('#3e48ac'),
                                                                            ),
                                                                            Text('Mujeres', style: TextStyle(fontWeight: FontWeight.w900, color: HexColor.fromHex('#9499a7')))
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        child: Row(
                                                                          children: <Widget>[
                                                                            Container(
                                                                              width: 20,
                                                                              height: 20,
                                                                              margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                                                                              color: HexColor.fromHex('#a3aac4'),
                                                                            ),
                                                                            Text('Hombre', style: TextStyle(fontWeight: FontWeight.w900, color: HexColor.fromHex('#9499a7')))
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Padding(
                                                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8.0),
                                                                border: Border.all(
                                                                  color: HexColor.fromHex('#e8ebf2'),
                                                                  width: 1,
                                                                ),
                                                                color: HexColor.fromHex('#f4f5fa')
                                                              ),
                                                              height: 320,
                                                              width: 130,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: <Widget>[
                                                                        Icon(Icons.timer, size: 35, color: HexColor.fromHex('#3e48ac')),
                                                                        Text('Duración', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: <Widget>[
                                                                        Text('PROMEDIO', style: this.state.styleTimesLabel),
                                                                        Text('15:43', style: this.state.styleTimes)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 1,
                                                                    color: HexColor.fromHex('#e8ebf2'),
                                                                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: <Widget>[
                                                                        Text('MÁXIMO', style: this.state.styleTimesLabel),
                                                                        Text('32:36', style: this.state.styleTimes)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 1,
                                                                    color: HexColor.fromHex('#e8ebf2'),
                                                                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: <Widget>[
                                                                        Text('MÍNIMO', style: this.state.styleTimesLabel),
                                                                        Text('08:33', style: this.state.styleTimes)
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  flex: 3,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 320,
                                                    child: Padding(
                                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(8.0),
                                                          border: Border.all(
                                                            color: HexColor.fromHex('#e8ebf2'),
                                                            width: 1,
                                                          ),
                                                          color: HexColor.fromHex('#f4f5fa')
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: EdgeInsets.fromLTRB(25, 25, 25, 10),
                                                              child: Text('ESTATUS', style: this.state.styleTimesLabel),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                                              child: Column(
                                                                children: <Widget>[
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: <Widget>[
                                                                      Text('Completo'),
                                                                      Text('7/9')
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: LinearProgressIndicator(
                                                                      value: 0.8,
                                                                      backgroundColor: HexColor.fromHex('#e5e8f0'),
                                                                      valueColor: AlwaysStoppedAnimation<Color>(HexColor.fromHex('#3c44b0')),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                                                              child: Column(
                                                                children: <Widget>[
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: <Widget>[
                                                                      Text('Imcompleto'),
                                                                      Text('2/9')
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: LinearProgressIndicator(
                                                                      value: 0.2,
                                                                      backgroundColor: HexColor.fromHex('#e5e8f0'),
                                                                      valueColor: AlwaysStoppedAnimation<Color>(HexColor.fromHex('#3c44b0')),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.fromLTRB(25, 30, 25, 15),
                                                              child: Text('HORARIO', style: this.state.styleTimesLabel),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                                              child: Column(
                                                                children: <Widget>[
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: <Widget>[
                                                                      Text('Tarde'),
                                                                      Text('6/9')
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: LinearProgressIndicator(
                                                                      value: 0.6,
                                                                      backgroundColor: HexColor.fromHex('#e5e8f0'),
                                                                      valueColor: AlwaysStoppedAnimation<Color>(HexColor.fromHex('#3c44b0')),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                                                              child: Column(
                                                                children: <Widget>[
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: <Widget>[
                                                                      Text('Mañana'),
                                                                      Text('3/9')
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(4.0)
                                                                    ),
                                                                    child: LinearProgressIndicator(
                                                                      value: 0.3,
                                                                      backgroundColor: HexColor.fromHex('#e5e8f0'),
                                                                      valueColor: AlwaysStoppedAnimation<Color>(HexColor.fromHex('#3c44b0'))
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  flex: 3,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 320,
                                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8.0),
                                                        border: Border.all(
                                                          color: HexColor.fromHex('#e8ebf2'),
                                                          width: 1,
                                                        ),
                                                        color: HexColor.fromHex('#f4f5fa')
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets.fromLTRB(25, 25, 25, 15),
                                                            child: Text('PRUEBAS POR DÍA', style: this.state.styleTimesLabel),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                                                            child: Container(
                                                              height: 235,
                                                              child: BarGraphic(data: this.state.testsPerDay),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  flex: 4,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
                                          child: Container(
                                            color: HexColor.fromHex('#f4f5fa'),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(4),
                                                              color: HexColor.fromHex('#ffb822'),
                                                            ),
                                                            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                                            child: Center(
                                                              child: Column(
                                                                children: <Widget>[
                                                                  Text('ISPS Generales', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                                                  Text('6.8', style: TextStyle(color: Colors.white, fontFamily: 'NunitoSansBack', fontSize: 34))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                                            child: Center(
                                                              child: Column(
                                                                children: <Widget>[
                                                                  Container(
                                                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                                                    child: Row(
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: <Widget>[
                                                                        Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: HexColor.fromHex('#1eca7b'),
                                                                          ),
                                                                          height: 23,
                                                                          width: 23
                                                                        ),
                                                                        Container(
                                                                          width: 150,
                                                                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                                          child: Text('Riesgo Bajo de 1 a 4'),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                                                    child: Row(
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: <Widget>[
                                                                        Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: HexColor.fromHex('#ffb822'),
                                                                          ),
                                                                          height: 23,
                                                                          width: 23
                                                                        ),
                                                                        Container(
                                                                          width: 150,
                                                                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                                          child: Text('Riesgo Medio de 4 a 7'),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                                                                    child: Row(
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: <Widget>[
                                                                        Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: HexColor.fromHex('#f04a4a'),
                                                                          ),
                                                                          height: 23,
                                                                          width: 23
                                                                        ),
                                                                        Container(
                                                                          width: 150,
                                                                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                                          child: Text('Riesgo Alto de 7 a 10'),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    flex: 4,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                      child: ISPSWidget(title: 'Entorno 6,1', color: HexColor.fromHex('#ffb822'), listIsps: this.state.entornoList)
                                                    ),
                                                    flex: 4,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                      child: ISPSWidget(title: 'Identidad 7,2', color: HexColor.fromHex('#f14b4b'), listIsps: this.state.indentidadList)
                                                    ),
                                                    flex: 4,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                      child: ISPSWidget(title: 'Identidad 7,2', color: HexColor.fromHex('#f14b4b'), listIsps: this.state.saludList)
                                                    ),
                                                    flex: 4,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Text('Detalle')
                                  )
                                ],
                              )
                            )
                          ],
                        ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 181,
                child: Container(
                  height: 2,
                  width: (this.state.screen.width - this.state.screen.widthMenu),
                  color: Colors.transparent,
                  child: Center(
                    child: Container(
                      width: (this.state.screen.width - this.state.screen.widthMenu) * .95,
                      height: 2,
                      color: Theme.of(context).primaryColor.withAlpha(60),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 134,
                right: this.state.screen.width * .027,
                child: FlatButton.icon(
                  textColor: Theme.of(context).primaryColorDark,
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  splashColor: Colors.blueAccent,
                  onPressed: () { 
                    print('object');
                  },
                  icon: Icon(Icons.save_alt),
                  label: Text(
                    "Definiciones",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}