import 'package:flutter/material.dart';
import 'package:refresh/models/ExerciseData.dart';
import 'package:refresh/models/colorData.dart';
import 'ExerciseView.dart';

List<Map<String, String>> selectedDataList = [];
IconData exerciseIcon;

class ExerciseOverview extends StatelessWidget {
  final mode;

  ExerciseOverview({Key key, this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mode == "Meditation") {
      exerciseIcon = IconData(61178, fontFamily: 'MaterialIcons');
      selectedDataList = ExerciseData.meditationData;
    } else {
      exerciseIcon = IconData(58716, fontFamily: 'MaterialIcons');
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
                "$mode",
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 477,
              child: Card(
                color: Colors.brown[50],
                child: ListView.builder(
                  itemCount: selectedDataList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(12),
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
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              exerciseIcon,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "${selectedDataList[index].values.elementAt(1)}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            "${selectedDataList[index].values.elementAt(3)}",
                            textAlign: TextAlign.center,
                          ),
                        ),
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
