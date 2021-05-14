import 'package:flutter/material.dart';
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
  static const String sampleURL_Bugreport = 'https://flutter.dev/docs/resources/bug-reports';

  // To open a Link on ListTile-Click
  static void openLink(String url) async {
    await launch(url);
  }

  static Widget menu(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            ListTile(
              title: Text('Refresh'),
            ),
            ListTile(
              leading: Icon(Icons.sentiment_satisfied_alt),
              title: Text('Wie geht\'s'),
              onTap: () {
                Navigator.pushNamed(context, '/whatsupscreen'); // Open 'Wie geht's' Screen
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Einstellungen'), // To be continued
            ),
            Divider(
              color: Colors.black,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Hilfe'),
              onTap: () => {openLink(sampleURL_Help)},
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Datenschutz'), // Privacy has its own small overview. it will be displayed via AlertDialog.
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Datenschutz'),
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
              leading: Icon(Icons.bug_report),
              title: Text('Ein Problem melden'),
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
