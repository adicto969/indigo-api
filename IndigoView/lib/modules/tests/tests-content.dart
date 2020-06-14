import 'package:flutter/material.dart';
import 'package:indigo/modules/common/label-status/label-status.dart';
import 'package:indigo/modules/tests/tests-state.dart';
import 'package:indigo/utils/HexColor.dart';
import 'package:intl/intl.dart';

class TestsContent extends StatelessWidget {
  
  final TestsState state;

  TestsContent({Key key, @required this.state});

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
                  child: Text('Pruebas', 
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
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child: Text('Lista de Pruebas', style: TextStyle(color: Colors.white),))
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
                    onPressed: () { },
                    icon: Icon(Icons.queue),
                    label: Text(
                      "Agregar Prueba",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  right: this.state.screen.width * .025,
                  top: 45,
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
                    top: -40,
                    left: this.state.screen.width * .025,
                    child: Center(
                      child: Container(
                        color: Colors.white,
                        width: (this.state.screen.width * .95) - this.state.widthMenu,
                        child: SingleChildScrollView(
                          scrollDirection: this.state.screen.isDesktop ? Axis.vertical : Axis.horizontal,
                          child: DataTable(
                            sortAscending: true,
                            sortColumnIndex: 0,
                            columns: [
                              DataColumn(label: Text('NOMBRE')),
                              DataColumn(label: Text('MODELO')),
                              DataColumn(label: Text('SPONSOR')),
                              DataColumn(label: Text('CLIENTE')),
                              DataColumn(label: Text('FECHA INICIO')),
                              DataColumn(label: Text('FECHA FIN')),
                              DataColumn(label: Text('ESTATUS')),
                              DataColumn(label: Text('VER')),
                              DataColumn(label: Text('ACCIONES'))
                            ],
                            rows:
                              this.state.tests.map(
                                  (test) => DataRow(
                                    cells: [
                                      DataCell(Text(test.name)),
                                      DataCell(Text(test.model)),
                                      DataCell(Text(test.sponsor)),
                                      DataCell(Text(test.client)),
                                      DataCell(Text(new DateFormat('dd/MM/y').format(test.dateStart))),
                                      DataCell(Text(new DateFormat('dd/MM/y').format(test.dateEnd))),
                                      DataCell(LabelStatus(status: test.status)),
                                      DataCell(Container(
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(3)),
                                          border: Border(
                                            top: BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
                                            left: BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
                                            right: BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
                                            bottom: BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
                                          ),
                                        ),
                                        child: FlatButton(
                                          textColor: Theme.of(context).primaryColor,
                                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                          splashColor: Colors.blueAccent,
                                          onPressed: () { },
                                          child: Text(
                                            "Ver Prueba",
                                            style: TextStyle(fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      )),
                                      DataCell(
                                        Container(
                                          child: PopupMenuButton<String>(
                                            tooltip: 'Acciones',
                                            onSelected: (String value) { },
                                            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                              PopupMenuItem<String>(
                                                value: 'edit',
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                                                      child: Icon(Icons.edit, color: Colors.grey[600])
                                                    ),
                                                    Text('Editar', style: TextStyle(color: Colors.grey[600]))
                                                  ],
                                                ),
                                              ),
                                              PopupMenuItem<String>(
                                                value: 'pause',
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                                                      child: Icon(Icons.pause_circle_outline, color: Colors.grey[600])
                                                    ),
                                                    Text('Pausar', style: TextStyle(color: Colors.grey[600]))
                                                  ],
                                                ),
                                              ),
                                              PopupMenuItem<String>(
                                                value: 'delete',
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                                                      child: Icon(Icons.delete_outline, color: Colors.grey[600])
                                                    ),
                                                    Text('Eliminar', style: TextStyle(color: Colors.grey[600]))
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        )
                                      )
                                    ]
                                  )
                              ).toList()
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}