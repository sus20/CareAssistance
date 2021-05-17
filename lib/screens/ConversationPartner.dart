import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:refresh/models/ColorData.dart';

class ConversationPartner extends StatefulWidget {
  const ConversationPartner({Key key}) : super(key: key);

  @override
  _ConversationPartnerState createState() => _ConversationPartnerState();
}

class _ConversationPartnerState extends State<ConversationPartner> {

  int _radioValue1 = -1;
  bool _checkBox1 = false;
  bool _checkBox2 = false;
  bool _checkBox3 = false;
  bool _checkBox4 = false;
  int km = 0;
  int age = 0;

  void _handleRadioValueChange1(value) {
    int val = int.parse(value.toString());
    setState(() {
      _radioValue1 = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesprächspartner'),
        centerTitle: true,
        elevation: 11.0,
        backgroundColor: ColorData.blueLight,
      ),
      body: new SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          new Padding(padding: new EdgeInsets.all(8.0)),
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
              padding: EdgeInsets.all(10.0),
               color: ColorData.blueLight,
              child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Ich suche :',
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  focusColor: Colors.green,
                  leading: Radio(
                    value: 0,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChange1,
                  ),
                  title: Text(
                    "Nutzer mit Mail Adresse.",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 20.0,
                    ),
                  ),
                ),
                ListTile(
                  leading: Radio(
                    value: 1,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChange1,
                  ),
                  title: Text(
                    "Nutzer mit Tel. Nummer.",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.9), fontSize: 20.0),
                  ),
                ),
                ListTile(
                  leading: Radio(
                    value: 2,
                    groupValue: _radioValue1,
                    onChanged: (val) => _handleRadioValueChange1(val),
                  ),
                  title: Text(
                    "Andere Kontaktmöglichkeit.",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.9), fontSize: 20.0),
                  ),
                ),
                ListTile(
                  leading: Radio(
                    value: 3,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChange1,
                  ),
                  title: Text(
                    "Adresse (Brief).",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.9), fontSize: 20.0),
                  ),
                ),
              ]),
            ),
          ),
          new Padding(padding: new EdgeInsets.all(8.0)),
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
              padding: EdgeInsets.all(10.0),
              color: ColorData.blueLight,
              child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Die/Der Partner/in :',
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
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
                        color: Colors.black.withOpacity(0.9), fontSize: 20.0),
                  ),
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
                        color: Colors.black.withOpacity(0.9), fontSize: 20.0),
                  ),
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
                            color: Colors.black.withOpacity(0.9),
                            fontSize: 20.0),
                      ),
                      Container(
                        width: 100.0,
                        height: 30.0,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            km = int.parse(value.toString());
                          },
                        ),
                      ),
                    ]),
                    Row(children: [
                      Text(
                        "km Reichweite sein.",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.9),
                            fontSize: 20.0),
                      ),
                    ])
                  ]),
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
                      "Soll ca.",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.9), fontSize: 20.0),
                    ),
                    Container(
                      width: 100.0,
                      height: 30.0,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          age = int.parse(value.toString());
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          " Jahre alt sein.",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.9),
                              fontSize: 20.0),
                        ),
                      ],
                    )
                  ]),
                ),
              ]),
            ),
          ),
          new Padding(padding: new EdgeInsets.all(8.0)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white, shadowColor: Colors.white),
            onPressed: () {
              print('Hi there');
            },
            child: Ink(
                child: Container(
              height: 50,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [ColorData.blueDark, Colors.indigo[50]]),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                'Suchen',
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              ),
            )),
          ),
        ],
      )),
    );
  }
}
