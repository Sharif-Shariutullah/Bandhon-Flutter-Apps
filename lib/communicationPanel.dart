import 'package:flutter/material.dart';
import 'package:bandhan/CustomDrawer.dart';
import 'package:bandhan/DrawerButton.dart';

class Communicationpanel extends StatelessWidget {
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
            'কমিউনিকেশন প্যানেল',
            style: TextStyle(
                color: Colors.deepOrange, fontWeight: FontWeight.bold),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.deepOrange,
        ),
        // automaticallyImplyLeading: false,

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
          CommunicationPanel(),
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

class CommunicationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 20, // Adjust this count for more items
        itemBuilder: (context, index) {
          return CommunicationRow(
            index: index + 1,
            title: index % 2 == 0 ? "Cycle 2" : "Variant ${index % 3 + 1}",
            date: "Mon Nov 21 2022_${index + 1}:22:24 PM",
          );
        },
      ),
    );
  }
}

class CommunicationRow extends StatelessWidget {
  final int index;
  final String title;
  final String date;

  CommunicationRow(
      {required this.index, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      color: Color(0xFFFDE8E5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$index.",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            // Icon(Icons.play_circle_fill, color: Colors.deepOrange, size: 45),

            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrange, width: 1),
                borderRadius: BorderRadius.circular(6),
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Icon(Icons.play_circle_fill, color: Colors.deepOrange, size: 45),
              ),
            ),

            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              child: Text("Download", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}



