import 'package:flutter/material.dart';
import 'package:bandhan/CustomDrawer.dart';
import 'package:bandhan/DrawerButton.dart';

class Cucompetition extends StatelessWidget {
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
            'কল আপডেট(Competition)',
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
                  child: Text(
                    'সেটিং',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Center(
                  child: Text(
                    'লগ আউট',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          StockInputPage(),
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

class StockInputPage extends StatelessWidget {
  final List<String> stockItems = [
    'Camel Blue Burst',
    'Camel Purple Burst',
    'Navy',
    'Camel Dark Blue',
    'Camel Lemon Burst',
    'Navy Option',
    'Sheikh',
    'Sheikh SM',
    'Real',
    'K2',
    'Star',
    'Gold Leaf',
    'Star',
    'Lucky Strike',
    'LD RED 20',
    'LD RED 10',
    'LD FRESH 20',
    'LD FRESH 10',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container with Border that contains the heading and input fields
            Container(
              padding: const EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                // color: Colors.deepOrange,
                border: Border.all(color: Colors.deepOrange, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'স্টক ইনপুট:\n(যদি কোনো ব্র্যান্ড স্টক পাওয়া যায় না বা বিক্রি না হয়, ইনপুট 0)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Center(),
                  SizedBox(height: 16),

                  // Input Fields
                  Column(
                    children: stockItems.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 4.0),
                        child: Row(
                          children: [
                            // Label
                            Expanded(
                              flex: 3,
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 4),
                            // Input Field
                            Expanded(
                              flex: 5,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrange, width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrange, width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'Enter 0 and 99999',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 8), // Adjust height
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Next Button outside the bordered container
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/CUreward');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange, // button color
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
