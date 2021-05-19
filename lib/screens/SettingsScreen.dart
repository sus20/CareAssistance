import 'package:flutter/material.dart';
import 'package:refresh/models/ColorData.dart';
import 'package:refresh/models/WorkingDaysTimePicker.dart';

const IconData meditation = Icons.self_improvement;
const IconData conversation = Icons.people;
const IconData move = Icons.accessibility_new;
const IconData sun = Icons.wb_sunny;

class SettingsScreen extends StatefulWidget {
  final String title = 'Einstellungen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _chosenTheme;
  String _chosenLanguage;
  String _chosenNotificationPeriod;
  bool _isSwitched;

  void initState() {
    super.initState();
    _chosenTheme = 'Standard';
    _chosenLanguage = 'Deutsch';
    _chosenNotificationPeriod = '1';
    _isSwitched = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.of(context).pushNamed('/homeScreen');
            },
          ),
          title: Text(widget.title),
        ),
        backgroundColor: ColorData.blueDark,
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    'Design',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Farbthema',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                                // color: ColorData.yellowDark),
                              ),
                              SizedBox(width: 15),
                              DropdownButton<String>(
                                value: _chosenTheme,
                                iconSize: 24,
                                elevation: 24,
                                iconEnabledColor: ColorData.blueDark,
                                style: const TextStyle(
                                    color: ColorData.blueDark,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                underline: Container(
                                  height: 2,
                                  color: ColorData.blueDark,
                                ),
                                items: <String>[
                                  'Standard',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    _chosenTheme = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Tag / Nacht',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                                // color: ColorData.yellowDark),
                              ),
                              Switch(
                                value: _isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    _isSwitched = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Sprache',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                                // color: ColorData.yellowDark),
                              ),
                              SizedBox(width: 35),
                              DropdownButton<String>(
                                value: _chosenLanguage,
                                iconSize: 24,
                                elevation: 24,
                                iconEnabledColor: ColorData.blueDark,
                                style: const TextStyle(
                                    color: ColorData.blueDark,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                underline: Container(
                                  height: 2,
                                  color: ColorData.blueDark,
                                ),
                                items: <String>[
                                  'Deutsch',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    _chosenLanguage = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    color: ColorData.blueLight,
                  ),
                ),
                Center(
                  child: Text(
                    'Zeiten',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                    child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(left: 40, top: 20, right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Deine Arbeitszeiten',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                WorkingDaysTimePickerWidget(workingDay: "Mo"),
                                SizedBox(
                                  height: 2,
                                ),
                                WorkingDaysTimePickerWidget(workingDay: "Di"),
                                SizedBox(
                                  height: 2,
                                ),
                                WorkingDaysTimePickerWidget(workingDay: "Mi"),
                                SizedBox(
                                  height: 2,
                                ),
                                WorkingDaysTimePickerWidget(workingDay: "Do"),
                                SizedBox(
                                  height: 2,
                                ),
                                WorkingDaysTimePickerWidget(workingDay: "Fr"),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                WorkingDaysTimePickerWidget(workingDay: "Sa"),
                                SizedBox(
                                  height: 2,
                                ),
                                WorkingDaysTimePickerWidget(workingDay: "So"),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wie geht\'s alle',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  value: _chosenNotificationPeriod,
                                  iconSize: 24,
                                  elevation: 24,
                                  iconEnabledColor: ColorData.blueDark,
                                  style: const TextStyle(
                                      color: ColorData.blueDark,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  underline: Container(
                                    height: 2,
                                    color: ColorData.blueDark,
                                  ),
                                  items: <String>[
                                    '1',
                                    '2',
                                    '3',
                                    '4',
                                    '5',
                                    '7',
                                    '14',
                                    '21',
                                    '28',
                                    '30'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String value) {
                                    setState(() {
                                      _chosenNotificationPeriod = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Tage',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                  color: ColorData.blueLight,
                )),
                // SizedBox(height: 5),
              ],
            ),
          ),
        ));
  }
}
