import 'package:flutter/material.dart';
import 'package:bandhan/CustomDrawer.dart';
import 'package:bandhan/DrawerButton.dart';

class Callads extends StatelessWidget {
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
            'কল আপডেট',
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
                          style: TextStyle(color: Colors.white, fontSize: 18)),
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
                          style: TextStyle(color: Colors.white, fontSize: 18)),
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
          Padding(
            padding: const EdgeInsets.all(16.0),

            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.deepOrange, width: 3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top Text
                  Container(
                    color: Colors.deepOrange,
                    // padding: EdgeInsets.symmetric(vertical: 12),
                    padding: EdgeInsets.all(12),
                    child: Center(
                      child: Text(
                        'দেখুন',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Video Icon
                  Expanded(
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.withOpacity(0.3),
                          shape: BoxShape.rectangle,
                        ),
                        child: Icon(
                          Icons.play_circle_outline,
                          size: 80,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Bottom "Skip" Button
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/callUpdate');
                        },
                        child: Text(
                          "স্কিপ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          DrawerIcon(scaffoldKey: _scaffoldKey),
        ],
      ),
      drawer: CustomDrawer(),
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
