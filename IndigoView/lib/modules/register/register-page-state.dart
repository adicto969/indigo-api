import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:indigo/modules/common/dialog/dialog-video.dart';
import 'package:indigo/modules/common/video-item/video-item.dart';
import 'package:indigo/modules/register/models/register-model.dart';
import 'package:indigo/utils/ValidatorText.dart';
import 'register-page-content.dart';
import 'register-page.dart';
import 'package:video_player/video_player.dart';
import 'package:indigo/utils/HoverExtensions.dart';

class RegisterPageState extends State<RegisterPage> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool reader = false;
  Color readerColor = Colors.black;
  Register register = new Register();

  double get getWidth {
    return MediaQuery.of(context).size.width;
  }

  double get widthContainer {
    return getWidth > 800 ? getWidth * .50 : getWidth * .90;
  }

  double get widthContainerHeader {
    return getWidth > 944 ? getWidth * .50 : getWidth * .90;
  }

  double get widthDescriptionVideo {
    double result = getWidth > 800 ? ((getWidth * .50) * .60 - 15.0) : widthContainer;
    return result > 340 ? result : getWidth;
  }

  double get widthButtonVideo {
    double result = getWidth > 800 ? (getWidth * .50) * .40 : getWidth;
    return result > 237 ? result : getWidth;
  }

  String validEmpy(String value) {
    print(value);
    if (value.isEmpty) {
      return 'El campo es obligatorio';
    }
    return null;
  }

  String validEmail(String value) {
    if (value.isEmpty) {
      return 'El campo es obligatorio';
    } else if (!ValidatorText.email(value)) {
      return 'Ingrese un email valido';
    }

    return null;
  }

  void chageReader(bool value) {
    setState(() {
      reader = value;
      if (reader) {
        readerColor = Colors.black;
      }
    });
  }

  void submit() {    
    if (formKey.currentState.validate() && reader) {
      formKey.currentState.save();
      Navigator.of(context).pushNamed('/questionary');
      print(jsonEncode(this.register));
    }

    if (!reader) {
      setState(() {
        readerColor = Colors.red;
      });
    }
  }

  void setValue(value, property) {
    var registerJson = this.register.toJson();
    registerJson[property] = value;
    this.register.fromJson(jsonEncode(registerJson));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(getWidth, 200),
        child: Container(
          height: 70.0,
          width: getWidth,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Container(
              width: widthContainerHeader,
              height: 70.0,
              child: getWidth > 600 ? Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Text('Horkest $getWidth', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 35.0))
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FlatButton.icon(
                          color: Colors.black,
                          icon: Icon(Icons.play_circle_outline, color: Colors.white),
                          label: Text('VER VIDEO INSTRUCTIVO', style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            showDialogVideo(context, VideoItem(
                                      videoPlayerController: VideoPlayerController.asset('assets/videos/Axiologia.mp4'),
                                    ), widthContainer);
                          },
                        ).showCursorOnHover,
                      ),
                    ),
                  )
                ],
              ) : Center(
                child: Text('Horkest $getWidth', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 35.0))
              ),
            ),
          ),
        )
      ),
      body: RegisterPageContent(registerPageState: this),
    );
  }
}