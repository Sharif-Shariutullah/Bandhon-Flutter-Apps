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
        '/home': (context) => HomePage(),
        '/communication': (context) => Communication(),
        '/outletCall': (context) => OutletAndCallCard(),
        '/reward': (context) => Reward(),
        '/outletLocation': (context) => Outletlocation(),
        '/easAdvocacy': (context) => EASAdvocacy(),
        '/guideline': (context) => Guideline(),
        '/notification': (context) => notificationPush(),
        '/communicationPanel': (context) => Communicationpanel(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedOption = "option1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Stack(
            children: [
              // Watermark Image
              Positioned.fill(
                child: Opacity(
                  opacity: 0.1, // Adjust opacity for watermark effect
                  child: Image.asset(
                    'assets/logo.jpg', // Replace with your watermark image
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
              ),

              // Main Content
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    'assets/logo.jpg', // replace with your logo asset
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(height: 20),

                  // Radio buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildRadioOption("বন্ধন", "option1"),
                      SizedBox(width: 20),
                      _buildRadioOption("জেনিথ", "option2"),
                      SizedBox(width: 20),
                      _buildRadioOption("শেখ", "option3"),
                    ],
                  ),
                  SizedBox(height: 30),

                  // Input fields
                  TextField(
                    decoration: InputDecoration(
                      // labelText: 'মোবাইল নাম্বার লিখুন',
                      // labelStyle: TextStyle(color: Colors.black54),
                      hintText: 'মোবাইল নাম্বার লিখুন',
                      hintStyle: TextStyle(color: Colors.black54),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrange, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrange, width: 2),
                        // Orange border when focused
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      // labelText: 'পাসওয়ার্ড',
                      // labelStyle: TextStyle(color: Colors.black54),
                      hintText: 'পাসওয়ার্ড',
                      hintStyle: TextStyle(color: Colors.black54),

                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrange, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrange, width: 2),
                        // Orange border when focused
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                    obscureText: true,
                  ),
                  SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity, // Full-width button
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15), // Adjust padding if needed
                      ),
                      child: Text(
                        'লগইন',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold, // Makes the text bold
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),



                  // Version text
                  SizedBox(height: 18),
                  Text(
                    'v2.9.13',
                    style: TextStyle(color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioOption(String text, String value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: selectedOption,
          onChanged: (newValue) {
            setState(() {
              selectedOption = newValue!;
            });
          },
          activeColor: Colors.deepOrange,
        ),
        Text(text, style: TextStyle(color: Colors.deepOrange)),
      ],
    );
  }
}
