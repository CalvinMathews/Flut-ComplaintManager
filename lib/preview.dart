import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pwrgrd/cpreport.dart';
import 'package:http/http.dart' as http;
import 'package:pwrgrd/error.dart';

class PreviewPage extends StatelessWidget {
  final String Email;
  final String Name_Empno;
  final String Desig_Dept;
  final String? location;
  final String? SpecificLocation;
  final DateTime date;
  final String? time;
  final String complaint;

  PreviewPage({
    required this.Email,
    required this.Name_Empno,
    required this.Desig_Dept,
    required this.location,
    this.SpecificLocation,
    required this.date,
    required this.time,
    required this.complaint,
  });

  Future<void> sendDataToGoogleSheets(BuildContext context) async {
    final scriptUrl = Uri.https(
      'script.google.com',
      '/macros/s/AKfycbwcZ6p3rCeVbtR1l9EazfURavVEtZPS4zpBgbn8PwEsFko-vVgaLC-Xln0txoPfoI21/exec',
      {
        'Date': DateFormat('dd-MM-yyyy').format(date),
        'Time': time,
        'Name_Empno': Name_Empno,
        'Desig_Dept': Desig_Dept,
        'Complaint': complaint,
        'Email': Email,
        'Location': location,
        'SpecificLocation': SpecificLocation ?? '',
        'Status': 'Incomplete',
      },
    ).toString();

    final snackBar = SnackBar(
      backgroundColor: Color.fromARGB(255, 42, 76, 143),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          SizedBox(width: 20.0),
          Text(
            'Raising Complaint. Please wait...',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    try {
      // Send a GET request to the Google Apps Script URL
      final response = await http.get(Uri.parse(scriptUrl));
      print('Response Status Code: ${response.statusCode}');

      // Print the response body
      print('Response Body: ${response.body}');

      // Checking request was successful
      if (response.statusCode == 200) {
        // Data successfully submitted
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CompletedStatusPage()),
        );
      } else {
        // Error while submitting data
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ErrorStatusPage()),
        );
      }
    } catch (error) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ErrorStatusPage()),
      );
      final snackBar = SnackBar(
        backgroundColor: Color.fromARGB(255, 157, 12, 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        content: Text(
          'Error submitting Complaint: $error',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 9, milliseconds: 500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
        backgroundColor: Color.fromARGB(255, 33, 148, 75),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              color: Colors.white,
              child: Center(
                child: Image.asset(
                  'assets/powergrid.png',
                  width: 300,
                  height: null,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 18),
              width: 385,
              height: 430,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 42, 76, 143),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 203, 16, 16).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  Center(
                    child: Text(
                      'Confirmation Page',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 96, 215, 5),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Email: $Email',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Name_Empno: $Name_Empno',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Desig_Dept: $Desig_Dept',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Location: $location',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (location == 'Other') ...[
                    SizedBox(height: 8),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Specific Location: $SpecificLocation',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  SizedBox(height: 8),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Date: ${DateFormat('dd-MM-yyyy').format(date)}',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Time: ${time.toString()}',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Complaint: $complaint',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            sendDataToGoogleSheets(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(240, 4, 165, 89)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 15, horizontal: 75),
            ),
          ),
          child: Text(
            'SUBMIT',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
