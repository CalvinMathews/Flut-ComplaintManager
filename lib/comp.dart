import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pwrgrd/preview.dart';

class Complaint extends StatefulWidget {
  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController email = TextEditingController();
  TextEditingController Name_Empno = TextEditingController();
  TextEditingController Designation_Department = TextEditingController();
  TextEditingController complaint = TextEditingController();
  TextEditingController other = TextEditingController();
  String? dropdownvalue;
  List<String> location = <String>[
    "RHQ-Bangalore",
    "Other",
  ];
  String? SpecificLocation;

  String? Timevalue = DateFormat('hh:mm:ss a').format(DateTime.now());

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      fieldHintText: "date",
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  bool _validateForm() {
    if (email.text.isEmpty || !EmailValidator.validate(email.text.toString())) {
      // Email validation
      return false;
    }

    if (Name_Empno.text.isEmpty) {
      // Name_Empno validation
      return false;
    }

    if (Designation_Department.text.isEmpty) {
      // Designation_Department validation
      return false;
    }

    if (complaint.text.isEmpty) {
      // Complaint validation
      return false;
    }

    if (dropdownvalue == null) {
      // Dropdown validation
      return false;
    }

    if (dropdownvalue == 'Other' && SpecificLocation!.isEmpty) {
      // Specific Location validation when dropdown value is 'Other'
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.notes),
          onPressed: (() {}),
          color: Colors.black,
          iconSize: 35,
        ),
        centerTitle: true,
        elevation: 0,
        title: Image.asset('assets/logo.png', height: 66),
        actions: [
          IconButton(
            icon: Icon(Icons.notification_add_rounded),
            onPressed: (() {}),
            color: Colors.black,
            iconSize: 35,
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 125.h,
            width: 345.w,
            margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 42, 76, 143),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 33, 148, 75).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Row(children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Name",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 110.w,
                  ),
                  Image(
                    image: AssetImage("assets/profile.png"),
                  )
                ]),
                SizedBox(height: 12.h),
                Text(
                  "Please raise a complaint by filling the form below",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(19.w),
            child: Container(
              height: 50.h,
              width: 350.w,
              padding: EdgeInsets.only(left: 5, right: 16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Color.fromARGB(80, 42, 76, 143),
                  borderRadius: BorderRadius.circular(10.r)),
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    fontSize: 19.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(19.w),
            child: Container(
              height: 50.h,
              width: 350.w,
              padding: EdgeInsets.only(left: 5, right: 16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Color.fromARGB(80, 42, 76, 143),
                  borderRadius: BorderRadius.circular(10.r)),
              child: TextFormField(
                controller: Name_Empno,
                keyboardType: TextInputType.name,
                style: TextStyle(
                    fontSize: 19.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText: "Name_Empno",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(19.w),
            child: Container(
              height: 50.h,
              width: 350.w,
              padding: EdgeInsets.only(left: 5, right: 16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Color.fromARGB(80, 42, 76, 143),
                  borderRadius: BorderRadius.circular(10.r)),
              child: TextFormField(
                controller: Designation_Department,
                keyboardType: TextInputType.name,
                style: TextStyle(
                    fontSize: 19.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText: "Designation_Department",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(19.w),
            child: Container(
              height: 50.h,
              width: 350.w,
              padding: EdgeInsets.only(left: 16, right: 16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color.fromARGB(80, 42, 76, 143),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: DropdownButton<String>(
                hint: Text("Location"),
                dropdownColor: Colors.white,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue;
                    if (newValue == "Other") {
                      SpecificLocation = "";
                    } else {
                      SpecificLocation = null;
                    }
                  });
                },
                value: dropdownvalue,
                items: location
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          if (dropdownvalue == "Other") ...[
            Padding(
              padding: EdgeInsets.all(19.w),
              child: Container(
                height: 50.h,
                width: 350.w,
                padding: EdgeInsets.only(left: 5, right: 16),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color.fromARGB(84, 227, 35, 35),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextFormField(
                  controller: other,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 19.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: "Specify Other location",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: 15,
                      bottom: 11,
                      top: 11,
                      right: 15,
                    ),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      SpecificLocation = value;
                    });
                  },
                ),
              ),
            ),
          ],
          Padding(
              padding: EdgeInsets.all(19.w),
              child: Container(
                  height: 50.h,
                  width: 350.w,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(80, 42, 76, 143),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('yyyy-MM-dd').format(selectedDate),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        iconSize: 25,
                        onPressed: () => _selectDate(context),
                      ),
                    ],
                  ))),
          Padding(
            padding: EdgeInsets.all(19.w),
            child: Container(
              height: 50.h,
              width: 350.w,
              padding: EdgeInsets.only(left: 16, right: 16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Color.fromARGB(80, 42, 76, 143),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Text(
                DateFormat('hh:mm:ss a').format(DateTime.now()),
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(19.w),
            child: TextField(
              controller: complaint,
              keyboardType: TextInputType.multiline,
              maxLines: null, // Allow multiple lines of input
              style: TextStyle(
                fontSize: 19.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: "Enter Complaint",
                filled: true,
                fillColor: Color.fromARGB(80, 42, 76, 143),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 53.h,
                  width: 250.w,
                  child: ElevatedButton(
                    onPressed: (() {
                      if (_validateForm()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PreviewPage(
                              Email: email.text.toString(),
                              Name_Empno: Name_Empno.text.toString(),
                              Desig_Dept:
                                  Designation_Department.text.toString(),
                              location: dropdownvalue,
                              SpecificLocation: SpecificLocation,
                              date: selectedDate,
                              time: Timevalue,
                              complaint: complaint.text.toString(),
                            ),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Form Validation Error'),
                            content: Text(
                                'Please fill in all the mandatory fields correctly.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    }),
                    child: Text(
                      "Raise Complaint",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 8.0,
                        backgroundColor: Color.fromARGB(255, 33, 148, 75),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      )),
    );
  }
}
