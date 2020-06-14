import 'package:flutter/material.dart';
import 'package:indigo/modules/common/responsive/screenResponsive.dart';
import 'package:indigo/modules/layout/layout-content.dart';
import 'package:indigo/modules/layout/layout-page.dart';
import 'package:indigo/utils/HexColor.dart';
import 'package:indigo/utils/HoverExtensions.dart';

class LayoutState extends State<LayoutPage> {
  
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ScreenResponsive screen;
  bool spandedTest = false;
  bool spandedUsers = false;

  @override
  void initState() {
    super.initState();

    screen = ScreenResponsive(context);
  }

  void showSlide({bool spandedTest = false, bool spandedUsers = false}) {

    setState(() {
      this.spandedTest = spandedTest;
      this.spandedUsers = spandedUsers;
    });

    scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(screen.width, 70),
        child: Container(
          child: Row(
            children: <Widget>[
              if (screen.isDesktop)
                Container(
                  width: 80, 
                  color: Theme.of(context).bottomAppBarColor,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Image(image: AssetImage('assets/images/icon-small.png'),),
                  ),
                )
              ,
              Container(
                width: screen.isDesktop ? screen.width - 80 : screen.width,
                height: 70.0,
                color: HexColor.fromHex('#f4f5fa'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                      child: IconButton(
                        icon: Icon(Icons.menu, size: 32.0).showCursorOnHover,
                        onPressed: showSlide,
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          if (!screen.isMobil)
                            Container(
                              width: 240,
                              height: 35,
                              child: TextFormField(
                                decoration: InputDecoration(

                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0)
                                  ),
                                  hintText: 'Buscar...',
                                  fillColor: Colors.white,
                                  filled: true
                                )
                              ),
                            )
                          ,
                          Container(
                            width: 195,
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/profile.jpg'),
                                        fit: BoxFit.contain
                                      )
                                    )
                                  ),
                                  Container(
                                    width: 120,
                                    height: 70,
                                    alignment: AlignmentDirectional.bottomCenter,
                                    child: PopupMenuButton<String>(
                                      child: Center(
                                        child: Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 90,
                                              child: Text(
                                                'Juan Pérez', 
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.grey[600]),
                                              ),
                                            ),
                                            Icon(Icons.keyboard_arrow_down, color: Colors.grey[600])
                                          ],
                                        )
                                      ),
                                      onSelected: (value) {},
                                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                        PopupMenuItem<String>(
                                          value: 'Perfil',
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                                                child: Icon(Icons.person, color: Colors.grey[600])
                                              ),
                                              Text('Perfil', style: TextStyle(color: Colors.grey[600]))
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'ajustes',
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                                                child: Icon(Icons.settings, color: Colors.grey[600])
                                              ),
                                              Text('Ajustes', style: TextStyle(color: Colors.grey[600]))
                                            ],
                                          )
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'logout',
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                                                child: Icon(Icons.power_settings_new, color: Colors.grey[600])
                                              ),
                                              Text('Cerrar sesión', style: TextStyle(color: Colors.grey[600]))
                                            ],
                                          )
                                        )
                                      ],
                                      offset: Offset(0, 100),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      drawer: Container(
        color: Theme.of(context).bottomAppBarColor,
        width: 300,
        child: Column(
          children: <Widget>[
            Container(
              width: 300,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              child: Image(image: AssetImage('assets/images/logo-login-color.png'),),
            ),
            Container(
              width: 300,
              height: screen.height - 120,
              child: ListView(
                children: <Widget>[
                  ExpansionTile(
                    initiallyExpanded: spandedTest,
                    leading: Icon(Icons.assignment, color: Colors.white,),
                    backgroundColor: HexColor.fromHex('#212c40'),
                    title: Text('Pruebas', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: ListTile(
                          title: Text('Lista de Prueba', style: TextStyle(color: HexColor.fromHex('#c0c3d2'), fontSize: 15.0),),
                        ).showCursorOnHover,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: ListTile(
                          title: Text('Crear Prueba', style: TextStyle(color: HexColor.fromHex('#c0c3d2'), fontSize: 15.0)),
                        ).showCursorOnHover,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: ListTile(
                          title: Text('Enviar Prueba', style: TextStyle(color: HexColor.fromHex('#c0c3d2'), fontSize: 15.0)),
                        ).showCursorOnHover,
                      )
                    ],
                  ).showCursorOnHover,
                  ExpansionTile(
                    initiallyExpanded: spandedUsers,
                    leading: Icon(Icons.people, color: Colors.white),
                    backgroundColor: HexColor.fromHex('#212c40'),
                    title: Text('Usuarios', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: ListTile(
                          title: Text('Lista de Usuarios', style: TextStyle(color: HexColor.fromHex('#c0c3d2'), fontSize: 15.0)),
                        ).showCursorOnHover,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: ListTile(
                          title: Text('Crear Sponsor', style: TextStyle(color: HexColor.fromHex('#c0c3d2'), fontSize: 15.0)),
                        ).showCursorOnHover,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: ListTile(
                          title: Text('Crear Empresa', style: TextStyle(color: HexColor.fromHex('#c0c3d2'), fontSize: 15.0)),
                        ).showCursorOnHover,
                      )
                    ],
                  ).showCursorOnHover,
                  ListTile(
                    leading: Icon(Icons.timeline, color: HexColor.fromHex('#c0c3d2')),
                    title: Text('Reporte de Resultados', style: TextStyle(color: HexColor.fromHex('#c0c3d2'), fontSize: 15.0)),
                  ).showCursorOnHover,
                  ListTile(
                    leading: Icon(Icons.assignment, color: HexColor.fromHex('#c0c3d2')),
                    title: Text('Estados de cuenta', style: TextStyle(color: HexColor.fromHex('#c0c3d2'), fontSize: 15.0)),
                  ).showCursorOnHover
                ],
              ),
            )
          ],
        ),
      ),
      body: LayoutContent(state: this),
    );
  }
}