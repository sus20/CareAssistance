import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is the splash screen'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
            width: 20,
            height: 20,
            alignment: Alignment.topCenter,
            child:Text("Welcome to splash screen",
              style: TextStyle(fontSize: 70)),
            ),
      ]),
    );
  }
}
