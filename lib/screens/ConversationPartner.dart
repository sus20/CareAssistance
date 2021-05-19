import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:refresh/models/ColorData.dart';
import 'package:refresh/screens/PartnerDetails.dart';

class ConversationPartner extends StatefulWidget {
  const ConversationPartner({Key key}) : super(key: key);

  @override
  _ConversationPartnerState createState() => _ConversationPartnerState();
}

class _ConversationPartnerState extends State<ConversationPartner> {
  int _radioValue = -1;
  bool _checkBox1 = false;
  bool _checkBox2 = false;
  bool _checkBox3 = false;
  bool _checkBox4 = false;
  int km = -1;
  int age = -1;

  double fontSizeOfText = 15.0;

  void _handleRadioValueChange1(value) {
    int val = int.parse(value.toString());
    setState(() {
      _radioValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.blueDark,
      appBar: AppBar(
        title: Text(
          'Gesprächspartner',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 11.0,
        backgroundColor: ColorData.blue,
      ),
      body: new SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, bottom: 5),
                      child: Text(
                        'Ich suche...',
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange1,
                    ),
                    title: Text(
                      "Nutzer mit Mail Adresse",
                      style: TextStyle(
                        fontSize: fontSizeOfText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                  ListTile(
                    leading: Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange1,
                    ),
                    title: Text(
                      "Nutzer mit Tel. Nummer",
                      style: TextStyle(
                        fontSize: fontSizeOfText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                  ListTile(
                    leading: Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: (val) => _handleRadioValueChange1(val),
                    ),
                    title: Text(
                      "Andere Kontaktmöglichkeit",
                      style: TextStyle(
                        fontSize: fontSizeOfText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                  ListTile(
                    leading: Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange1,
                    ),
                    title: Text(
                      "Adresse (Brief)",
                      style: TextStyle(
                        fontSize: fontSizeOfText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                  SizedBox(height: 5)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            child: Card(
              child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 5),
                    child: Text(
                      'Die/Der Partner/in...',
                    ),
                  ),
                ),
                ListTile(
                  leading: Checkbox(
                    value: _checkBox1,
                    onChanged: (value) {
                      setState(() {
                        _checkBox1 = value.toString() == 'true' ? true : false;
                      });
                    },
                  ),
                  title: Text(
                    "soll Männlich sein.",
                    style: TextStyle(
                      fontSize: fontSizeOfText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                ListTile(
                  leading: Checkbox(
                    value: _checkBox2,
                    onChanged: (value) {
                      setState(() {
                        _checkBox2 = value.toString() == 'true' ? true : false;
                      });
                    },
                  ),
                  title: Text(
                    "soll Weiblich sein.",
                    style: TextStyle(
                      fontSize: fontSizeOfText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                ListTile(
                  leading: Checkbox(
                    value: _checkBox3,
                    onChanged: (value) {
                      setState(() {
                        _checkBox3 = value.toString() == 'true' ? true : false;
                      });
                    },
                  ),
                  title: Column(children: [
                    Row(children: [
                      Text(
                        "Soll innerhalb von ",
                        style: TextStyle(
                          fontSize: fontSizeOfText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 80.0,
                        height: 30.0,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            try {
                              km = int.parse(value.toString());
                            } on Exception {}
                          },
                        ),
                      ),
                    ]),
                    Row(children: [
                      Text(
                        "km Reichweite sein.",
                        style: TextStyle(
                          fontSize: fontSizeOfText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])
                  ]),
                  visualDensity: VisualDensity.compact,
                ),
                ListTile(
                  leading: Checkbox(
                    value: _checkBox4,
                    onChanged: (value) {
                      setState(() {
                        _checkBox4 = value.toString() == 'true' ? true : false;
                      });
                    },
                  ),
                  title: Row(children: [
                    Text(
                      "Soll ca. ",
                      style: TextStyle(
                        fontSize: fontSizeOfText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 55.0,
                      height: 30.0,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          try {
                            age = int.parse(value.toString());
                          } on Exception {}
                        },
                      ),
                    ),
                    Text(
                      "  Jahre alt sein.",
                      style: TextStyle(
                          fontSize: fontSizeOfText,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
                  visualDensity: VisualDensity.compact,
                ),
                SizedBox(height: 5)
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9, right: 9, top: 5),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    primary: ColorData.blueLight,
                  ),
                  onPressed: () {
                    // if "Fertig" button is pressed but not all results are != -1 show an error message
                    if (_radioValue == -1 ||
                        (!_checkBox1 &&
                            !_checkBox2 &&
                            !_checkBox3 &&
                            !_checkBox4)) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Unvollständige Details'),
                            content: Text(
                                'Bitte wähle mindestens eine Option im oberen und im unteren Feld aus.'),
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
                    } else {
                      List<dynamic> radioAndCheckBoxData = [
                        _radioValue,
                        _checkBox1,
                        _checkBox2,
                        _checkBox3,
                        _checkBox4,
                        km,
                        age
                      ];

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PartnerDetails(
                              radioAndCheckBoxData: radioAndCheckBoxData),
                        ),
                      );
                    }
                  },
                  child: Text('Suchen')),
            ),
          ),
        ],
      )),
    );
  }
}
