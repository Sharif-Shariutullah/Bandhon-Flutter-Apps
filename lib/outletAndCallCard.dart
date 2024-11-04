import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OutletAndCallCard extends StatelessWidget {
  // String selectedOutlet = "Select outlet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: UIExample(),
    );
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
              'আউটলেট কোড',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedOutlet,
              onChanged: (newValue) {
                setState(() {
                  selectedOutlet = newValue!;
                });
              },
              items: [
                DropdownMenuItem(
                    value: "Select outlet", child: Text("Select outlet")),
                DropdownMenuItem(value: "Option 1", child: Text("Option 1")),
                DropdownMenuItem(value: "Option 2", child: Text("Option 2")),
                DropdownMenuItem(value: "Option 3", child: Text("Option 3")),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Outlet Code',
              ),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.deepOrange, width: 2),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.deepOrange, width: 2),
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
                side: BorderSide(color: Colors.deepOrange),
                // Set the border color here
                padding: EdgeInsets.symmetric(
                    horizontal: 16), // Adjust padding if needed
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
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.deepOrange),
                // Set the border color here
                padding: EdgeInsets.symmetric(
                    horizontal: 16), // Adjust padding if needed
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'আইএমএস ব্র্যান্ড স্প্লিট',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.add_circle_sharp,
                    color: Colors.deepOrange,
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
                    // padding: EdgeInsets.symmetric(vertical: 14),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open menu
        },
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.menu),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
