import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:refresh/models/ColorData.dart';

class InstallationScreen extends StatefulWidget {
  _InstallationScreen createState() => _InstallationScreen();
}

List<dynamic> globalSelection = [
  null,
  null,
  null,
  null,
  null
]; // Each question has one selection, stored in globalSelection

class _InstallationScreen extends State<InstallationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              globalSelection = [
                null,
                null,
                null,
                null,
                null
              ]; // Reset Selection for next time
              Navigator.of(context).pop();
            }),
        title: Text("Hallo!"),
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
                      child: Text("Wie heißt du?"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (String ip) {
                            globalSelection[0] = ip;
                          },
                        ),
                        width: 200,
                        height: 20,
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text("Wie alt bist du?"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            // textfield requires finite size boundary in rows
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                counterText: '',
                              ),
                              onChanged: (String ip) {
                                globalSelection[1] = ip;
                              },
                              maxLength: 3,
                              maxLengthEnforcement: MaxLengthEnforcement
                                  .truncateAfterCompositionEnds,
                            ),
                            height: 20,
                            width: 30,
                          ),
                          Text(" Jahre")
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text("Wie geht es dir generell?"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.sentiment_dissatisfied_outlined),
                          iconSize: 30,
                          color: (globalSelection[2] != null &&
                                  globalSelection[2] ==
                                      0) // if selection is null, nothing has been selected yet
                              ? Colors.red[900]
                              : Colors.black, // color switch on local selection
                          onPressed: () {
                            setState(() {
                              globalSelection[2] = 0; //Update selection
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.sentiment_dissatisfied),
                          iconSize: 30,
                          color: (globalSelection[2] != null &&
                                  globalSelection[2] == 1)
                              ? Colors.orange[900]
                              : Colors.black,
                          onPressed: () {
                            setState(() {
                              globalSelection[2] = 1;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.sentiment_satisfied),
                          iconSize: 30,
                          color: (globalSelection[2] != null &&
                                  globalSelection[2] == 2)
                              ? Colors.amber
                              : Colors.black,
                          onPressed: () {
                            setState(() {
                              globalSelection[2] = 2;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.sentiment_satisfied_alt),
                          iconSize: 30,
                          color: (globalSelection[2] != null &&
                                  globalSelection[2] == 3)
                              ? Colors.green[200]
                              : Colors.black,
                          onPressed: () {
                            setState(() {
                              globalSelection[2] = 3;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.sentiment_very_satisfied),
                          iconSize: 30,
                          color: (globalSelection[2] != null &&
                                  globalSelection[2] == 4)
                              ? Colors.green
                              : Colors.black,
                          onPressed: () {
                            setState(() {
                              globalSelection[2] = 4;
                            });
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text("Hast du schon einmal meditiert?"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          icon: Icon(
                            Icons.check_circle_outline_outlined,
                            color: (globalSelection[3] != null &&
                                    globalSelection[3] == 0)
                                ? Colors.green
                                : Colors.black,
                          ),
                          label: Text(
                            'Ja',
                            style: TextStyle(
                                color: (globalSelection[3] != null &&
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
                            color: (globalSelection[3] != null &&
                                    globalSelection[3] == 1)
                                ? Colors.green
                                : Colors.black,
                          ),
                          label: Text(
                            'Nein',
                            style: TextStyle(
                                color: (globalSelection[3] != null &&
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
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text("Betreibst du Sport?"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            icon: Icon(
                              Icons.check_circle_outline_outlined,
                              color: (globalSelection[4] != null &&
                                      globalSelection[4] == 0)
                                  ? Colors.green
                                  : Colors.black,
                            ),
                            label: Text(
                              'Ja',
                              style: TextStyle(
                                  color: (globalSelection[4] != null &&
                                          globalSelection[4] == 0)
                                      ? Colors.green
                                      : Colors.black),
                            ),
                            onPressed: () {
                              setState(() {
                                globalSelection[4] = 0;
                              });
                            },
                          ),
                          TextButton.icon(
                            icon: Icon(
                              Icons.not_interested,
                              color: (globalSelection[4] != null &&
                                      globalSelection[4] == 1)
                                  ? Colors.green
                                  : Colors.black,
                            ),
                            label: Text(
                              'Nein',
                              style: TextStyle(
                                  color: (globalSelection[4] != null &&
                                          globalSelection[4] == 1)
                                      ? Colors.green
                                      : Colors.black),
                            ),
                            onPressed: () {
                              setState(() {
                                globalSelection[4] = 1;
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
                    left: 4, right: 4, top: 10, bottom: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        primary: (globalSelection.contains(null))
                            ? Colors.grey[
                                400] // as long as a selection is null the button will be shown grey ('deactivated')
                            : ColorData.blueDark),
                    onPressed: () async {
                      if (globalSelection.contains(null)) {
                        // if "Fertig" button is pressed but not all results are != null show an error message
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Unvollständige Details'),
                              content: Text(
                                  'Bitte beantworte alle Fragen damit die App noch besser für dich eingerichtet wird.'),
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
                            'Results:${globalSelection[0]},${globalSelection[1]},${globalSelection[2]},${globalSelection[3]},${globalSelection[4]}'); // for later use this would be the gathered results
                        globalSelection = [
                          null,
                          null,
                          null,
                          null,
                          null
                        ]; // Reset Selection for next time screen gets opened

                        // INSTALLATION:
                        try {
                          var dir = await getApplicationDocumentsDirectory();
                          var installedToggle = new File('${dir.path}/installed.txt');
                          installedToggle.create();
                        } on Exception catch (e) {
                          print('Exception while saving Install Toggle: $e');
                        }
                        print('Install complete');

                        if (globalSelection[2] == 0) Navigator.of(context).pushNamed('/'); // ADD HERE 'Falls es nicht reicht' SCREEN!
                        else Navigator.of(context).pushNamed('/');
                      }
                    },
                    child: Text("Fertig"),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                "Alle diese Daten bleiben bei dir. Wir kriegen die nicht.",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
