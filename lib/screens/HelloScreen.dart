import 'package:flutter/material.dart';
import 'package:refresh/models/colorData.dart';

class HelloScreen extends StatelessWidget {
  HelloScreen({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.more_vert), onPressed: null),
        actions: [
          IconButton(icon: Icon(Icons.bar_chart), onPressed: null),
        ],
        title: Text("hallo"),
      ),
      backgroundColor: ColorData.blueLight,
      body: Center(),
    );
  }
}
