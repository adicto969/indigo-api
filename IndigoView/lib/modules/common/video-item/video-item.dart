import 'package:flutter/material.dart';
import 'package:indigo/modules/common/video-item/video-item-state.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  
  final VideoPlayerController videoPlayerController;
  final bool looping;

  VideoItem({
    Key key,
    @required this.videoPlayerController,
    this.looping = false
  }) : super(key: key);

  @override
  VideoItemState createState() => VideoItemState();
}