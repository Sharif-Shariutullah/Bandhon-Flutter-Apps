import 'package:flutter/material.dart';
import 'package:bandhan/CustomDrawer.dart';
import 'package:bandhan/DrawerButton.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  // Method: Container navigate button
  Widget _buildButton(BuildContext context, IconData icon, String label,
      double opacity, String route) {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 250,
      width: 250,
      child: Opacity(
        opacity: opacity, // Control opacity here
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange[100],
            padding: EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 80.0, color: Colors.deepOrange), // Icon color
              SizedBox(height: 8.0),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ), // Text color
              ),
            ],
          ),
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
      backgroundColor: Color(0xFFFDE8E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFFDE8E5),
        // title: Text(
        //   'Home',
        //   style:
        //       TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        // ),
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.deepOrange,
              size: 40.0,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/notification');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.deepOrange,
              size: 40.0,
            ),
            onPressed: () {

            },
          ),
        ],
      ),

      body: Stack(
        children: [
          Opacity(
            opacity: 0.1,
            child: Center(
              child: Image.asset('assets/logo.jpg'),
            ),
          ),
          Center(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                _buildButton(context, Icons.donut_small,
                    'আউটলেট এবং কল কার্ড স্ট্যাটাস', 1.0, '/outletCall'),
                _buildButton(context, Icons.podcasts, 'কমিউনিকেশন প্যানেল', 1.0,
                    '/communication'),
                _buildButton(context, Icons.wallet_giftcard_rounded,
                    'রিওয়ার্ড নির্বাচন', 1.0, '/reward'),
                _buildButton(context, Icons.my_location,
                    'আউটলেট লোকেশন নির্দশনা', 1.0, '/outletLocation'),
                _buildButton(context, Icons.candlestick_chart, 'ইএএস এডভোকেসি',
                    1.0, '/easAdvocacy'),
              ],
            ),
          ),


          // Positioned Drawer Icon on the left side, middle height
          DrawerIcon(scaffoldKey: _scaffoldKey),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}





