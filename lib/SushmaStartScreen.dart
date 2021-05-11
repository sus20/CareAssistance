import 'package:flutter/material.dart';

class SushmaStartScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<SushmaStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is the sushma splash screen'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
            width: 20,
            height: 20,
            alignment: Alignment.topCenter,
            child:Text("Welcome to sushma splash screen",
              style: TextStyle(fontSize: 70)),
            ),
      ]),
    );
  }
}
