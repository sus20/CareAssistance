import 'package:flutter/material.dart';
import 'package:refresh/models/colorData.dart';

class HelloScreen extends StatelessWidget {
  HelloScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.blueLight,
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 170,
              height: 170,
              child: CircleAvatar(
                //Our logo (refresh_logo.png) was created with the free logo creator from hatchful:
                //https://hatchful.shopify.com/de/ .
                backgroundImage: AssetImage("assets/logo_refresh2.jpg"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 40),
              child: Text(
                "Schön, dass du hier bist.",
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Divider(
                color: ColorData.yellowDark,
                thickness: 0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 15),
              child: Text(
                "Wir helfen dir, eine wohlverdiente Pause aus dem Alltag zu nehmen und dabei auf dich selbst zu achten.",
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 25),
              child: Text(
                "Wähle aus einer Vielzahl an Aktivitäten die gerade passende für dich aus. Lass dir bei der Auswahl ruhig Zeit.",
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 25),
              child: Text(
                "Bevor wir losstarten, würden wir dir gerne noch ein paar Fragen stellen...",
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 25),
              child: ElevatedButton(
                child: Text(
                  "Auf gehts!",
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/installationScreen");
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorData.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
