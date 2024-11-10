import 'package:flutter/material.dart';
import 'package:bandhan/CustomDrawer.dart';
import 'package:bandhan/DrawerButton.dart';

class Communication extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKey,

      backgroundColor: Color(0xFFFDE8E5),

      appBar: AppBar(
        backgroundColor: Color(0xFFFDE8E5),

        title: Center(
          child: Text(
            'কমিউনিকেশন',
            style: TextStyle(
                color: Colors.deepOrange, fontWeight: FontWeight.bold),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.deepOrange,
        ),

        leading: Navigator.canPop(context)
            ? IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.deepOrange),
          onPressed: () {
            Navigator.pop(context);
          },
        )
            : null,



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
          PopupMenuButton<int>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.deepOrange,
              size: 40.0,
            ),
            padding: EdgeInsets.all(8.0),
            onSelected: (item) => onSelected(context, item),
            offset: Offset(0, 50),
            color: Colors.deepOrange,
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon(Icons.settings, color: Colors.white),
                      // SizedBox(width: 8),
                      Text('সেটিং',
                          style:
                          TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon(Icons.logout, color: Colors.white),
                      // SizedBox(width: 8),
                      Text('লগ আউট',
                          style:
                          TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ],
          )


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
                _buildButton(context, Icons.podcasts, 'কমিউনিকেশন', 1.0,
                    '/communicationPanel'),
                _buildButton(context, Icons.my_library_books, 'গাইডলাইন', 1.0,
                    '/guideline'),
              ],
            ),
          ),
          DrawerIcon(scaffoldKey: _scaffoldKey),
        ],

      ),
      drawer: CustomDrawer(),
    );
  }

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
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.pushNamed(context, '/settings');
      break;
    case 1:
      Navigator.pushNamed(context, '/login');

      break;
  }
}
