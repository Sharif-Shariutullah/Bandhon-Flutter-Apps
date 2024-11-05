import 'package:flutter/material.dart';

class Communication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    '/communication'),
                _buildButton(context, Icons.my_library_books, 'গাইডলাইন', 1.0,
                    '/guideline'),
              ],
            ),
          ),
        ],
      ),
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
