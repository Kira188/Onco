import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/forms/coursedesign.dart';
import 'package:flutter_complete_guide/screens/gridinfo.dart';
import 'package:flutter_complete_guide/screens/logout.dart';
//import 'package:flutter_complete_guide/screens/logout.dart';
import 'home_screen.dart';

class MyBottomNav extends StatefulWidget {
  @override
  MyBottomNavState createState() {
    return new MyBottomNavState();
  }
}

class MyBottomNavState extends State<MyBottomNav> {
  int _currentIndex = 0;

  _onTapItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _myBottomNavBar() {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        //fixedColor: Colors.orange,
        onTap: _onTapItem,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 30,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.subject),
            label: 'Course Design',
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'Details',
            backgroundColor: Colors.black),*/
          BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Logout',
              backgroundColor: Colors.black),
          /*BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Calculator',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: 'Account',
              backgroundColor: Colors.orange),*/
        ],
        selectedLabelStyle: TextStyle(fontSize: 10),
        fixedColor: Color.fromARGB(255, 33, 243, 240));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavContents(
        index: _currentIndex,
      ),
      bottomNavigationBar: _myBottomNavBar(),
    );
  }
}

class BottomNavContents extends StatelessWidget {
  BottomNavContents({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: navBarContents(index, context),
      ),
    );
  }

  Widget navBarContents(int index, BuildContext context) {
    switch (index) {
      case 0:
        return HomeScreen();
      /*case 1:
        return RegistrationForm();
      case 2:
        return info();*/
      case 1:
        return logout();
      /*case 4:
        return info();
      case 5:
        return logout();*/
      default:
        return Container();
    }
  }
}
