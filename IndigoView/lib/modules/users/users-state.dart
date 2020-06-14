import 'package:flutter/material.dart';
import 'package:indigo/modules/common/responsive/screenResponsive.dart';
import 'package:indigo/modules/users/models/user-model.dart';
import 'package:indigo/modules/users/users-content.dart';
import 'package:indigo/modules/users/users-page.dart';

class UsersState extends State<UsersPage> {

  GlobalKey<ScaffoldState> keyScaffold = new GlobalKey<ScaffoldState>();

  ScreenResponsive screen;
  List<UserModel> users = new List<UserModel>();

  @override 
  void initState() {
    super.initState();
    this.screen = new ScreenResponsive(context);
    this.users = <UserModel>[
      UserModel(id: 1, image: 'assets/images/profile.jpg', name: 'Juan Pérez', typeUser: 'Súper Administrador', company: 'Índigo', email: 'juan.perez@indigo.com'),
      UserModel(id: 2, image: 'assets/images/profile.jpg', name: 'Maríana Ramírez', typeUser: 'Usuario / Sponsor', company: 'Coca Cola', email: 'mariana_rm@coca-cola.com.mx'),
      UserModel(id: 3, image: null, name: 'Rodrigo Velázquez', typeUser: 'Usuario / Empresa', company: 'Mirka', email: 'rv@mirka.com'),
      UserModel(id: 4, image: 'assets/images/profile.jpg', name: 'Lorena Salas', typeUser: 'Usuario / Sponsor', company: 'Coca Cola', email: 'lorena-sl@coca-cola.com.mx'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyScaffold,
      body: UsersContent(state: this),
    );
  }
}