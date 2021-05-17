import 'package:flutter/material.dart';
import 'package:refresh/models/AppDrawer.dart';
import 'package:refresh/models/colorData.dart';
import 'package:refresh/screens/ExerciseOverview.dart';

const IconData meditation = Icons.self_improvement;
const IconData conversation = Icons.people;
const IconData move = Icons.accessibility_new;
const IconData sun = Icons.wb_sunny;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final globalScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              globalScaffoldKey.currentState.openDrawer();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.bar_chart),
              onPressed: () {
                Navigator.of(context).pushNamed('/statisticScreen');
              },
            ),
          ],
          title: Text(widget.title),
        ),
        key: globalScaffoldKey,
        drawer: AppDrawer.menu(context),
        backgroundColor: ColorData.blueDark,
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  child: SizedBox(
                    child: TextButton.icon(
                      icon: Icon(
                        sun,
                        size: 40,
                        color: ColorData.yellow,
                      ),
                      label: Text(
                        "Hey, schön dass du da bist.\nDu bist Level 30",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(primary: ColorData.blueDark),
                    ),
                  ),
                ),
                Divider(height: 20, color: ColorData.yellow),
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    "Worauf hast du Lust?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(meditation, size: 40),
                    label: Text(
                      "Den Kopf frei bekommen  ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ExerciseOverview(mode: "meditation"),
                        ),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(primary: ColorData.blueLight),
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(move, size: 40),
                    label: Text(
                      "Ein bisschen bewegen     ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseOverview(mode: "sport"),
                        ),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(primary: ColorData.blueLight),
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(conversation, size: 40),
                    label: Text(
                      "Mit jemandem reden    ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/conversationPartner');
                    },
                    style:
                        ElevatedButton.styleFrom(primary: ColorData.blueLight),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
