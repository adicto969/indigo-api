import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indigo/modules/common/buttons/close-button-custom/close-button-custom.dart';
import 'package:indigo/modules/common/video-item/video-item.dart';
import 'package:indigo/utils/HoverExtensions.dart';

void showDialogVideo(BuildContext context, VideoItem videoItem, double width) {
  Dialog dialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3.0)
    ),
    child: Container(
      width: width.isNaN ? 600.0 : width,
      height: MediaQuery.of(context).size.height * .50,
      child: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            color: Theme.of(context).primaryColor,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                    child: Text('VIDEO INSTRUCTIVO', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: CloseButtonCustom(icon: Icon(Icons.close, color: Colors.white)).showCursorOnHover
                    ),
                  )
                )
              ],
            ),
          ),
          Container(
            color: Colors.black,
            height: (MediaQuery.of(context).size.height * .50) - 40.0,
            child: videoItem,
          )
        ],
      ),
    ),
  );

  showDialog(context: context, builder: (BuildContext context) => dialog, barrierDismissible: false);
}