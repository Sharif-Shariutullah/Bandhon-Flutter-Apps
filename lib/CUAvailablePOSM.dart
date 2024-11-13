import 'package:flutter/material.dart';
import 'package:bandhan/CustomDrawer.dart';
import 'package:bandhan/DrawerButton.dart';

class Cuavailableposm extends StatelessWidget {
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
            'কল আপডেট(POSM)',
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

class StockInputPage extends StatefulWidget {
  @override
  _StockInputPageState createState() => _StockInputPageState();
}

class _StockInputPageState extends State<StockInputPage> {
  final List<String> stockItems = [
    'Inside Glass Pack Display Type 1',
    'Inside Glass Pack Display Type 2',
    'Outside Pack Display',
    'Dangler',
    'PVC Frame & Modular',
    'Iron Frame Modular',
    'New Iron Frame with Modular',
    'Kisok Display',
    'Vertical Pack Display',
    'Premimum Back Wall',
    'Acrylic Tabple Top',
  ];

  final List<String> RadiostockItems = [
    'KV',
    'PCM Rebranding',
    'Pack Planogram',
  ];

  final List<String> imagePaths = [
    'assets/profile.jpg', // Replace with actual image paths
    'assets/profile.jpg',
    'assets/profile.jpg'
  ];

  String selectedOption = ''; // To store the selected radio option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDE8E5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        // Outer padding around main container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              // padding: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrange, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Available POSM',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'সমস্ত ইনপুর পূরণ করার পরে অনুগ্রহ করে \'ছবি ক্যাপচার করুন\' বোতাম টিপুন এবং চিহ্নিত ক্ষেত্রে একটি ফটো ক্যাপচার করুন। ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  Column(
                    children: stockItems.map((item) {
                      int index = stockItems.indexOf(item);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                // Item Title
                                Expanded(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          child: Image.asset(
                                            'assets/profile.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundImage:
                                        AssetImage('assets/profile.jpg'),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            // Input Field
                            TextField(
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
                                hintText: 'Enter 0-10',
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Do you agree?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Image action
                          },
                          child: CircleAvatar(
                            radius: 16,
                            backgroundImage: AssetImage('assets/profile.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...RadiostockItems.map((item) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text('Yes'),
                                value: 'Yes',
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value!;
                                  });
                                },
                                activeColor: Colors.deepOrange,
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text('No'),
                                value: 'No',
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value!;
                                  });
                                },
                                activeColor: Colors.deepOrange,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/CUpcm');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
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

   // void setState(Null Function() param0) {}
 }

// class StockInputPage extends StatelessWidget {
//   final List<String> stockItems = [
//     'Inside Glass Pack Display Type 1',
//     'Inside Glass Pack Display Type 2',
//     'Outside Pack Display',
//     'Dangler',
//     'PVC Frame & Modular',
//     'Iron Frame Modular',
//     'New Iron Frame with Modular',
//     'Kisok Display',
//     'Vertical Pack Display',
//     'Premimum Back Wall',
//     'Acrylic Tabple Top',
//   ];
//
//   final List<String> RadiostockItems = [
//     'KV',
//     'PCM Rebranding',
//     'Pack Planogram',
//   ];
//
//   final List<String> imagePaths = [
//     'assets/profile.jpg',
//      ];
//
//   String selectedOption = ''; // To store the selected radio option
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFDE8E5),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(12.0),
//         // Outer padding around main container
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // -------------------- Main Content Container -------------------- //
//             Container(
//               // padding: const EdgeInsets.all(16.0),
//               padding: const EdgeInsets.only(bottom: 8),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.deepOrange, width: 2),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // ------------------------- Title ------------------------- //
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.deepOrange,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'Available POSM',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: 8),
//
//                   // ------------------------- Subtitle ------------------------- //
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(
//                       'সমস্ত ইনপুর পূরণ করার পরে অনুগ্রহ করে \'ছবি ক্যাপচার করুন\' বোতাম টিপুন এবং চিহ্নিত ক্ষেত্রে একটি ফটো ক্যাপচার করুন। ',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepOrange,
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: 14),
//
//                   // ------------------------- Input Fields with Images ------------------------- //
//                   Column(
//                     children: stockItems.map((item) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 5.0, horizontal: 4.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 // Item Title
//                                 Expanded(
//                                   child: Text(
//                                     item,
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                                 // Image Preview Button
//                                 GestureDetector(
//                                   onTap: () {
//                                     // Show larger image in a dialog
//                                     showDialog(
//                                       context: context,
//                                       builder: (BuildContext context) {
//                                         return Dialog(
//                                           child: Image.asset(
//                                             'assets/profile.jpg',
//                                             fit: BoxFit.cover,
//                                           ),
//                                         );
//                                       },
//                                     );
//                                   },
//                                   child: CircleAvatar(
//                                     radius: 16,
//                                     backgroundImage:
//                                         AssetImage('assets/profile.jpg'),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 4),
//                             // Input Field
//                             TextField(
//                               keyboardType: TextInputType.number,
//                               decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: Colors.deepOrange, width: 2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: Colors.deepOrange, width: 2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 hintText: 'Enter 0-10',
//                                 contentPadding: EdgeInsets.symmetric(
//                                   vertical: 10.0,
//                                   horizontal: 8,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                   ),
//
//                   SizedBox(height: 16),
//
// //  padding, text, gesture image,
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Do you agree?',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.deepOrange,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             // Image action
//                           },
//                           child: CircleAvatar(
//                             radius: 16,
//                             backgroundImage: AssetImage(
//                                 'assets/profile.jpg'), // Replace with your image
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
// // Dynamic Radio Button based on stockItems
//                   ...RadiostockItems.map((item) {
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           item,
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: RadioListTile<String>(
//                                 title: Text('Yes'),
//                                 value: 'Yes',
//                                 groupValue: selectedOption,
//                                 onChanged: (value) {
//                                   // setState(() {
//                                   //   selectedOption = value!;
//                                   // });
//                                 },
//                                 activeColor: Colors.deepOrange,
//                               ),
//                             ),
//                             Expanded(
//                               child: RadioListTile<String>(
//                                 title: Text('No'),
//                                 value: 'No',
//                                 groupValue: selectedOption,
//                                 onChanged: (value) {
//                                   // setState(() {
//                                   //   selectedOption = value!;
//                                   // });
//                                 },
//                                 activeColor: Colors.deepOrange,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     );
//                   }).toList(),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 16),
//
//             // -------------------- Next Button -------------------- //
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/CUpcm');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepOrange,
//                 ),
//                 child: Text(
//                   'Next',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
