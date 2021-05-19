import 'package:flutter/material.dart';
import 'package:refresh/models/ColorData.dart';
import 'package:url_launcher/url_launcher.dart';

/* Implementation Notes:
Drawer can be added with adding 'key: globalScaffoldKey, drawer: AppDrawer.menu(context)' to scaffold.
gobalScaffoldKey must be provided in outer class. To open the drawer use 'globalScaffoldKey.currentState.openDrawer()'

⚠ Flutter Hot-Reload Bug:
Sometimes, as the ultimate flutter may speak, using the drawer leads to multiple Widget errors relating to the global Key.
This problem can be resolved by restarting the app. This buggy behaviour cannot be reconstructed logically.  
*/

class AppDrawer {
  // The following links are placeholders where the producer would have to add some links that refer to (probably its own) webpages.
  static const String sampleURL_Ad = 'https://amazon.com';
  static const String sampleURL_Help = 'https://support.google.com/';
  static const String sampleURL_Bugreport =
      'https://flutter.dev/docs/resources/bug-reports';

  // To open a Link on ListTile-Click
  static void openLink(String url) async {
    await launch(url);
  }

  static Widget menu(BuildContext context) {
    return Drawer(
      child: Container(
        color: ColorData.blue,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ListTile(
                title: Text(
                  'REfresh',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.sentiment_satisfied_alt,
                color: Colors.white,
              ),
              title: Text(
                'Wie geht\'s',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(
                    context, '/whatsUpScreen'); // Open 'Wie geht's' Screen
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                'Einstellungen',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(
                    context, '/settingsScreen'); // Open 'Wie geht's' Screen
              }, // To be continued
            ),
            Divider(
              color: Colors.black,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text(
                'Hilfe',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => {openLink(sampleURL_Help)},
            ),
            ListTile(
              leading: Icon(Icons.lock, color: Colors.white),
              title: Text(
                'Datenschutz',
                style: TextStyle(color: Colors.white),
              ), // Privacy has its own small overview. it will be displayed via AlertDialog.
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Datenschutz',
                          style: TextStyle(color: Colors.white),
                        ),
                        content: SingleChildScrollView(
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  'Hier findest du eine Zusammenfassung unserer Datenschutzlinien.Die gesamte Richtlinie findest du auf refresh.org/privacy\n',
                                ),
                                Text(
                                  'Daten die wir erheben, damit REfresh extra gut ist',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  '\nDie meisten Daten, die REfresh sammelt bleiben bei dir am lokalen Gerät gespeichert und finden nie ihren Weg zu uns. REfresh ist darauf ausgelegt personenbezogene Daten nur offline bzw. lokal zu verarbeiten. Zum Beispiel in Form von Empfehlungen, Neuen Übungen oder Mehr.Lediglich für die optionale Gesprächspartnersuche müssen wir deinen Vornamen, eine Kontaktmöglichkeit nach Belieben und ggf. deinen Standort online speichern. Ansonsten könnten andere Gesprächspartner dich nicht finden, und das wollen wir ja nicht.\n',
                                ),
                                Text(
                                  'Titel, die mit Datenschutz gut klingen',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  '\nTja, so würde es hier weitergehen. Eine Kurzzusammenfassung der Datenschutzrichtlinie, die für Nutzer*innen übersichtlich und leicht verständlich ist...',
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Okay'),
                          ),
                        ],
                      );
                    });
              },
            ),
            ListTile(
              minVerticalPadding: 1,
              leading: Icon(Icons.bug_report, color: Colors.white),
              title: Text(
                'Ein Problem melden',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => {openLink(sampleURL_Bugreport)},
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                child: Image(
                  image: NetworkImage(
                    'https://univie.waldhoer.org/img/adtemplate.png', // Ads are feteched from online sources.
                  ),
                ),
                onTap: () => {openLink(sampleURL_Ad)},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
