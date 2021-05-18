
import 'package:flutter/material.dart';
import 'package:refresh/screens/ConversationPartner.dart';
import 'package:refresh/screens/ExerciseOverview.dart';
import 'package:refresh/screens/ExerciseView.dart';
import 'package:refresh/screens/HealthAlertScreen.dart';
import 'package:refresh/screens/HelloScreen.dart';
import 'package:refresh/screens/InstallationScreen.dart';
import 'package:refresh/screens/PartnerDetails.dart';
import 'package:refresh/screens/SettingsScreen.dart';
import 'package:refresh/screens/StatisticScreen.dart';
import 'package:refresh/screens/WhatsUpScreen.dart';
import 'models/colorData.dart';
import 'package:refresh/screens/HomeScreen.dart';

void main() {
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove Debug banner.
        theme: ThemeData(
          primaryColor: ColorData.blue,
          accentColor: ColorData.blueDark,
        ),
        initialRoute: "/",
        routes: {
         "/": (context) => HelloScreen(),
          "/installationScreen": (context) => InstallationScreen(),
          "/homeScreen": (context) => HomeScreen(title: "Startbildschirm"),
          "/healthAlertScreen": (context) => HealthAlertScreen(),
          "/whatsUpScreen": (context) => WhatsUpScreen(),
          "/conversationPartner": (context) => ConversationPartner(),
          "/statisticScreen": (context) => StatisticScreen(),
          "/settingsScreen": (context) => SettingsScreen(),
          "/exerciseScreen": (context) => ExerciseView(),
          "/exerciseOverview": (context) => ExerciseOverview(),
          "/partnerDetails": (context) => PartnerDetails(),
        });
  }
}
