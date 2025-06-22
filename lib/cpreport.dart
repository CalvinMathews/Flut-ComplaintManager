
import 'package:flutter/material.dart';
import 'package:pwrgrd/admin.dart';

class CompletedStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        'assets/tick.png', // Replace with your tick mark image path
        height: 200,
        width: null,
      ),
      SizedBox(height: 20),
      Text(
        'Ticket Raised',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 210),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'NOTE: ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 0, 0)),
              ),
              Text(
                'Complaint has been raised to IT Dept. for queries contact help desk',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.center,
              ),
            ],
          )),
      SizedBox(height: 60),
      Padding(
          padding: EdgeInsets.all(15),
          child: SizedBox(
              height: 70,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminScreen(),
                    ),
                  );
                },
                child: Text(
                  'Finish',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    backgroundColor: Color.fromARGB(255, 33, 148, 75),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              )))
    ])));
  }
}
