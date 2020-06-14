import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:indigo/modules/common/appConfig.dart';
import 'package:indigo/modules/common/models/login.dart';
import 'package:indigo/modules/service/auth-model.dart';

import 'loginExection.dart';

class LoginService {
  String apiUrl;
  final storage = new FlutterSecureStorage();

  LoginService() {
    AppConfig.forEnviroment().then((config) => {
      apiUrl = config.apiUrl
    });
  }

  Future<String> getPokemons() async {
    final response = await http.get('https://pokeapi.co/api/v2/pokemon');

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<bool> auth(String email, String password) async {
    Login login = new Login(email: email, password: password);

    final response = await http.post('${this.apiUrl}auth/login', body: login.toJson());
    AuthModel authModel = new AuthModel().fromJson(response.body);

    if (response.statusCode == 200) {
      storage.write(key: 'token', value: authModel.accessToken);

      return true;
    } else {
      throw LoginException(authModel.error);
    }
  }
}