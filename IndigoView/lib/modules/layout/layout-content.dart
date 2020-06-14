import 'package:flutter/material.dart';
import 'package:indigo/modules/layout/layout-state.dart';
import 'package:indigo/modules/service/locator.dart';
import 'package:indigo/modules/service/navigation-service.dart';
import 'package:indigo/utils/HexColor.dart';
import 'package:indigo/utils/HoverExtensions.dart';
import 'package:indigo/utils/routing/router.dart';

class LayoutContent extends StatelessWidget {
  
  final LayoutState state;

  const LayoutContent({Key key, @required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          if (this.state.screen.isDesktop)
            Container(
              width: 80,
              padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
              color: Theme.of(context).bottomAppBarColor,
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.assignment, color: HexColor.fromHex('#c0c3d2')),
                    onPressed: () => state.showSlide(spandedTest: true, spandedUsers: false),
                  ).showCursorOnHover,
                  SizedBox(
                    height: 5,
                  ),
                  IconButton(
                    icon: Icon(Icons.people, color: HexColor.fromHex('#c0c3d2')),
                    onPressed: () => state.showSlide(spandedTest: false, spandedUsers: true),
                  ).showCursorOnHover,
                  SizedBox(
                    height: 5,
                  ),
                  IconButton(
                    icon: Icon(Icons.timeline, color: HexColor.fromHex('#c0c3d2')),
                    onPressed: state.showSlide,
                  ).showCursorOnHover,
                  SizedBox(
                    height: 5,
                  ),
                  IconButton(
                    icon: Icon(Icons.assignment, color: HexColor.fromHex('#c0c3d2')),
                    onPressed: state.showSlide,
                  ).showCursorOnHover,
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Container(
                        width: 80,
                        height: 120,
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 240,
                    color: HexColor.fromHex('#212c40'),
                    child: Center(
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text('ÍNDIGO', 
                          style: TextStyle(color: HexColor.fromHex('#c0c3d2'), fontSize: 16, fontWeight: FontWeight.w600), 
                          textDirection: TextDirection.ltr),
                      ),
                    ),
                  )
                ],
              ),
            )
          ,
          Container(
            width: this.state.screen.isDesktop ? state.screen.width - 80 : state.screen.width,
            color: HexColor.fromHex('#f4f5fa'),
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 70 - 30,
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                  alignment: Alignment.topCenter,
                  child: Container(
                    child: Navigator(
                      key: locator<NavigationService>().navigatorKey,
                      onGenerateRoute: generateRoute,
                      initialRoute: 'report-result',
                    ),
                  ),
                ),
                Container(
                  color: Theme.of(context).primaryColor,
                  height: 30,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(
                    right: 20
                  ),
                  child: Text('Todos los derechos reservador | Aviso de privacidad.', 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 12)
                  )  
                )
              ],
            )
          )
        ],
      ),
    );
  }
}