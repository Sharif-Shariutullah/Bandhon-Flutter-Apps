import 'package:flutter/material.dart';

class Guideline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDE8E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFFDE8E5),

        title: Center(
          child: Text(
            'গাইডলাইন',
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
              size: 30.0,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.deepOrange,
              size: 30.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/guideline');
          },
          child: Text('Guideline'),
        ),
      ),
    );
  }
}
