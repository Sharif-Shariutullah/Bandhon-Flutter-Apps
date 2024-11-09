import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60.0),
          bottomRight: Radius.circular(60.0),
        ),
      ),
      child: Container(
        color: Colors.deepOrange, // Background color of the drawer
        child: Column(
          children: [
            Container(
              height: 200,
              padding: EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.0, // Profile image size
                    backgroundImage: AssetImage(
                        'assets/profile.jpg'), // Replace with profile image path
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'No_Name',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  Text(
                    '01325051300',
                    style: TextStyle(color: Colors.white70, fontSize: 14.0),
                  ),
                  Text(
                    'noemail@jti.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14.0),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.white, thickness: 1.0),
            _buildDrawerItem('Region : Barisal'),
            _buildDrawerItem('Area : Jhalokathi'),
            _buildDrawerItem('Territory : Pirojpur'),
            _buildDrawerItem('Total Outlet : 100'),
            _buildDrawerItem('Enroll ID : eil-j-0003'),
          ],
        ),
      ),
    );
  }

  // Method: Drawer  Item

  Widget _buildDrawerItem(String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 15.0),
          // Adjust spacing as needed
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        Divider(color: Colors.white, thickness: 1.0), // White divider line
      ],
    );
  }
}
