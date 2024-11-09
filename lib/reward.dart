import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bandhan/CustomDrawer.dart';
import 'package:bandhan/DrawerButton.dart';



class Reward extends StatelessWidget {

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
            'রিওয়ার্ড নির্বাচন',
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
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  // Function to format dates
  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart ? startDate : endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStart ? startDate : endDate)) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDE8E5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Text(
              'আউটলেট কোড নির্বাচন করুন',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
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
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
