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
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO change to the your file name is navigator

                Navigator.pushNamed(context, '/startScreen');
              },
              child: Text(
                "Andrii",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {

                // TODO change to the your file name is navigator
                Navigator.pushNamed(context, '/startScreen');
              },
              child: Text(
                "Jakob",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {

                // TODO change to the your file name is navigator
                Navigator.pushNamed(context, '/startScreen');
              },
              child: Text(
                "Merlin",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO change to the your file name is navigator
                Navigator.pushNamed(context, '/startScreen');
              },
              child: Text(
                "Sushma",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
