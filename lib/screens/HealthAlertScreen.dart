import 'package:flutter/material.dart';
import 'package:refresh/models/colorData.dart';
import 'package:url_launcher/url_launcher.dart';

class HealthAlertScreen extends StatelessWidget {
  HealthAlertScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Falls es mal nicht klappt.."),
      ),
      backgroundColor: ColorData.blueLight,
      body: Center(
        child: Column(
          children: [
            Container(
              width: 450,
              child: Image(
                //This is a license free image from Pexels.com. It is allowed to use this image for free.
                //Image from Tima Miroshnichenko from Pexels*/
                image: AssetImage("assets/therapy.jpg"),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Text(
                "Du hast angegeben, dass es dir schlecht geht.",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12, left: 20, right: 20),
              child: Text(
                "Bitte vergiss nicht: REfresh bietet keinen Ersatz für einen Arzt oder eine psychologische Behandlung.",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Text(
                "Solltest du an Depressionen oder Suizidgedanken leiden, wirst du bei einem Klick auf den unteren Button zu einer Hilfestelle weitergeleitet.",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 12, bottom: 0),
              child: ElevatedButton(
                child: Text(
                  "Hol dir Hilfe.",
                ),
                onPressed: () async => {
                  await launch(
                      "https://www.gesundheit.gv.at/service/beratungsstellen/psychische-krankheiten")
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorData.blue,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 0),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/homeScreen");
                  },
                  child: Text(
                    "Trotzdem fortfahren.",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
