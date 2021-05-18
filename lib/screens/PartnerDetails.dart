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
  int _radioValue1 = -1;
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
      if (RefinePersonData.refineDataBasedOnOptions(i, _checkBox1, _checkBox2, _checkBox3, _checkBox4, km, age)) {
        matchPartnerList.add(PersonData.personList.elementAt(i));
      }
    }
  }

  _PartnerDetailsState(radioAndCheckBoxData) {
    _radioValue1 = radioAndCheckBoxData[0];
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
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/profilePic/" +
                            matchPartnerList[index]['image']),
                      ),
                      Text( 'Name : ' +  matchPartnerList[index]['name']),
                      _radioValue1 == 0 ? Text('Email : ' + matchPartnerList[index]['email']) : Text("Email:"),
                      _radioValue1 == 1 ? Text('Tel. Num. : ' + matchPartnerList[index]['tel']) : Text("Tel: "),
                      _radioValue1 == 2 ? Text('Adresse : ' + matchPartnerList[index]['address']) : Text("Adresse:"),
                      _radioValue1 == 3 ? Text('Andere Kontaktmöglichkeit : \n' + matchPartnerList[index]['otherContact']): Text("Andere Kontaktmöglichketi: "),
                      Text('Geschlecht : ' + matchPartnerList[index]['gender']),
                      Text('Innerhalb von  : ' + matchPartnerList[index]['distanceFromCityCenter'] +' KM.'),
                      Text('Alter : ' + matchPartnerList[index]['age'],
                      style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => Divider(color: Colors.black),
            itemCount: matchPartnerList.length),
      ),
    );
  }
}
