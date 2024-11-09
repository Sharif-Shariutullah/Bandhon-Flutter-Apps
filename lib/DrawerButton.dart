
import 'package:flutter/material.dart';

class DrawerIcon extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerIcon({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0, // Adjust this value to set horizontal position
      top: MediaQuery.of(context).size.height * 0.5 - 25, // Center vertically, adjust offset if needed
      child: GestureDetector(
        onTap: () {
          scaffoldKey.currentState?.openDrawer(); // Use GlobalKey to open drawer
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.fromLTRB(10, 1, 1, 1),
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
