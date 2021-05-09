import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Care Assistance'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        automaticallyImplyLeading: false,
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[

        // TODO change to the your file name is navigator
        Container(
          width: 20,
          height: 20,
          alignment: Alignment.topCenter,
          child:ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/startScreen');
          }, child: Text("Sushma"),
          )
        ),

        // TODO change to the your file name is navigator
        Container(
            width: 20,
            height: 20,
            alignment: Alignment.topLeft,
            child:ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/startScreen');
            }, child: Text("jakob"),
            )
        ),

        // TODO change to the your file name is navigator
        Container(
            width: 20,
            height: 20,
            alignment: Alignment.topRight,
            child:ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/startScreen');
            }, child: Text("andri"),
            )
        ),

        // TODO change to the your file name is navigator
        Container(
            width: 20,
            height: 20,
            alignment: Alignment.centerLeft,
            child:ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/startScreen');
            }, child: Text("merlin"),
            )
        ),
      ]),
    );
  }
}
