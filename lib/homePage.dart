import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDE8E5),

      appBar: AppBar(
        backgroundColor: Color(0xFFFDE8E5),
        title: Text('Home',
          style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),

        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.deepOrange,
              size: 40.0,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.deepOrange,
              size: 40.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Message'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
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
        ],
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, IconData icon, String label, double opacity, String route) {
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
}
