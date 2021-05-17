import 'package:flutter/material.dart';
import 'package:refresh/models/ExerciseData.dart';
import 'package:refresh/models/colorData.dart';

import 'ExerciseView.dart';

List<Map<String, String>> selectedDataList = [];

class ExerciseOverview extends StatelessWidget {
  final mode;

  ExerciseOverview({Key key, this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mode == "meditation") {
      selectedDataList = ExerciseData.meditationData;
    } else {
      selectedDataList = ExerciseData.sportsData;
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
              height: selectedDataList.length * 60.0,
              child: Card(
                child: ListView.builder(
                  itemCount: selectedDataList.length,
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
                        "${selectedDataList[index].values.elementAt(1)}",
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
