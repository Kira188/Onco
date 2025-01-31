import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_complete_guide/screens/otp_page.dart';
import 'package:flutter_complete_guide/screens/otp_screen.dart';
import '/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signin_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ONCO DIET APP",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 33, 243, 240),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ActionChip(
                  label: Text("Delete Account"),
                  onPressed: () async {
                      await user!.delete();
                      print("Account Deleted");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => otpScreen()));
                    
                    //logout(context);
                  }),
            ],
          ),
        ),
      ),
    );
  } 
}
