import 'package:flutter/material.dart';
import 'package:refresh/screens/ConversationPartner.dart';
import 'package:refresh/screens/HelloScreen.dart';
import 'package:refresh/screens/HomeScreen.dart';



void main()  => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    // '/': (context) => HomeScreen(key: UniqueKey(),title: '',),
    '/HelloScreen' : (context) => HelloScreen(key:  UniqueKey()),
    '/' : (context) => ConversationPartner(),
  },

));
