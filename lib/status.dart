import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Complaint {
  final String date;
  final String nameEmpno;
  final String complaint;
  final String email;
  final String location;
  final String specificLocation;
  final String status;

  Complaint({
    required this.date,
    required this.nameEmpno,
    required this.complaint,
    required this.email,
    required this.location,
    required this.specificLocation,
    required this.status,
  });
}

class Status extends StatelessWidget {
  Future<List<Complaint>> fetchDataFromGoogleSheets() async {
    final url =
        'https://script.google.com/macros/s/AKfycbzDtidRw_x_9n4TLlGedfejuRjyQRDpooVDfrAim-x5mbiSAwi9B1kN5qxM7DZ_JMBM/exec';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> data = jsonData['data'];

      return data.map((item) {
        return Complaint(
          date: item['Date'],
          nameEmpno: item['Name_Empno'],
          complaint: item['Complaint'],
          email: item['Email'],
          location: item['Location'],
          specificLocation: item['SpecificLocation'],
          status: item['Status'],
        );
      }).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  TextStyle getStatusTextStyle(String status) {
    Color textColor;
    switch (status) {
      case 'Incomplete':
        textColor = Colors.red;
        break;
      case 'Completed':
        textColor = Colors.green;
        break;
      case 'Ongoing':
        textColor = Colors.orange;
        break;
      default:
        textColor = Colors.blue;
    }

    return TextStyle(
      color: textColor,
      fontWeight: FontWeight.bold,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Complaint Management',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Status Check'),
          backgroundColor: Color.fromARGB(255, 42, 76, 143),
        ),
        body: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Container(
                height: 120,
                child: Center(
                  child: Image.asset(
                    'assets/powergrid.png',
                    width: 300,
                    height: null,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: FutureBuilder<List<Complaint>>(
                    future: fetchDataFromGoogleSheets(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<Complaint> complaints = snapshot.data!;

                        return ListView.builder(
                          itemCount: complaints.length,
                          itemBuilder: (context, index) {
                            final complaint = complaints[index];

                            final statusTextStyle =
                                getStatusTextStyle(complaint.status);

                            return Card(
                              elevation: 2,
                              margin: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Color.fromARGB(255, 4, 23, 59),
                              child: ListTile(
                                title: Text(
                                  complaint.status,
                                  style: statusTextStyle,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height:
                                            8), // Add a SizedBox with desired height
                                    Text(
                                      'Date: ${DateFormat('yyyy-MM-dd').format(DateTime.parse(complaint.date))}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            4), // Add a SizedBox with desired height
                                    Text(
                                      'Name/Employee No: ${complaint.nameEmpno}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                        height:
                                            4), // Add a SizedBox with desired height
                                    Text(
                                      'Complaint: ${complaint.complaint}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                        height:
                                            4), // Add a SizedBox with desired height
                                    Text(
                                      'Email: ${complaint.email}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                        height:
                                            4), // Add a SizedBox with desired height
                                    Text(
                                      'Location: ${complaint.location}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                        height:
                                            4), // Add a SizedBox with desired height
                                    Text(
                                      'Specific Location: ${complaint.specificLocation}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                        height:
                                            8), // Add a SizedBox with desired height
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }

                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
