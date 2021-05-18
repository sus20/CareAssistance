import 'package:flutter/material.dart';
import 'package:refresh/controller/RefinePersonData.dart';
import 'package:refresh/models/ColorData.dart';
import 'package:refresh/models/PersonData.dart';

class PartnerDetails extends StatefulWidget {
  final List<dynamic> radioAndCheckBoxData;
  PartnerDetails({this.radioAndCheckBoxData});

  @override
  _PartnerDetailsState createState() =>
      _PartnerDetailsState(radioAndCheckBoxData);
}

class _PartnerDetailsState extends State<PartnerDetails> {
  int _radioValue = -1;
  bool _checkBox1 = false;
  bool _checkBox2 = false;
  bool _checkBox3 = false;
  bool _checkBox4 = false;
  int km = -1;
  int age = -1;

  static List<Map<String, String>> matchPartnerList = [];

  void findPartner() {
    matchPartnerList.clear();
    for (int i = 0; i < PersonData.personList.length; i++) {
      if (RefinePersonData.refineDataBasedOnOptions(
          i, _checkBox1, _checkBox2, _checkBox3, _checkBox4, km, age)) {
        matchPartnerList.add(PersonData.personList.elementAt(i));
      }
    }
  }

  _PartnerDetailsState(radioAndCheckBoxData) {
    _radioValue = radioAndCheckBoxData[0];
    _checkBox1 = radioAndCheckBoxData[1];
    _checkBox2 = radioAndCheckBoxData[2];
    _checkBox3 = radioAndCheckBoxData[3];
    _checkBox4 = radioAndCheckBoxData[4];

    km = radioAndCheckBoxData[5];
    age = radioAndCheckBoxData[6];

    findPartner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.blueDark,
      appBar: AppBar(
        title: Text(
          "Gesprächpartner Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorData.blueLight,
      ),
      body: Container(
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(4.0)),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/profilePic/" +
                          matchPartnerList[index]['image']),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Name:  ' + matchPartnerList[index]['name'],

                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          _radioValue == 0
                              ? Text(
                                  'Email:  ' + matchPartnerList[index]['email'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  "Email:  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                          _radioValue == 1
                              ? Text(
                                  'Tel.Num.:  ' +
                                      matchPartnerList[index]['tel'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  "Tel:  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                          _radioValue == 3
                              ? Text(
                                  'Adresse:  ' +
                                      matchPartnerList[index]['address'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  "Adresse:  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                          _radioValue == 2
                              ? Text(
                                  'Andere Kontaktmöglichkeit:  ' +
                                      matchPartnerList[index]['otherContact'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  "Andere Kontaktmöglichketi:  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                          Text(
                            'Geschlecht:  ' + matchPartnerList[index]['gender'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),

                          ),
                          Text(
                            'Innerhalb von:  ' +
                                matchPartnerList[index]
                                    ['distanceFromCityCenter'] +
                                ' KM.',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Alter:  ' + matchPartnerList[index]['age'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            separatorBuilder: (context, index) => Divider(color: Colors.black),
            itemCount: matchPartnerList.length),
      ),
    );
  }
}
