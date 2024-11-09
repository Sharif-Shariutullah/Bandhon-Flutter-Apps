import 'package:flutter/material.dart';
import 'package:bandhan/CustomDrawer.dart';
import 'package:bandhan/DrawerButton.dart';


class notificationPush extends StatelessWidget {

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
            'পুশ নোটিফিকেশন',
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

          Center(child: Text('Guidline Page Content')),


          // Positioned Drawer Icon on the left side, middle height
          // Positioned(
          //   left: 0.0, // Adjust this value to set horizontal position
          //   top: MediaQuery.of(context).size.height * 0.5 - 25, // Center vertically, adjust offset if needed
          //   child: GestureDetector(
          //     onTap: () {
          //       _scaffoldKey.currentState?.openDrawer(); // Use GlobalKey to open drawer
          //     },
          //     child: Container(
          //       decoration: BoxDecoration(
          //         color: Colors.deepOrange,
          //         borderRadius: BorderRadius.only(
          //           topRight: Radius.circular(20),
          //           bottomRight: Radius.circular(20),),
          //       ),
          //       padding: EdgeInsets.fromLTRB(10, 1, 1, 1),
          //       child: Icon(
          //         Icons.arrow_forward_ios,
          //         color: Colors.white,
          //         size: 30,
          //       ),
          //     ),
          //   ),
          // ),

          DrawerIcon(scaffoldKey: _scaffoldKey),

        ],
      ),

      drawer: CustomDrawer(),
    );
  }
}
