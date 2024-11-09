import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bandhan/CustomDrawer.dart';
import 'package:bandhan/DrawerButton.dart';


class EASAdvocacy extends StatelessWidget {
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
            'ইএএস এডভোকেসি',
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
        body: Stack(
          children: [
            UIExample(),
            DrawerIcon(scaffoldKey: _scaffoldKey),
          ],
        ),
        drawer: CustomDrawer());
  }
}

class UIExample extends StatefulWidget {
  @override
  _UIExampleState createState() => _UIExampleState();
}

class _UIExampleState extends State<UIExample> {
  String selectedOutlet = 'Select outlet';
  List<String> outletOptions = ['Outlet 1', 'Outlet 2', 'Outlet 3', 'Outlet 4'];

  String selectedBrand = 'Select Brand';
  List<String> brandOptions = ['Outlet 1', 'Outlet 2', 'Outlet 3', 'Outlet 4'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDE8E5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 4, // 4 parts for the text (35-40%)
                  child: Text(
                    'আউটলেট কোড',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 8), // Space between text and dropdown
                Expanded(
                  flex: 6, // 6 parts for the dropdown (60-65%)
                  child: DropdownButtonFormField<String>(
                    value: selectedOutlet,
                    onChanged: (newValue) {
                      setState(() {
                        selectedOutlet = newValue!;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                          value: "Select outlet", child: Text("Select outlet")),
                      DropdownMenuItem(
                          value: "Option 1", child: Text("Option 1")),
                      DropdownMenuItem(
                          value: "Option 2", child: Text("Option 2")),
                      DropdownMenuItem(
                          value: "Option 3", child: Text("Option 3")),
                    ],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                        BorderSide(color: Colors.deepOrange, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                        BorderSide(color: Colors.deepOrange, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            Row(
              children: [
                Expanded(
                  flex: 6, // 4 parts for the text (35-40%)
                  child: Text(
                    'যে ব্র্যান্ডের EAS কে কন্টাক্ট করা হয়েছে ',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 8), // Space between text and dropdown
                Expanded(
                  flex: 4, // 6 parts for the dropdown (60-65%)
                  child: DropdownButtonFormField<String>(
                    value: selectedBrand,
                    onChanged: (newValue) {
                      setState(() {
                        selectedBrand = newValue!;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                          value: "Select Brand", child: Text("Select Brand")),
                      DropdownMenuItem(
                          value: "Option 1", child: Text("Option 1")),
                      DropdownMenuItem(
                          value: "Option 2", child: Text("Option 2")),
                      DropdownMenuItem(
                          value: "Option 3", child: Text("Option 3")),
                    ],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                        BorderSide(color: Colors.deepOrange, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                        BorderSide(color: Colors.deepOrange, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),


            Text(
              'কনসিউমার নম্বর',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter consumer numbers',
                labelStyle: TextStyle(color: Colors.black54),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.deepOrange, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.deepOrange, width: 2),
                  // Orange border when focused
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.phone,
            ),

            SizedBox(height: 10),
            Text(
              'অনুগ্রহ করে আরও কনসিউমার নম্বর যোগ করতে কীবোর্ডে ✔ প্রেস করুন',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 16,

              ),
            ),


            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // Aligns the button to the right
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20,), // Adjust the vertical padding for height

                  ),
                  child: Text(
                    'জমা দিন',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
