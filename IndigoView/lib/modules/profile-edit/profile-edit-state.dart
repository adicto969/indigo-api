import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:indigo/modules/common/responsive/screenResponsive.dart';
import 'package:indigo/modules/profile-edit/models/profile-model.dart';
import 'package:indigo/modules/profile-edit/profile-edit-content.dart';
import 'package:indigo/modules/profile-edit/profile-edit-page.dart';
import 'package:indigo/utils/HexColor.dart';

class ProfileEditState extends State<ProfileEditPage> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ScreenResponsive screen;
  TextStyle labels;
  TextStyle textLabel;
  TextStyle title;
  TextStyle subTitle;
  Uint8List imageTemp;
  Uint8List imageTempCompany;
  ProfileModel profile;

  @override
  void initState() {
    super.initState();
    this.screen = new ScreenResponsive(context);
    this.labels = TextStyle(color: HexColor.fromHex('#a0afc6'), fontWeight: FontWeight.w600, fontSize: 14);
    this.textLabel = TextStyle(color: Colors.black, fontWeight: FontWeight.w400);
    Future.delayed(Duration.zero, () {
      setState(() {
        this.title = TextStyle(color: Theme.of(context).primaryColor, fontSize: 18, fontWeight: FontWeight.w600);
        this.subTitle = TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontWeight: FontWeight.w600);
      });
    });
    this.profile = new ProfileModel(name: 'Juan Perez', address: '', company: '', rfc: '', telephone: '', email: 'juan_rivera99@hotmail.com');
  }

  double get widthMenu {
    return screen.isDesktop ? 80 : 0;
  }

  void setImageProfile(Uint8List tempImage) {
    setState(() {
      this.imageTemp = tempImage;
    });
  }

  void setImageCompany(Uint8List tempImage) {
    setState(() {
      this.imageTempCompany = tempImage;
    });
  }

  String validInput(String value, String field) {

    if (value.isEmpty) {
      return 'El campo $field es requerido';
    }

    setState(() {
      switch(field) {
        case 'name':
          this.profile.name = value;
          break;
        case 'company':
          this.profile.company = value;
          break;
        case 'telephone':
          this.profile.telephone = value;
          break;
        case 'address':
          this.profile.address = value;
          break;
        case 'rfc': 
          this.profile.rfc = value;
          break;
        default:
          break;
      }
    });

    return null;
  }

  void submit() {
    if (formKey.currentState.validate()) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        content: Container(
          width: screen.width * .80,
          child: Text('Usuario Actualizado'),
          color: Theme.of(context).primaryColor,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: ProfileEditContent(state: this),
    );
  }
}