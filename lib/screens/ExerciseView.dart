import 'package:flutter/material.dart';
import 'package:refresh/models/ColorData.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseView extends StatefulWidget {
  final List<Map<String, String>> exerciseData;
  ExerciseView({Key key, this.exerciseData}) : super(key: key);

  @override
  _ExerciseViewState createState() => _ExerciseViewState(exerciseData);

}

class _ExerciseViewState extends State<ExerciseView> {

  List<Map<String, String>> exerciseData;
  String videoURL;
  String exerciseTitle;
  String exerciseDesc;
  YoutubePlayerController _controller;

  _ExerciseViewState(exerciseData) {
        this.exerciseData = exerciseData;
        videoURL = exerciseData[0].values.elementAt(0);
        exerciseTitle = exerciseData[0].values.elementAt(1);
        exerciseDesc =  exerciseData[0].values.elementAt(2);


        _controller =  YoutubePlayerController(
            initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
            flags: YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
            forceHD: false,
            isLive: false,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Übungsansicht', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: ColorData.blue,
      ),

    body: Center(
      child: Container(
        color: ColorData.blueDark,
        width: MediaQuery.of(context).size.width / 1.0,
        child: Column(
          children: <Widget>[

                 new Padding(padding: new EdgeInsets.all(18.0)),
                Text(exerciseTitle,
                     style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                     ),
                ),
                 new Padding(padding: new EdgeInsets.all(48.0)),
                 YoutubePlayer(
                      controller: _controller,
                      liveUIColor: Colors.amber,
                    ),
          ],
        ),
      ),
            ),
    );
  }
}

