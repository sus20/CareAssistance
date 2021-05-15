import 'package:flutter/material.dart';
import 'package:refresh/models/ColorData.dart';

const IconData meditation = Icons.self_improvement;
const IconData conversation = Icons.people;
const IconData move = Icons.accessibility_new;
const IconData sun = Icons.wb_sunny;

class HomeScreen extends StatefulWidget {
  HomeScreen({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.more_vert), onPressed: null),
          actions: [
            IconButton(icon: Icon(Icons.bar_chart), onPressed: null),
          ],
          title: Text(widget.title),
        ),
        backgroundColor: ColorData.blueLight,
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(sun, size: 40),
                    label: Text(
                      "Hey, schön dass du da bist.\nDu bist Level 30",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(primary: ColorData.blueLight),
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
