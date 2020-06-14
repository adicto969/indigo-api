import 'package:flutter/material.dart';
import 'package:indigo/modules/login/login-module.dart';
import 'package:indigo/modules/not-found/not-found.module.dart';
import 'package:indigo/modules/profile/profile-module.dart';
import 'package:indigo/modules/profile-edit/profile-edit-module.dart';
import 'package:indigo/modules/report-result/report-result-module.dart';
import 'package:indigo/modules/tests/tests-module.dart';
import 'package:indigo/modules/users/users-module.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name) {
    case '/index/profile':
      return _getPageRoute(NotFoundModule(error: '/index/profile',), settings.name);
    case 'index/profile':
      return _getPageRoute(NotFoundModule(error: 'index/profile',), settings.name);
    case 'profile':
      return _getPageRoute(ProfileModule(), settings.name);
    case 'edit-profile': 
      return _getPageRoute(ProfileEditModule(), settings.name);
    case 'tests':
      return _getPageRoute(TestsModule(), settings.name);
    case 'users':
      return _getPageRoute(UsersModule(), settings.name);
    case 'report-result':
      return _getPageRoute(ReportResultModule(), settings.name);
    case '/profile':
      return _getPageRoute(NotFoundModule(error: '/profile',), settings.name);
    case 'login': 
      return _getPageRoute(LoginModule(), settings.name);
    default:
      return _getPageRoute(NotFoundModule(error: 'no page'), settings.name);
  }
}

PageRoute _getPageRoute(Widget child, String routeName) {
  return _FadeRoute(child: child, routeName: routeName);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({this.child, this.routeName}) 
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