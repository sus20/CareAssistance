import 'package:flutter/material.dart';
import 'package:refresh/models/ColorData.dart';
import 'package:refresh/models/ExerciseData.dart';

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
        title: Text('Übungsübersicht', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: ColorData.blue,
      ),
      backgroundColor: ColorData.blueDark,
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
            new Padding(padding: new EdgeInsets.all(12.0)),
            SizedBox(
              height: selectedDataList.length * 72.0,
              child: Card(
                color: ColorData.blueLight,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color:Colors.black,
                  ),
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
                        style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
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
