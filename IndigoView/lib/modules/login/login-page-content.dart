import 'package:flutter/material.dart';
import 'package:indigo/modules/login/login-page-state.dart';
import 'package:indigo/utils/HexColor.dart';
import 'package:indigo/utils/HoverExtensions.dart';

class LoginPageContent extends StatelessWidget {
  final LoginPageState loginPageState;

  const LoginPageContent({Key key, this.loginPageState});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (!loginPageState.screenResponsive.isMobil)
            Expanded(
              flex: 5,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    color: HexColor.fromHex('#f5f6fa'),
                    height: loginPageState.screenResponsive.height * 0.70,
                  ),
                  Positioned(
                    top: -(loginPageState.screenResponsive.height * 0.15) / 2,
                    right: 0,
                    child: Container(
                      height: loginPageState.screenResponsive.height * 0.85,
                      width: loginPageState.screenResponsive.width * 0.45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/background-login.png"),
                          fit: BoxFit.cover
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
                            child: Text('BIENVENIDO', 
                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40.0, 0, 40.0, 0),
                            child: Image(image: AssetImage('assets/images/logo-login.png')),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                            child: Text('Las personas correctas', style: TextStyle(color: Colors.white, fontSize: 16.0), textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                            child: Text('en el lugar correcto', style: TextStyle(color: Colors.white, fontSize: 16.0),textAlign: TextAlign.center),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ))
          ,
          Expanded(
            flex: loginPageState.screenResponsive.isMobil ? 10 : 5,
            child: Container(
              color: HexColor.fromHex('#f5f6fa'),
              height: loginPageState.screenResponsive.isMobil ? loginPageState.screenResponsive.height : loginPageState.screenResponsive.height * 0.70,
              child: Form(
                  key: loginPageState.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: loginPageState.screenResponsive.isMobil ? loginPageState.screenResponsive.width * .80 : loginPageState.screenResponsive.width < 1305 ?  loginPageState.screenResponsive.width * .45 : loginPageState.screenResponsive.width * .25,
                        height: loginPageState.screenResponsive.height * .70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          textDirection: TextDirection.rtl,
                          children: <Widget>[
                            if (loginPageState.screenResponsive.isMobil)
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 60.0),
                                  child: Image(image: AssetImage('assets/images/logo-login-color.png')),
                                ),
                              )
                            ,
                            Text('INGRESA TUS DATOS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor)),
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                                child: Text(
                                  'Inicia sesión para continuar.',
                                  style: TextStyle(color: Colors.grey),
                                )),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 10.0),
                              child: Text('USUARIO*',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12.0)),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              child: TextFormField(
                                validator: loginPageState.validEmail,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    prefixIcon: Icon(Icons.person_outline),
                                    hintText: "Ingresa tu dirección de correo",
                                    border: OutlineInputBorder()),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
                              child: Text('CONTRASEÑA*',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12.0)),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: TextFormField(
                                    validator: loginPageState.validPassword,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        prefixIcon: Icon(Icons.lock_outline),
                                        hintText: "Ingresa tu contraseña",
                                        border: OutlineInputBorder()),
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true)),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0.0, 0.0, 0.0, 0.0),
                                          child: Switch(
                                                  value: loginPageState.rememberMe,
                                                  onChanged: loginPageState.changeRememberMe)
                                              .showCursorOnHover,
                                        ),
                                        Text('Recordar mis datos',
                                            style: TextStyle(fontSize: 12.0))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0.0, 0.0, 5.0, 0.0),
                                          child: Icon(Icons.lock_outline,
                                              size: 15.0),
                                        ),
                                        GestureDetector(
                                          onTap: loginPageState.clickLostPassword,
                                          child: Text(
                                                  'Olvide mi contraseña ${loginPageState.lostPassword}',
                                                  style:
                                                      TextStyle(fontSize: 12.0))
                                              .showCursorOnHover,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            if (loginPageState.error.isNotEmpty)
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                                child: Text(loginPageState.error, style: TextStyle(color: Colors.redAccent)),
                              )
                            ,
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                                child: SizedBox(
                                    width: double.infinity,
                                    child: FlatButton(
                                      onPressed: loginPageState.submit,
                                      child: !loginPageState.loading ? Text(
                                        'Ingresar',
                                        style: TextStyle(
                                            color: Colors.white),
                                      ) : SizedBox(
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                        ),
                                        height: 25,
                                        width: 25,
                                      ),
                                      color: Theme.of(context).primaryColor)
                                    .showCursorOnHover))
                          ],
                        ),
                      )
                    ],
                  )),
            ))
        ],
      )
    );
  }
}
