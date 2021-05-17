import 'package:flutter/material.dart';
import 'package:refresh/models/colorData.dart';

import 'ExerciseView.dart';

List<Map<String, String>> selectedDataList = [];

final List<Map<String, String>> meditationData = [
  {
    "Titel": "Lichtmeditation",
    "Text": "Das ist super!",
    "Video": "www.youtube.com/super"
  },
  {
    "Titel": "Angstmeditation",
    "Text": "Das ist noch besser!",
    "Video": "www.youtube.com/yo"
  },
  {
    "Titel": "Test3",
    "Text": "Das ist noch besser!",
    "Video": "www.youtube.com/yo"
  },
  {
    "Titel": "Test4",
    "Text": "Das ist noch besser!",
    "Video": "www.youtube.com/yo"
  },
];

final List<Map<String, String>> sportData = [
  {
    "Titel": "Lichtmeditation",
    "Text": "Das ist super!",
    "Video": "www.youtube.com/super"
  },
  {
    "Titel": "Angstmeditation",
    "Text": "Das ist noch besser!",
    "Video": "www.youtube.com/yo"
  },
  {
    "Titel": "Test3",
    "Text": "Das ist noch besser!",
    "Video": "www.youtube.com/yo"
  },
  {
    "Titel": "Test4",
    "Text": "Das ist noch besser!",
    "Video": "www.youtube.com/yo"
  },
];

class ExerciseOverview extends StatelessWidget {
  final mode;

  ExerciseOverview({Key key, this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mode == "meditation") {
      selectedDataList = meditationData;
    } else {
      selectedDataList = sportData;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Übungsübersicht'),
        centerTitle: true,
        backgroundColor: ColorData.blueLight,
      ),
      backgroundColor: ColorData.blueLight,
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                "Übungen",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 250,
              child: Card(
                child: ListView.builder(
                  itemCount: meditationData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseView(
                              exerciseData: [
                                selectedDataList[index],
                              ],
                            ),
                          ),
                        );
                      },
                      title: Text(
                        "${selectedDataList[index].values.elementAt(0)}",
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
