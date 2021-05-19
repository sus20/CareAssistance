import 'package:flutter/material.dart';
import 'package:refresh/models/ColorData.dart';
import 'package:refresh/models/ExerciseData.dart';
import 'ExerciseView.dart';

List<Map<String, String>> selectedDataList = [];
IconData exerciseIcon;

class ExerciseOverview extends StatelessWidget {
  final mode;

  ExerciseOverview({Key key, this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mode == "Meditation") {
      exerciseIcon = Icons.self_improvement;
      selectedDataList = ExerciseData.meditationData;
    } else {
      exerciseIcon = Icons.accessibility;
      selectedDataList = ExerciseData.sportsData;
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pushNamed('/homeScreen');
          },
        ),
        title: Text('Übungen zu $mode'),
        centerTitle: true,
        backgroundColor: ColorData.blue,
      ),
      backgroundColor: ColorData.blueDark,
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              height: 477,
              child: Card(
                //We got the concept of the ListView builder from the flutter-docs:
                //https://api.flutter.dev/flutter/widgets/ListView-class.html
                child: ListView.builder(
                  itemCount: selectedDataList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      //We got the concept of the BoxDecoration from the flutter-docs:
                      //https://api.flutter.dev/flutter/painting/BoxDecoration-class.html
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9, right: 9, top: 5),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                child: Text(
                    'Ich möchte doch lieber ${(mode == 'Meditation') ? 'etwas Bewegung machen' : 'etwas meditieren'}'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExerciseOverview(
                          mode:
                              (mode == "Bewegung") ? "Meditation" : "Bewegung"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  primary: ColorData.blueLight,
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      )),
    );
  }
}
