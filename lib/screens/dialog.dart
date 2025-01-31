import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/bottom_navbar.dart';

class PostFrameCallbackSample extends StatefulWidget {
  const PostFrameCallbackSample({Key? key}) : super(key: key);

  @override
  State<PostFrameCallbackSample> createState() =>
      _PostFrameCallbackSampleState();
}

class _PostFrameCallbackSampleState extends State<PostFrameCallbackSample> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          //contentPadding: EdgeInsets.all(15.0),
          contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          //titlePadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          content: const Text('Hello User,\n\nWelcome to ONCO DIET APP!!\n',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: AutofillHints.birthdayDay,
                  fontSize: 20)),
          actions: [
            TextButton(
              onPressed: () => //Navigator.pop(context),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyBottomNav())),
              child: const Text('Proceed'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: const Text('Post Frame Callback sample'),
      //),
      //body: const Center(
      //  child: Text('Body of the Scaffold'),
      //),
      backgroundColor: Color.fromARGB(255, 33, 243, 240),
    );
  }
}
