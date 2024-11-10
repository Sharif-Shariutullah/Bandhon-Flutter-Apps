import 'package:flutter/material.dart';
import 'package:bandhan/CustomDrawer.dart';
import 'package:bandhan/DrawerButton.dart';

class SettingsPage extends StatelessWidget {
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
            'সেটিংস',
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
          SettingsBody(),
          DrawerIcon(scaffoldKey: _scaffoldKey),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}

// class LogoutPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Logout'),
//       ),
//       body: Center(
//         child: Text('Logout Page'),
//       ),
//     );
//   }
// }

class SettingsBody extends StatefulWidget {
  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  bool isPasswordFormVisible = false;
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Language Selection Section
          Card(
            color: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ভাষা নির্বাচন',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // Centers the row content
                    children: [
                      Radio(
                        value: 'English',
                        groupValue: selectedLanguage,
                        onChanged: (value) {
                          setState(() {
                            selectedLanguage = value!;
                          });
                        },
                        fillColor: MaterialStateProperty.all(Colors.white),
                        // activeColor: Colors.white, // Sets the radio selection color to white
                      ),
                      Text(
                        'English',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      // Adds spacing between the radio buttons
                      Radio(
                        value: 'Bangla',
                        groupValue: selectedLanguage,
                        onChanged: (value) {
                          setState(() {
                            selectedLanguage = value!;
                          });
                        },
                        // activeColor: Colors.white, // Sets the radio selection color to white
                        fillColor: MaterialStateProperty.all(Colors.white),
                      ),
                      Text(
                        'বাংলা',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          // Card(
          //   color: Colors.deepOrange,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Column(
          //     children: [
          //       ListTile(
          //         title: Text(
          //           'পাসওয়ার্ড পরিবর্তন করুন',
          //           style: TextStyle(color: Colors.white, fontSize: 16),
          //         ),
          //         trailing: IconButton(
          //           icon: Icon(
          //             isPasswordFormVisible ? Icons.do_not_disturb_on : Icons.add_circle,
          //             color: Colors.white,
          //             size: 25,
          //           ),
          //           onPressed: () {
          //             setState(() {
          //               isPasswordFormVisible = !isPasswordFormVisible;
          //             });
          //           },
          //         ),
          //       ),
          //       if (isPasswordFormVisible)
          //         Padding(
          //           padding: EdgeInsets.all(16.0),
          //           child: Column(
          //             children: [
          //
          //              Text(
          //
          //                 'পুরানো পাসওয়ার্ড ',
          //                 style: TextStyle(color: Colors.white, fontSize: 16),
          //               ),
          //               TextField(
          //
          //                 decoration: InputDecoration(
          //
          //                   filled: true,
          //                   fillColor: Colors.white,
          //                   hintText: 'Old Password',
          //                   border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(10),
          //
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(height: 10),
          //
          //               Text(
          //
          //                 'পুরানো পাসওয়ার্ড ',
          //                 style: TextStyle(color: Colors.white, fontSize: 16),
          //               ),
          //               TextField(
          //                 decoration: InputDecoration(
          //                   filled: true,
          //                   fillColor: Colors.white,
          //                   hintText: 'New Password',
          //                   border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(10),
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(height: 10),
          //
          //               Text(
          //
          //                 'পুরানো পাসওয়ার্ড ',
          //                 style: TextStyle(color: Colors.white, fontSize: 16),
          //               ),
          //               TextField(
          //                 decoration: InputDecoration(
          //                   filled: true,
          //                   fillColor: Colors.white,
          //                   hintText: 'Confirm Password',
          //                   border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(10),
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(height: 20),
          //
          //               // Change Password Button
          //               ElevatedButton(
          //                 style: ElevatedButton.styleFrom(
          //                   // primary: Colors.deepOrange,
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(10),
          //                   ),
          //                 ),
          //                 onPressed: () {
          //                   // Handle password change
          //                 },
          //                 child: Text('পাসওয়ার্ড পরিবর্তন করুন', style: TextStyle(color: Colors.deepOrange)),
          //               ),
          //             ],
          //           ),
          //         ),
          //     ],
          //   ),
          // ),

          Card(
            color: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'পাসওয়ার্ড পরিবর্তন করুন',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      isPasswordFormVisible
                          ? Icons.do_not_disturb_on
                          : Icons.add_circle,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordFormVisible = !isPasswordFormVisible;
                      });
                    },
                  ),
                ),
                if (isPasswordFormVisible)
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'পুরানো পাসওয়ার্ড',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Old Password',
                            hintStyle: TextStyle(color: Colors.black54),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              // White border when not focused
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              // White border when focused
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'নতুন পাসওয়ার্ড',
                            // Changed to 'New Password' in Bengali
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'New Password',
                            hintStyle: TextStyle(color: Colors.black54),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'পাসওয়ার্ড নিশ্চিত করুন',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(color: Colors.black54),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Change Password Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            // Handle password change
                          },
                          child: Text('পাসওয়ার্ড পরিবর্তন করুন',
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 20,
                              )),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
