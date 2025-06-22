import 'package:flutter/material.dart';
import 'package:pwrgrd/admin.dart';

class ErrorStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: 40),
      Image.asset(
        'assets/red.png', // Replace with your tick mark image path
        height: 175,
        width: null,
      ),
      SizedBox(height: 20),
      Text(
        'ERROR',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 180),
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
                'PLEASE CHECK YOU INTERNET CONNECTION AND TRY AGAIN OR CONTACT IT DEPARTMENT FOR INSTRUCTIONS',
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
                  'HOMEPAGE',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    backgroundColor: Color.fromARGB(255, 231, 5, 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              )))
    ])));
  }
}
