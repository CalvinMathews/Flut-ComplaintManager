import 'package:flutter/material.dart';
import 'package:pwrgrd/comp.dart' as pwr;
import 'package:pwrgrd/sheet.dart';
import 'package:pwrgrd/status.dart';
import 'package:flutter/services.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool showUserInfo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        backgroundColor: Color.fromARGB(255, 42, 76, 143),
      ),
      body: Stack(
        children: [
          // Background shapes and circles
          Positioned.fill(
            child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          // Logo
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Image.asset(
                'assets/logo.png', // Replace with your image path
                width: 200, // Adjust the width as needed
                height: null, // Adjust the height as needed
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 80),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'C',
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(text: 'OMPLAINT '),
                    TextSpan(
                      text: 'M',
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(text: 'ANAGEMENT '),
                    TextSpan(
                      text: 'S',
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(text: 'YSTEM'),
                  ],
                ),
              ),
            ),
          ),
          // Bottom left semi-sphere
          Positioned(
            bottom: -14,
            left: 0,
            child: Image.asset(
              'assets/semi.png', // Replace with your image path
              width: 120, // Adjust the width as needed
              height: 120, // Adjust the height as needed
            ),
          ),
          Positioned(
            bottom: 90, // Adjust the positioning as needed
            left: 45, // Adjust the positioning as needed
            child: Image.asset(
              'assets/Ellipse 3.png', // Replace with your image path
              width: 50, // Adjust the width as needed
              height: 50, // Adjust the height as needed
            ),
          ),
          // Top right small sphere
          Positioned(
            top: 0, // Adjust the positioning as needed
            right: 5, // Adjust the positioning as needed
            child: Image.asset(
              'assets/Ellipse 5.png', // Replace with your image path
              width: 50, // Adjust the width as needed
              height: 50, // Adjust the height as needed
            ),
          ),
          Positioned(
            top: 130,
            left: 15,
            right: 15,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showUserInfo = !showUserInfo;
                });
              },
              child: Card(
                elevation: 4, // Adjust the elevation as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: showUserInfo
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Welcome back,Varun',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Name: Varun',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Profile - Admin",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Email: Varun@pwrgrd.com',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Phone: +9184856364473',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      : Center(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Image 6.png',
                                width: 150,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'WELLCOME BACK \nVarun',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 220,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildBox(
                        text: 'Raise a Complaint',
                        image: 'assets/Image 7.png',
                        color: Color.fromARGB(255, 42, 76, 143),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pwr.Complaint()),
                          );
                        },
                      ),
                      buildBox(
                        text: 'View Status',
                        image: 'assets/Image 8.png',
                        color: Color.fromARGB(255, 42, 76, 143),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Status()),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 372, // Increase the width as needed
                        child: buildBox(
                          text: 'View Spreadsheet',
                          image: 'assets/Image 9.png',
                          color: Color.fromARGB(255, 42, 76, 143),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GoogleSheetsViewer()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildBox({
  required String text,
  required String image,
  required Color color,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 175,
      height: 125,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            width: 64,
            height: 64,
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
