import 'package:flutter/material.dart';
import 'package:pwrgrd/comp.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool showUserInfo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
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
                'assets/logo.png',
                width: 200,
                height: null,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 80),
              child: Text(
                'COMPLAINT MANAGEMENT SYSTEM',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Bottom left semi-sphere
          Positioned(
            bottom: -14,
            left: 0,
            child: Image.asset(
              'assets/semi.png',
              width: 120,
              height: 120,
            ),
          ),
          Positioned(
            bottom: 90,
            left: 45,
            child: Image.asset(
              'assets/Ellipse 3.png',
              width: 50,
              height: 50,
            ),
          ),
          // Top right small sphere
          Positioned(
            top: 0,
            right: 5,
            child: Image.asset(
              'assets/Ellipse 5.png',
              width: 50,
              height: 50,
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
                                'Welcome back,Joel',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Name: Joel John',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Profile - Engineer",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Email: Joel2John@pwrgrd.com',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Phone: +918848364473',
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
                                'WELLCOME BACK \nJOEL',
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
            bottom: 200,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildBox(
                    text: 'Raise a Complaint',
                    image: 'assets/Image 7.png',
                    color: Color.fromARGB(255, 42, 76, 143),
                    onPressed: () {
                      // Navigate to the Edit Profile page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Complaint()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  buildBox(
                    text: 'View Status',
                    image: 'assets/Image 8.png',
                    color: Color.fromARGB(255, 42, 76, 143),
                    onPressed: () {
                      // Perform logout functionality here
                    },
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

Widget buildBox(
    {required String text,
    required String image,
    required Color color,
    required VoidCallback onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 373,
      height: 125,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
