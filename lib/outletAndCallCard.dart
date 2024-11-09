import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bandhan/CustomDrawer.dart';
import 'package:bandhan/DrawerButton.dart';

class OutletAndCallCard extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFFFDE8E5),
          title: Expanded(
            child: Text(
              'আউটলেট পারফরমেন্স & কল কার্ড',
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          iconTheme: IconThemeData(
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
        // body: UIExample(),

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedOutlet = 'Select outlet';
  List<String> outletOptions = ['Outlet 1', 'Outlet 2', 'Outlet 3', 'Outlet 4'];
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  bool isTextVisible = false; // Step 1: Add this variable

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
      key: _scaffoldKey,
      backgroundColor: Color(0xFFFDE8E5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),

            // --------------------this is professional to me

            // Text(
            //   'আউটলেট কোড',
            //   style: TextStyle(
            //     color: Colors.black87,
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(height: 10),
            // DropdownButtonFormField<String>(
            //   value: selectedOutlet,
            //   onChanged: (newValue) {
            //     setState(() {
            //       selectedOutlet = newValue!;
            //     });
            //   },
            //   items: [
            //     DropdownMenuItem(
            //         value: "Select outlet", child: Text("Select outlet")),
            //     DropdownMenuItem(value: "Option 1", child: Text("Option 1")),
            //     DropdownMenuItem(value: "Option 2", child: Text("Option 2")),
            //     DropdownMenuItem(value: "Option 3", child: Text("Option 3")),
            //   ],
            //   decoration: InputDecoration(
            //     filled: true,
            //     fillColor: Colors.white,
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(8),
            //       borderSide:
            //       BorderSide(color: Colors.deepOrange, width: 2),
            //     ),
            //
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(8),
            //       borderSide: BorderSide(color: Colors.deepOrange, width: 2), // Sets the color when focused
            //     ),
            //
            //     errorBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(8),
            //       borderSide: BorderSide(color: Colors.red, width: 2), // Sets the color for error state
            //     ),
            //     contentPadding: EdgeInsets.symmetric(
            //         horizontal: 12, vertical: 10),
            //     hintText: formatDate(endDate),
            //   ),
            // ),
            // SizedBox(height: 60),

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

            Text(
              'এই আউটলেট এর পারফরমেন্স দেখতে শুরু ও শেষ এর তারিখ নির্বাচন করুন',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'শুরু তারিখ',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        readOnly: true,
                        onTap: () => _selectDate(context, true),
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
                            borderSide: BorderSide(
                                color: Colors.deepOrange,
                                width: 2), // Sets the color when focused
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 2), // Sets the color for error state
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          hintText: formatDate(startDate),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'শেষ তারিখ',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        readOnly: true,
                        onTap: () => _selectDate(context, false),
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
                            borderSide: BorderSide(
                                color: Colors.deepOrange,
                                width: 2), // Sets the color when focused
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 2), // Sets the color for error state
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          hintText: formatDate(endDate),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.deepOrange), // Set border color
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius
                      .zero, // Set border radius to zero for square edges
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'পারফরমেন্স ড্যাশবোর্ড',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),

            OutlinedButton(
              onPressed: () {
                setState(() {
                  isTextVisible = !isTextVisible;
                });
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.deepOrange), // Set border color
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius
                      .zero, // Set border radius to zero for square edges
                ),
              ),
              child: Column(
                // Wrap everything in a Column
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'আইএমএস ব্র্যান্ড স্প্লিট',
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        isTextVisible
                            ? Icons
                                .remove_circle_sharp // Minus icon when expanded
                            : Icons.add_circle_sharp,
                        // Plus icon when collapsed
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                  if (isTextVisible) // Conditionally display the toggle text
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'অনুগ্রহকে করে প্রথমে একটি তারিখ/আউটলেট নির্বাচন করুন',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
            ),

            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // Aligns the button to the right
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Slight rounding
                    ),
                    // padding: EdgeInsets.symmetric(vertical: 14), // Adjust padding if needed
                  ),
                  child: Text(
                    'কল কার্ড',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            // DrawerIcon(scaffoldKey: _scaffoldKey),
          ],
        ),
      ),
    );
  }
}
