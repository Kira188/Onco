import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/screens/diet_detail.dart';
import 'package:flutter_complete_guide/screens/settings_screen.dart';
import 'package:flutter_complete_guide/screens/yoga_screen.dart';
import 'package:flutter_complete_guide/utils/local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'pdf_viewer_screen.dart';
import 'bmi.dart';

//import 'side_nav.dart';
import 'gridinfo.dart';

//import 'signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //User? user = FirebaseAuth.instance.currentUser;
  //serModel loggedInUser = UserModel();

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset("assets/logo.png", fit: BoxFit.contain),
              ),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed out");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    });
                    //logout(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SignInScreen()));
  }
}*/

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: SideNavBar(),
      appBar: AppBar(

          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   color: Colors.white,
          //   iconSize: 30,
          //   onPressed: () {
          //     if (scaffoldKey.currentState!.isDrawerOpen) {
          //       scaffoldKey.currentState!.closeDrawer();
          //       //close drawer, if drawer is open
          //     } else {
          //       scaffoldKey.currentState!.openDrawer();
          //       //open drawer, if drawer is closed
          //     }
          //   },
          // ),
          centerTitle: true,
          title: Text(
            "ONCO DIET APP",
            textAlign: TextAlign.center,
            style: TextStyle(
                //color: Color.fromARGB(255, 7, 20, 91),
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),

          //backgroundColor: Color.fromARGB(255, 229, 76, 4),
          backgroundColor: Color.fromARGB(255, 33, 243, 240),
          bottom: PreferredSize(
            child: Container(
              color: Colors.white,
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(20.0),
          )),

      //backgroundColor: Color.fromARGB(248, 8, 38, 34),
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 80),
            //const EdgeInsets.all(3.0),
            child: GridView(
              shrinkWrap: true, // Added this line
              physics: NeverScrollableScrollPhysics(),
              children: [
                /*InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentInfoForm()));
                  },
                  child: Container(
                    margin: new EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 2,
                            offset: Offset(0, 5),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*Tab(
                        icon: new Image.asset(
                          'assets/images/subj.png',
                          //height: 400,
                          //width: 400,
                          scale: 4,
                        ),
                      ),*/

                        //Admission Process
                        Container(
                          height: 85,
                          width: 85,
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            'assets/information.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Enter Student Information",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),*/
                //EXAM

                /*InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => getstudentinfo()));
                  },
                  child: Container(
                    margin: new EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: Offset(0, 5),
                          )
                        ]),*/

                InkWell(
                  onTap: () async {
                    // final file = await loadPdfFromAssets('');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            // PdfViewerScreen(pdfPath: file.path),
                            DietDetail(),
                      ),
                    );
                  },
                  child: Container(
                    margin: new EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: Offset(0, 5),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*Icon(
                          Icons.book,
                          size: 50,
                          color: Colors.white,
                        ),
                        Tab(
                          icon: new Image.asset(
                            'assets/diet.png',
                            height: 250,
                            width: 250,
                          ),
                        ),*/
                        Container(
                          height: 85,
                          width: 85,
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            'assets/diet.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Day wise dietary details",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),

                /*InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeacherInfoForm()));
                  },
                  child: Container(
                    margin: new EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: Offset(0, 5),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*Icon(
                        Icons.grade,
                        size: 50,
                        color: Colors.white,
                      ),
                      Tab(
                        icon: new Image.asset(
                          'assets/images/grade.png',
                          height: 250,
                          width: 250,
                        ),
                      ),*/
                        Container(
                          height: 85,
                          width: 85,
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            'assets/teacher.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Enter Teacher Information",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),*/
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bmi()));
                  },
                  child: Container(
                    margin: new EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: Offset(0, 5),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*Icon(
                        Icons.money,
                        size: 50,
                        color: Colors.white,
                      ),
                      Tab(
                        icon: new Image.asset(
                          'assets/images/fees.png',
                          height: 250,
                          width: 250,
                        ),
                      ),*/
                        Container(
                          height: 85,
                          width: 85,
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            'assets/bmi.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "BMI Calculator",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                /* InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => info()));
                  },*/
                /*Container(
                  margin: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*Icon(
                        Icons.grade,
                        size: 50,
                        color: Colors.white,
                      ),
                      Tab(
                        icon: new Image.asset(
                          'assets/images/result.png',
                          height: 250,
                          width: 250,
                        ),
                      ),*/
                      Container(
                        height: 85,
                        width: 85,
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/serial-number.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Add Student Attendance",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                //),*/
                /*InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => info()));
                  },*/
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => YogaScreen()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: new EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: Offset(0, 5),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*Icon(
                          Icons.help,
                          size: 50,
                          color: Colors.white,
                        ),
                        Tab(
                          icon: new Image.asset(
                            'assets/images/query.png',
                            height: 250,
                            width: 250,
                          ),
                        ),*/
                        Container(
                          height: 85,
                          width: 85,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            'assets/yoga.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Exercise and Yoga",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                //),
                /*InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => info()));
                  },
                  child: Container(
                    margin: new EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: Offset(0, 5),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*Icon(
                        Icons.grade,
                        size: 50,
                        color: Colors.white,
                      ),
                      Tab(
                        icon: new Image.asset(
                          'assets/images/result.png',
                          height: 250,
                          width: 250,
                        ),
                      ),*/
                        Container(
                          height: 85,
                          width: 85,
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            'assets/exam.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Enter Exam Grade",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => info()));
                  },
                  child: Container(
                    margin: new EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: Offset(0, 5),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*Icon(
                        Icons.grade,
                        size: 50,
                        color: Colors.white,
                      ),
                      Tab(
                        icon: new Image.asset(
                          'assets/images/result.png',
                          height: 250,
                          width: 250,
                        ),
                      ),*/
                        Container(
                          height: 85,
                          width: 85,
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            'assets/score.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Exam Grade List",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),*/
                // InkWell(
                //   // onTap: () {
                //   //   Navigator.push(context,
                //   //       MaterialPageRoute(builder: (context) => SettingsScreen()));
                //   // },
                //   child: Container(
                //     margin: new EdgeInsets.all(15),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(20),
                //         color: Colors.white,
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.8),
                //             spreadRadius: 5,
                //             blurRadius: 3,
                //             offset: Offset(0, 5),
                //           )
                //         ]),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         /*Icon(
                //         Icons.money,
                //         size: 50,
                //         color: Colors.white,
                //       ),
                //       Tab(
                //         icon: new Image.asset(
                //           'assets/images/fees.png',
                //           height: 250,
                //           width: 250,
                //         ),
                //       ),*/
                //         Container(
                //           height: 85,
                //           width: 85,
                //           padding: const EdgeInsets.all(3.0),
                //           child: Icon(Icons.settings_applications,
                //           size: 80,),
                //         ),
                //         const SizedBox(
                //           height: 5,
                //         ),
                //         Text(
                //           "Settings",
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 12,
                //               fontWeight: FontWeight.bold),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                //childAspectRatio: .60,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<File> loadPdfFromAssets(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final file = File('${(await getTemporaryDirectory()).path}/sample.pdf');
    await file.writeAsBytes(byteData.buffer.asUint8List());
    return file;
  }
}

/*import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ONCO DIET APP",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Color.fromARGB(255, 33, 243, 240),
        bottom: PreferredSize(
          child: Container(
            color: Colors.white,
            height: 4.0,
          ),
          preferredSize: Size.fromHeight(20.0),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 80),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                buildGridItem(context, 'assets/list.png',
                    'Student Information List', getstudentinfo),
                buildGridItem(context, 'assets/business.png',
                    'Teacher Information List', getstudentinfo),
                buildGridItem(context, 'assets/tasks.png',
                    'Student Attendance List', getstudentinfo),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGridItem(BuildContext context, String imagePath, String title,
      Widget Function() navigationTarget) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigationTarget()),
        );
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                spreadRadius: 5,
                blurRadius: 3,
                offset: Offset(0, 5),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 85,
              width: 85,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget getstudentinfo() {
    // Placeholder function for navigation target
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Info"),
      ),
      body: Center(
        child: Text("Student Info Screen"),
      ),
    );
  }
}*/


