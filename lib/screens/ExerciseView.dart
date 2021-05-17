import 'package:drop_cap_text/drop_cap_text.dart';
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

            autoPlay: false,
            mute: false,
            forceHD: false,
            controlsVisibleAtStart: true,
          ),
        );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String seperatedDesc = exerciseDesc;

    return Scaffold(
      backgroundColor: ColorData.blueDark,
      appBar: AppBar(
        title: Text('Übungsansicht', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: ColorData.blue,
      ),

    body: new SingleChildScrollView(
          child: Center(
          child: Container(
          width: MediaQuery.of(context).size.width / 1.0,
          child: Column(
            children: <Widget>[

                   new Padding(padding: new EdgeInsets.all(18.0)),
                  Container(
                    width: 200,
                    padding: EdgeInsets.only(
                      bottom: 4,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 3.0,
                          ),

                          )
                    ),
                    child: Text(exerciseTitle,
                         style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            ),

                         ),
                         alignment: Alignment.center,
                  ),


                   new Padding(padding: new EdgeInsets.all(48.0)),
                   YoutubePlayer(
                        controller: _controller,
                        liveUIColor: Colors.amber,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                        progressColors: ProgressBarColors(
                          playedColor: Colors.amber,
                          handleColor: Colors.amberAccent,
                        ),
                      ),

                    new Padding(padding: new EdgeInsets.all(18.0)),

                 ExpansionTile(
                   title:  Text("Anleitung",
                     style: TextStyle(
                         height: 1.3,
                         fontSize: 18,
                         color: Colors.white,
                        fontWeight: FontWeight.bold,
                         ),
                         textAlign: TextAlign.center,
                         ),

                    children:[ Container(
                     padding: EdgeInsets.all(14.0),
                     child: DropCapText(seperatedDesc,
                     style: TextStyle(
                       height: 1.3,
                       fontSize: 18,
                       color: Colors.white,
                       fontStyle: FontStyle.italic),
                       dropCapChars: 1,
                       textAlign: TextAlign.justify,
                       dropCapPadding: EdgeInsets.all(4.0),),
                   ),
                  ]

                 ),



            ],
          ),
        ),
              ),
    ),
    );
  }
}

