import 'package:bandhan/communication.dart';
import 'package:bandhan/easAdvocacy.dart';
import 'package:bandhan/guideline.dart';
import 'package:bandhan/outletAndCallCard.dart';
import 'package:bandhan/outletLocation.dart';
import 'package:bandhan/reward.dart';
import 'package:bandhan/CustomDrawer.dart';
import 'package:bandhan/DrawerButton.dart';
import 'package:bandhan/communicationPanel.dart';
import 'package:bandhan/notificationPush.dart';
import 'package:bandhan/loginPage.dart';
import 'package:bandhan/settingsPage.dart';

import 'package:flutter/material.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),

      // home: LoginPage(),

      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/communication': (context) => Communication(),
        '/outletCall': (context) => OutletAndCallCard(),
        '/reward': (context) => Reward(),
        '/outletLocation': (context) => Outletlocation(),
        '/easAdvocacy': (context) => EASAdvocacy(),
        '/guideline': (context) => Guideline(),
        '/notification': (context) => notificationPush(),
        '/communicationPanel': (context) => Communicationpanel(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}

