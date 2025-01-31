//import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/bottom_navbar.dart';
import 'package:flutter_complete_guide/screens/diet_detail.dart';
import 'package:flutter_complete_guide/screens/home_screen.dart';
import 'package:flutter_complete_guide/screens/otp_screen.dart';
import 'package:flutter_complete_guide/screens/phone_number_page.dart';
import 'package:flutter_complete_guide/utils/local_notifications.dart';
import '/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );
  
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  //runApp(MaterialApp(home: PhoneNumberPage(),));
  runApp(MyApp());
/*class FirebaseApp extends StatelessWidget {
  //const FirebaseApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCHOLAMETER',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
class InitializerWidget extends StatefulWidget {
  const InitializerWidget({Key? key}) : super(key: key);
  @override
  State<InitializerWidget> createState() => _InitializerWidgetState();
}
class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  //User? _user;
  dynamic _phoneNumber;
  bool isLoading = true;
  @override
  void initState() {
    //LocalNotifications.init();
    //FirebaseAuth auth = FirebaseAuth.instance;
    /*mAuth.FirebaseAuthSettings.setAppVerificationDisabledForTesting(true);*/
    //FirebaseAuthSettings authSettings = auth.app.settings;
    _auth = FirebaseAuth.instance;
    //_user = _auth.currentUser;
    _phoneNumber = FirebaseAuth.instance.currentUser?.phoneNumber;
    isLoading = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // _setAppVerificationDisabledForTesting();
    return isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _phoneNumber == null
            ? const otpScreen()
            : MyBottomNav();
  }
  /*void _setAppVerificationDisabledForTesting() {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseAuthSettings authSettings = auth.app.settings;
    authSettings.appVerificationDisabledForTesting = true;
    //FirebaseAuth.instance.appVerificationDisabledForTesting = true;
  }*/
}