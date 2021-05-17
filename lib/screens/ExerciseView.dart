import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class ExerciseView extends StatefulWidget {
  final List<Map<String, String>> exerciseData;

  ExerciseView({Key key, this.exerciseData}) : super(key: key);

  @override
  _ExerciseViewState createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Übungsansicht'),
        centerTitle: true,
        elevation: 11.0,
        backgroundColor: Colors.blue,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayerPlaylist(
              betterPlayerConfiguration: BetterPlayerConfiguration(),
              betterPlayerPlaylistConfiguration:
                  BetterPlayerPlaylistConfiguration(),
              betterPlayerDataSourceList: createDataSet(),
            ),
          )),
    );
  }

  List<BetterPlayerDataSource> createDataSet() {
    List<BetterPlayerDataSource> dataSourceList = [];
    dataSourceList.add(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      ),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "http://sample.vodobox.com/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8"),
    );
    return dataSourceList;
  }
}
