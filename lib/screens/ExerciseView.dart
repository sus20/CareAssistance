
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ExerciseView extends StatefulWidget {

  ExerciseView({required Key key}): super(key: key);

  @override
  _ExerciseViewState createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> {
   late VideoPlayerController _controller;
   late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    String videoUrl = "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
    _controller = VideoPlayerController.network(videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double videoPlayerScreenScale = 5.8;
    return Scaffold(
      appBar: AppBar(
        title: Text('Übungsansicht'),
        centerTitle: true,
        elevation: 11.0,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: 40.0 * videoPlayerScreenScale,
        width: (40.0 * videoPlayerScreenScale * 16) / 9 ,
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if(_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(_controller.value.isPlaying? Icons.pause: Icons.play_arrow),
      ),


    );
  }
}
