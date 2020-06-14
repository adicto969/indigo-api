import 'package:flutter/material.dart';
import 'package:indigo/modules/common/responsive/screenResponsive.dart';
import 'package:indigo/modules/profile/profile-content.dart';
import 'package:indigo/modules/profile/profile-page.dart';
import 'package:indigo/utils/HexColor.dart';

class ProfileState extends State<ProfilePage> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ScreenResponsive screen;
  TextStyle labels;
  TextStyle textLabel;
  TextStyle title;

  @override
  void initState() {
    super.initState();    
    this.screen = new ScreenResponsive(context);
    this.labels = TextStyle(color: HexColor.fromHex('#a0afc6'), fontWeight: FontWeight.w600, fontSize: 14);
    this.textLabel = TextStyle(color: Colors.black, fontWeight: FontWeight.w400);
    Future.delayed(Duration.zero, () {
      setState(() {
        this.title = TextStyle(color: Theme.of(context).primaryColor, fontSize: 18, fontWeight: FontWeight.w600);
      });
    });
  }

  double get widthMenu {
    return screen.isDesktop ? 80 : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: ProfileContent(state: this),
    );
  }
}