import 'package:flutter/material.dart';
import 'package:indigo/modules/common/responsive/screenResponsive.dart';
import 'package:indigo/modules/service/login-service.dart';
import 'package:indigo/utils/ValidatorText.dart';
import 'login-page-content.dart';
import 'login-page.dart';

class LoginPageState extends State<LoginPage> {

  bool rememberMe = false;
  String lostPassword = 'NO';
  ScreenResponsive screenResponsive;
  LoginService loginService;
  String password;
  String email;
  String error = '';
  bool loading = false;
  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  double get width {
    return MediaQuery.of(context).size.width;
  }

  void changeRememberMe(value) {
    setState(() {
      this.rememberMe = value;
    });
  }

  void clickLostPassword() {
    setState(() {
      this.lostPassword = 'SI';
    });
  }

  void submit() {
    
    setState(() {
      this.error = '';
    });

    if (formKey.currentState.validate()) {

      setState(() {
        this.loading = true;
      });
      
      this.loginService.auth(this.email, this.password).then((result)=> {
        Navigator.of(context).pushNamed('/register')
      }).catchError((onError) => {
        setState(() {
          this.error = onError.toString();
        })
      }).whenComplete((){
        setState(() {
          loading = false;
        });
      });

      /*scaffoldKey.currentState.showSnackBar(SnackBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        content: Container(
          width: MediaQuery.of(context).size.width * .80,
          child: Text('¡Bienvenido!'),
          color: Colors.blueAccent,
        )
      ));*/
    }
  }

  String validEmail(String value) {
    if (value.isEmpty) {
      return 'Ingrese su usuario';
    } else if (!ValidatorText.email(value)) {
      return 'Ingrese un email valido';
    }

    this.email = value;

    return null;
  }

  String validPassword(String value) {
    if (value.isEmpty) {
      return 'Ingrese su contraseña';
    }

    this.password = value;

    return null;
  }

  @override
  void initState() {
    super.initState();

    this.loginService = new LoginService();
    this.screenResponsive = new ScreenResponsive(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: LoginPageContent(loginPageState: this),
    );
  }

}