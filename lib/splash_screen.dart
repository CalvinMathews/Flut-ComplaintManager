import 'package:flutter/material.dart';
import 'package:pwrgrd/login.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
    return Scaffold(
      body: Stack(
        children: [
          // Background shapes and circles
          Positioned.fill(
            child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          // Top right semi-sphere
          Positioned(
            top: -11,
            right: 0,
            child: Image.asset(
              'assets/semiblue.png',
              width: 110,
              height: 110, // Adjust the height as needed
            ),
          ),
          // Bottom left semi-sphere
          Positioned(
            bottom: -18,
            left: 0,
            child: Image.asset(
              'assets/semi.png', // Replace with your image path
              width: 120, // Adjust the width as needed
              height: 120, // Adjust the height as needed
            ),
          ),
          // Top right small sphere
          Positioned(
            top: 60, // Adjust the positioning as needed
            right: 110, // Adjust the positioning as needed
            child: Image.asset(
              'assets/Ellipse 5.png', // Replace with your image path
              width: 50, // Adjust the width as needed
              height: 50, // Adjust the height as needed
            ),
          ),
          // Top right small sphere
          Positioned(
            top: 125, // Adjust the positioning as needed
            right: 80, // Adjust the positioning as needed
            child: Image.asset(
              'assets/Ellipse 6.png', // Replace with your image path
              width: 50, // Adjust the width as needed
              height: 50, // Adjust the height as needed
            ),
          ),
          // Bottom left small sphere
          Positioned(
            bottom: 70, // Adjust the positioning as needed
            left: 110, // Adjust the positioning as needed
            child: Image.asset(
              'assets/Ellipse 2.png', // Replace with your image path
              width: 50, // Adjust the width as needed
              height: 50, // Adjust the height as needed
            ),
          ),
          // Bottom left small sphere
          Positioned(
            bottom: 42, // Adjust the positioning as needed
            left: 140, // Adjust the positioning as needed
            child: Image.asset(
              'assets/Ellipse 3.png', // Replace with your image path
              width: 50, // Adjust the width as needed
              height: 50, // Adjust the height as needed
            ),
          ),
          // Middle images
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png', // Replace with your image path
                  width: 250, // Adjust the width as needed
                  height: 250, // Adjust the height as needed
                ),
                Image.asset(
                  'assets/banner.png', // Replace with your image path
                  width: 300, // Adjust the width as needed
                  height: 290, // Adjust the height as needed
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
