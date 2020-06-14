import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AppConfig {
  
  String apiUrl;

  AppConfig({this.apiUrl});

  static Future<AppConfig> forEnviroment() async {
    String env = kReleaseMode ? 'prod' : 'dev';

    final contents = await rootBundle.loadString('assets/config/$env.json');

    final json = jsonDecode(contents);

    return AppConfig(apiUrl: json['API_URL']);
  }
}