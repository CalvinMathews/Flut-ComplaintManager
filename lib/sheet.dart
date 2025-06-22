import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Viewsheets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sheets Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GoogleSheetsViewer(),
    );
  }
}

class GoogleSheetsViewer extends StatefulWidget {
  @override
  _GoogleSheetsViewerState createState() => _GoogleSheetsViewerState();
}

class _GoogleSheetsViewerState extends State<GoogleSheetsViewer> {
  final String sheetUrl =
      'https://docs.google.com/spreadsheets/d/1TPKgEnGan3Z4ZGP52kBesYm3hrjLA9if-4EVmASf1v8/';
  late String editUrl;
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    editUrl = sheetUrl + 'edit';
  }

  void onPageStarted(String url) {
    // Handle page started event
  }

  void onPageFinished(String url) {
    // Handle page finished event
  }

  void launchGoogleSheetsApp() {
    // Implement the logic to launch the Google Sheets app
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sheets Viewer'),
        backgroundColor: Color.fromARGB(255, 8, 173, 44),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              initialUrl: editUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: onPageStarted,
              onPageFinished: onPageFinished,
              navigationDelegate: (NavigationRequest request) {
                if (request.url.startsWith(sheetUrl)) {
                  // Allow navigation within the Google Sheets domain
                  return NavigationDecision.navigate;
                } else {
                  // Block navigation to external websites
                  return NavigationDecision.prevent;
                }
              },
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            color: Color.fromARGB(255, 217, 6, 6),
            alignment: Alignment.center,
            child: TextButton(
              onPressed: launchGoogleSheetsApp,
              child: Text(
                'Note : Open Google Sheets App for Edit Privelages !',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
