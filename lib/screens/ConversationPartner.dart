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
      appBar: AppBar(
        title: Text(
          'Gesprächspartner',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 11.0,
        backgroundColor: ColorData.blue,
      ),
      body: Container(
        color: ColorData.blueDark,
        child: new SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            new Padding(padding: new EdgeInsets.all(4.0)),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                color: ColorData.blueLight,
                child: Column(children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'ICH SUCHE :',
                      style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  ListTile(
                    focusColor: Colors.green,
                    leading: Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange1,
                    ),
                    title: Text(
                      "Nutzer mit Mail Adresse.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSizeOfText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange1,
                    ),
                    title: Text(
                      "Nutzer mit Tel. Nummer.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSizeOfText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: (val) => _handleRadioValueChange1(val),
                    ),
                    title: Text(
                      "Andere Kontaktmöglichkeit.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSizeOfText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange1,
                    ),
                    title: Text(
                      "Adresse (Brief).",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSizeOfText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            new Padding(padding: new EdgeInsets.all(4.0)),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                color: ColorData.blueLight,
                child: Column(children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'DIE/DER PARTNER/IN :',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Checkbox(
                      value: _checkBox1,
                      onChanged: (value) {
                        setState(() {
                          _checkBox1 =
                              value.toString() == 'true' ? true : false;
                        });
                      },
                    ),
                    title: Text(
                      "soll Männlich sein.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSizeOfText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Checkbox(
                      value: _checkBox2,
                      onChanged: (value) {
                        setState(() {
                          _checkBox2 =
                              value.toString() == 'true' ? true : false;
                        });
                      },
                    ),
                    title: Text(
                      "soll Weiblich sein.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSizeOfText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Checkbox(
                      value: _checkBox3,
                      onChanged: (value) {
                        setState(() {
                          _checkBox3 =
                              value.toString() == 'true' ? true : false;
                        });
                      },
                    ),
                    title: Column(children: [
                      Row(children: [
                        Text(
                          "Soll innerhalb von ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeOfText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 100.0,
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
                              } on Exception {

                              }
                            },
                          ),
                        ),
                      ]),
                      Row(children: [
                        Text(
                          "km Reichweite sein.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeOfText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ])
                    ]),
                  ),
                  ListTile(
                    leading: Checkbox(
                      value: _checkBox4,
                      onChanged: (value) {
                        setState(() {
                          _checkBox4 =
                              value.toString() == 'true' ? true : false;
                        });
                      },
                    ),
                    title: Row(children: [
                      Text(
                        "Soll ca.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSizeOfText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
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
                            } on Exception {

                            }
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            " Jahre alt sein.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSizeOfText,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ]),
                  ),
                ]),
              ),
            ),
            new Padding(padding: new EdgeInsets.all(4.0)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: ColorData.blueDark, shadowColor: Colors.white),
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
                            'Bitte wählen Sie eine Option aus dem oberen Feld und mindestens eine Option aus dem unteren Feld.'),
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
              child: Ink(
                  child: Container(
                height: 50,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [ColorData.blueLight, Colors.indigo[50]]),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Suchen',
                  style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      color: Colors.blueAccent),
                ),
              )),
            ),
          ],
        )),
      ),
    );
  }
}
