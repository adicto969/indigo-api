import 'package:flutter/material.dart';
import 'package:indigo/modules/company/company-module.dart';
import 'package:indigo/modules/layout/layout-module.dart';
import 'package:indigo/modules/login/login-module.dart';
import 'package:indigo/modules/not-found/not-found.module.dart';
import 'package:indigo/modules/questionary/questionary-module.dart';
import 'package:indigo/modules/register/register-module.dart';
import 'package:indigo/modules/currency/currency-module.dart';
import 'package:indigo/modules/product/product-module.dart';
import 'package:indigo/modules/test-models/test-model-module.dart';
import 'package:indigo/modules/sponsor/sponsor-module.dart';

class MainRouting {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case 'login':
        return _getPageRoute(LoginModule(), settings.name);
      case 'register':
        return _getPageRoute(RegisterModule(), settings.name);
      case 'questionary':
        return _getPageRoute(QuestionaryModule(), settings.name);
      case 'currency':
        return _getPageRoute(CurrencyModule(), settings.name);
      case 'product':
        return _getPageRoute(ProductModule(), settings.name);
      case 'testmodel':
        return _getPageRoute(TestModelModule(), settings.name);
      case 'sponsor':
        return _getPageRoute(SponsorModule(), settings.name);
      case 'company':
        return _getPageRoute(CompanyModule(), settings.name);
      case 'index':
      case 'index/profile':
        return MaterialPageRoute(builder: (_) => LayoutModule(), settings: RouteSettings(name: settings.name));
      default :
        return _getPageRoute(NotFoundModule(error: 'main',), settings.name);
    }
  }

  static PageRoute _getPageRoute(Widget child, String routeName) {
    return _MainFadeRoute(child: child, routeName: routeName);
  }

}

class _MainFadeRoute extends PageRouteBuilder {
  
  final Widget child;
  final String routeName;

  _MainFadeRoute({this.child, this.routeName})
    : super(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation
      ) => 
        child,
        settings: RouteSettings(name: routeName),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child
        ) => FadeTransition(
          opacity: animation,
          child: child,
        )
    );

}