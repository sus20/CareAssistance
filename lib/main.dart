import 'package:flutter/material.dart';
import 'package:refresh/screens/ConversationPartner.dart';
import 'package:refresh/screens/ExerciseView.dart';
import 'package:refresh/screens/HelloScreen.dart';
import 'package:refresh/screens/HomeScreen.dart';
import 'package:refresh/screens/WhatsUpScreen.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/HomeScreen': (context) => HomeScreen(
              key: UniqueKey(),
              title: '',
            ),
        '/HelloScreen': (context) => HelloScreen(key: UniqueKey()),
        '/WhatsUpScreen': (context) => WhatsUpScreen(),
        '/ConversationPartner': (context) => ConversationPartner(),
        '/': (context) => ExerciseView(key: UniqueKey()),
      },
    ));
