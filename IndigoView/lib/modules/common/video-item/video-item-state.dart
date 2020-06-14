import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:indigo/modules/common/video-item/video-item.dart';

class VideoItemState extends State<VideoItem> {

  ChewieController chewieController;

  @override 
  void initState() {
    super.initState();

    chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoInitialize: true,
      looping: widget.looping,

      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.red)
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: chewieController,
    );
  }

  @override
  void dispose() {
    super.dispose();

    widget.videoPlayerController.dispose();
    chewieController.dispose();
  }
}