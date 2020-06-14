import 'package:flutter/material.dart';
import 'package:indigo/modules/service/locator.dart';
import 'package:indigo/modules/service/navigation-service.dart';

class NotFoundModule extends StatelessWidget {

  final String error;
  NavigationService _navigationService = locator<NavigationService>();

  NotFoundModule({this.error = ''});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Not found $error'),
            FlatButton(
              child: Text('Ir a index'),
              onPressed: (){
                _navigationService.navigateTo('login');
              },
            )
          ],
        ),
      ),
    );
  }
}