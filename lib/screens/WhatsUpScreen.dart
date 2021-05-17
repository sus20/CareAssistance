import 'package:flutter/material.dart';
import 'package:refresh/models/ColorData.dart';

class WhatsUpScreen extends StatefulWidget {
  _WhatsUpScreen createState() => _WhatsUpScreen();
}

List<int> globalSelection = [
  -1,
  -1,
  -1,
  -1
]; // Each question has one selection, stored in globalSelection

class _WhatsUpScreen extends State<WhatsUpScreen> {
  Widget smileyPicker(int questionNr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.sentiment_dissatisfied_outlined),
          iconSize: 30,
          color: (globalSelection[questionNr] != -1 &&
                  globalSelection[questionNr] ==
                      0) // if selection is -1, nothing has been selected yet
              ? Colors.red[900]
              : Colors.black, // color switch on local selection
          onPressed: () {
            setState(() {
              globalSelection[questionNr] = 0; //Update selection
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.sentiment_dissatisfied),
          iconSize: 30,
          color: (globalSelection[questionNr] != -1 &&
                  globalSelection[questionNr] == 1)
              ? Colors.orange[900]
              : Colors.black,
          onPressed: () {
            setState(() {
              globalSelection[questionNr] = 1;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.sentiment_satisfied),
          iconSize: 30,
          color: (globalSelection[questionNr] != -1 &&
                  globalSelection[questionNr] == 2)
              ? Colors.amber
              : Colors.black,
          onPressed: () {
            setState(() {
              globalSelection[questionNr] = 2;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.sentiment_satisfied_alt),
          iconSize: 30,
          color: (globalSelection[questionNr] != -1 &&
                  globalSelection[questionNr] == 3)
              ? Colors.green[200]
              : Colors.black,
          onPressed: () {
            setState(() {
              globalSelection[questionNr] = 3;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.sentiment_very_satisfied),
          iconSize: 30,
          color: (globalSelection[questionNr] != -1 &&
                  globalSelection[questionNr] == 4)
              ? Colors.green
              : Colors.black,
          onPressed: () {
            setState(() {
              globalSelection[questionNr] = 4;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              globalSelection = [
                -1,
                -1,
                -1,
                -1
              ]; // Reset Selection for next time
              Navigator.of(context).pop();
            }),
        title: Text("Wie geht's?"),
      ),
      backgroundColor: ColorData.blueLight,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Text("Wie fühlst du dich heute?"),
                    ),
                    smileyPicker(0),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Text("Wie hast du heute geschlafen?"),
                    ),
                    smileyPicker(1),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Text("Wie stressig ist es momentan?"),
                    ),
                    smileyPicker(2),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Text("Möchtest du einen Fokus setzen?"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            icon: Icon(
                              Icons.self_improvement,
                              color: (globalSelection[3] != -1 &&
                                      globalSelection[3] == 0)
                                  ? Colors.green
                                  : Colors.black,
                            ),
                            label: Text(
                              'Meditation',
                              style: TextStyle(
                                  color: (globalSelection[3] != -1 &&
                                          globalSelection[3] == 0)
                                      ? Colors.green
                                      : Colors.black),
                            ),
                            onPressed: () {
                              setState(() {
                                globalSelection[3] = 0;
                              });
                            },
                          ),
                          TextButton.icon(
                            icon: Icon(
                              Icons.not_interested,
                              color: (globalSelection[3] != -1 &&
                                      globalSelection[3] == 1)
                                  ? Colors.green
                                  : Colors.black,
                            ),
                            label: Text(
                              'Nein',
                              style: TextStyle(
                                  color: (globalSelection[3] != -1 &&
                                          globalSelection[3] == 1)
                                      ? Colors.green
                                      : Colors.black),
                            ),
                            onPressed: () {
                              setState(() {
                                globalSelection[3] = 1;
                              });
                            },
                          ),
                          TextButton.icon(
                            icon: Icon(
                              Icons.accessibility_new_sharp,
                              color: (globalSelection[3] != -1 &&
                                      globalSelection[3] == 2)
                                  ? Colors.green
                                  : Colors.black,
                            ),
                            label: Text(
                              'Bewegung',
                              style: TextStyle(
                                  color: (globalSelection[3] != -1 &&
                                          globalSelection[3] == 2)
                                      ? Colors.green
                                      : Colors.black),
                            ),
                            onPressed: () {
                              setState(() {
                                globalSelection[3] = 2;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                //The parent padding causes buggy width, thats why this padding is needed
                padding: const EdgeInsets.only(
                    left: 4, right: 4, top: 10, bottom: 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        primary: (globalSelection.contains(-1))
                            ? Colors.grey[
                                400] // as long as a selection is -1 the button will be shown grey ('deactivated')
                            : ColorData.blueDark),
                    onPressed: () {
                      if (globalSelection.contains(-1)) {
                        // if "Fertig" button is pressed but not all results are != -1 show an error message
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Unvollständige Details'),
                              content: Text(
                                  'Bitte beantworte alle Fragen. So kann REfresh deine Nutzererfahrung noch besser machen.'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Okay'))
                              ],
                            );
                          },
                        );
                        print('Results invalid.');
                      } else {
                        print(
                            'Results:${globalSelection[0]},${globalSelection[1]},${globalSelection[2]},${globalSelection[3]}'); // for later use this would be the gathered results
                        globalSelection = [
                          -1,
                          -1,
                          -1,
                          -1
                        ]; // Reset Selection for next time screen gets opened
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text("Fertig"),
                  ),
                ),
              ),
              Padding(
                //The parent padding causes buggy width, thats why this padding is needed
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: SizedBox(
                  width: double
                      .infinity, // Stretch Button Width to infinity (Width Boundary then cut by padding)
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        primary: ColorData.blueDark),
                    onPressed: () {
                      // Results can be -1 without showing warning
                      globalSelection = [
                        -1,
                        -1,
                        -1,
                        -1
                      ]; // Reset Selection for next time
                      Navigator.of(context).pop();
                    },
                    child: Text("Überspringen"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
