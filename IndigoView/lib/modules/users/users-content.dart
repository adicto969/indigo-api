import 'package:flutter/material.dart';
import 'package:indigo/modules/common/image-profile/image-profile.dart';
import 'package:indigo/modules/users/users-state.dart';
import 'package:indigo/utils/HexColor.dart';

class UsersContent extends StatelessWidget {
  
  final UsersState state;

  UsersContent({Key key, @required this.state});

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
            width: this.state.screen.width - this.state.screen.widthMenu,
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  child: Text('Usuarios',
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
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child: Text('Lista de Usuarios', style: TextStyle(color: Colors.white),))
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
                    icon: Icon(Icons.person_add),
                    label: Text(
                      "Agregar Usuario",
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
            height: this.state.screen.height,
            width: this.state.screen.width - this.state.screen.widthMenu,
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
                        width: (this.state.screen.width * .95) - this.state.screen.widthMenu,
                        child: SingleChildScrollView(
                          scrollDirection: this.state.screen.isDesktop ? Axis.vertical : Axis.horizontal,
                          child: DataTable(
                            sortAscending: true,
                            sortColumnIndex: 0,
                            columns: [
                              DataColumn(label: Text('ID')),
                              DataColumn(label: Text('USUARIO')),
                              DataColumn(label: Text('TIPO DE USUARIO')),
                              DataColumn(label: Text('EMPRESA')),
                              DataColumn(label: Text('CORREO')),
                              DataColumn(label: Text('DETALLE')),
                              DataColumn(label: Text('ACCIONES'))
                            ],
                            rows: 
                              this.state.users.map(
                                (user) => DataRow(
                                  cells: [
                                    DataCell(Text(user.id.toString())),
                                    DataCell(Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          ImageProfile(name: user.name, image: user.image),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                            child: Text(user.name),
                                          )
                                        ],
                                      ),
                                    )),
                                    DataCell(Text(user.typeUser)),
                                    DataCell(Text(user.company)),
                                    DataCell(Text(user.email)),
                                    DataCell(
                                      Container(
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
                                            "Ver Perfil",
                                            style: TextStyle(fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      )
                                    ),
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