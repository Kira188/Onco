import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/bottom_navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class getstudentinfo extends StatelessWidget {
  const getstudentinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SCHOLAMETER",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MyBottomNav())),
            );
          },
        ),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Replace the URL with your Firebase console link
            _launchFirebaseConsoleLink(
                'https://console.firebase.google.com/u/3/project/scholameter/firestore/data/~2FstudentData~2FBYjnWPz68i3wxl0F02zs');
          },
          child: Text('Open Firebase Console'),
        ),
      ),
    );
  }
}

Future<void> _launchFirebaseConsoleLink(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
