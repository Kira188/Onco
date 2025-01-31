import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/main.dart';
import 'package:flutter_complete_guide/screens/dialog.dart';
import 'package:flutter_complete_guide/screens/otp_screen.dart';
//import '/screens/home_screen.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_complete_guide/screens/signin_screen.dart';
//import 'package:flutter_complete_guide/screens/otp_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/user_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final ageEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  final genderController = new TextEditingController();

  final FirebaseAuth_auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  // string for displaying the error Message
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    /*final secondNameField = TextFormField(
      autofocus: false,
      controller: _controller,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Phone number cannot be empty");
        }
        if (!RegExp("^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}")
            .hasMatch(value)) {
          return "Please enter valid phone number";
        }
        return null;
      },
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone_android),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "+91",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );*/

    // Age field
    final ageField = TextFormField(
      autofocus: false,
      controller: ageEditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Age cannot be empty");
        }
        if (!RegExp(r'^[0-9]{1,3}$').hasMatch(value) ||
            int.parse(value) > 120) {
          return "Please enter a valid age (0-120)";
        }
        return null;
      },
      onSaved: (value) {
        ageEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.calendar_today),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Age",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //email field
    // final emailField = TextFormField(
    //     autofocus: false,
    //     controller: emailEditingController,
    //     keyboardType: TextInputType.emailAddress,
    //     validator: (value) {
    //       if (value!.isEmpty) {
    //         return ("Please Enter Your Email");
    //       }
    //       // reg expression for email validation
    //       if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
    //           .hasMatch(value)) {
    //         return ("Please Enter a valid email");
    //       }
    //       return null;
    //     },
    //     onSaved: (value) {
    //       firstNameEditingController.text = value!;
    //     },
    //     textInputAction: TextInputAction.next,
    //     decoration: InputDecoration(
    //       prefixIcon: Icon(Icons.mail),
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "Email",
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ));
    final genderField = DropdownButtonFormField(
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      isExpanded: true, // Ensure the dropdown expands to full width
      hint: Text(
          "Gender",
          textAlign: TextAlign.start, // Center the hint text
        ),
      items: ['Male', 'Female', 'Other']
          .map((e) => DropdownMenuItem(
                value: e,
                child:  Text(
                    e,
                    textAlign:
                        TextAlign.start, // Center the dropdown items' text
                  ),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          genderController.text = value.toString(); // Update the selected value
        });
      },
    );

    //password field
    // final passwordField = TextFormField(
    //     autofocus: false,
    //     controller: passwordEditingController,
    //     obscureText: true,
    //     validator: (value) {
    //       RegExp regex = new RegExp(r'^.{6,}$');
    //       if (value!.isEmpty) {
    //         return ("Password is required for login");
    //       }
    //       if (!regex.hasMatch(value)) {
    //         return ("Enter Valid Password(Min. 6 Character)");
    //       }
    //     },
    //     onSaved: (value) {
    //       firstNameEditingController.text = value!;
    //     },
    //     textInputAction: TextInputAction.next,
    //     decoration: InputDecoration(
    //       prefixIcon: Icon(Icons.vpn_key),
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "Password (Min 7 characters)",
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ));
    // //confirm password field
    // final confirmPasswordField = TextFormField(
    //     autofocus: false,
    //     controller: confirmPasswordEditingController,
    //     obscureText: true,
    //     validator: (value) {
    //       if (confirmPasswordEditingController.text !=
    //           passwordEditingController.text) {
    //         return "Password don't match";
    //       }
    //       return null;
    //     },
    //     onSaved: (value) {
    //       confirmPasswordEditingController.text = value!;
    //     },
    //     textInputAction: TextInputAction.done,
    //     decoration: InputDecoration(
    //       prefixIcon: Icon(Icons.vpn_key),
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "Confirm Password",
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ));

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 33, 243, 240),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            debugPrint("Finished Button was Pressed");
            //OTPScreen(otpController.text);
            //signUp(emailEditingController.text, passwordEditingController.text);
            postDetailsToFirestore();
            Navigator.push(context,
            //MaterialPageRoute(builder: (context) => PostFrameCallbackSample()));
            MaterialPageRoute(builder: (context) => PostFrameCallbackSample()));
          },
          child: Text(
            "Finished",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 243, 240),
      /*appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        //elevation: 0,
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),*/
        leading: (SizedBox(
          height: 500,
          width: 500,
          child: Image.asset(
            'assets/jssstu.png',
            width: 100,
            height: 150,
            fit: BoxFit.fill,
            scale: 0.5,
          ),
        )),

        title: const Text(
          "Antibiotica",
          style: TextStyle(
              color: Color.fromARGB(255, 7, 20, 91),
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          SizedBox(
            height: 150,
            width: 150,
            child: IconButton(
              alignment: Alignment.topRight,
              icon: Image.asset('assets/logo.png'),
              iconSize: 100,
              onPressed: () => exit(0),
            ),
          ),
        ],
      ),*/
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            //color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /*SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        "assets/logo-no-background.png",
                        height: 150,
                        width: 50,
                        scale: 0.5,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      "Funded by ICMR",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),*/
                    SizedBox(height: 20),
                    firstNameField,
                    SizedBox(height: 20),
                    ageField,
                    // SizedBox(height: 20),
                    // emailField,
                    SizedBox(height: 20),
                    // passwordField,
                    // SizedBox(height: 20),
                    // confirmPasswordField,
                    // SizedBox(height: 20),
                    genderField,
                    SizedBox(height: 20),
                    signUpButton,
                    SizedBox(height: 15),
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       Text("Already have an account? "),
                    //       GestureDetector(
                    //         onTap: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => SignInScreen()));
                    //         },
                    //         child: Text(
                    //           "SignIn",
                    //           style: TextStyle(
                    //               color: Color.fromARGB(255, 33, 243, 240),
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 15),
                    //         ),
                    //       )
                    //     ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values
    FirebaseFirestore db = FirebaseFirestore.instance;
    User? user = FirebaseAuth_auth.currentUser;

    UserModel userModel = UserModel(
      ageField: ageEditingController.text,
    );

    // writing all the values
    userModel.phone = user!.phoneNumber;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    //userModel.secondName = secondNameEditingController.text;
    userModel.ageField = ageEditingController.text;
    userModel.genderField = genderController.text;
    // FirebaseAuth.instance
    //     .signInWithEmailAndPassword(
    //         email: emailEditingController.text,
    //         password: passwordEditingController.text)
    //     .then((value) {
    //   Navigator.push(
    //     (context),
    //     MaterialPageRoute(builder: (context) => otpScreen()),
    //   );
    // }).onError((error, stackTrace) {
    //   print("Error ${error.toString()}");
    // });
    await db
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }
}




  // void signup(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       await FirebaseAuth_auth.createUserWithEmailAndPassword(
  //               email: email, password: password)
  //           .then((value) => {postDetailsToFirestore()})
  //           .catchError((e) {
  //         Fluttertoast.showToast(msg: e!.message);
  //       });
  //     } on FirebaseAuthException catch (error) {
  //       switch (error.code) {
  //         case "invalid-email":
  //           errorMessage = "Your email address appears to be malformed.";
  //           break;
  //         case "wrong-password":
  //           errorMessage = "Your password is wrong.";
  //           break;
  //         case "user-not-found":
  //           errorMessage = "User with this email doesn't exist.";
  //           break;
  //         case "user-disabled":
  //           errorMessage = "User with this email has been disabled.";
  //           break;
  //         case "too-many-requests":
  //           errorMessage = "Too many requests";
  //           break;
  //         case "operation-not-allowed":
  //           errorMessage = "Signing in with Email and Password is not enabled.";
  //           break;
  //         default:
  //           errorMessage = "An undefined Error happened.";
  //       }
  //       Fluttertoast.showToast(msg: errorMessage!);
  //       print(error.code);
  //     }
  //   }
  // }





//New line 
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/screens/otp_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_complete_guide/screens/signin_screen.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../model/user_model.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   // editing Controller
//   final firstNameEditingController = new TextEditingController();
//   final secondNameEditingController = new TextEditingController();
//   final ageEditingController = new TextEditingController();
//   final genderController = new TextEditingController();
//   final phoneController = TextEditingController();

//   final FirebaseAuth_auth = FirebaseAuth.instance;

//   late String verificationId;

//   bool showLoading = false;

//   // string for displaying the error Message
//   String? errorMessage;
//   @override
//   void dispose() {
//     firstNameEditingController.dispose();
//     secondNameEditingController.dispose();
//     ageEditingController.dispose(); 
//     phoneController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final firstNameField = TextFormField(
//         autofocus: false,
//         controller: firstNameEditingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           RegExp regex = new RegExp(r'^.{3,}$');
//           if (value!.isEmpty) {
//             return ("First Name cannot be Empty");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Enter Valid name(Min. 3 Character)");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           firstNameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.account_circle),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Name",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ));


//     //second name field
//     /*final secondNameField = TextFormField(
//       autofocus: false,
//       controller: _controller,
//       keyboardType: TextInputType.number,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return ("Phone number cannot be empty");
//         }
//         if (!RegExp("^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}")
//             .hasMatch(value)) {
//           return "Please enter valid phone number";
//         }
//         return null;
//       },
//       onSaved: (value) {
//         secondNameEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.phone_android),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "+91",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );*/

//     // Age field
//     final ageField = TextFormField(
//       autofocus: false,
//       controller: ageEditingController,
//       keyboardType: TextInputType.number,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return ("Age cannot be empty");
//         }
//         if (!RegExp(r'^[0-9]{1,3}$').hasMatch(value) ||
//             int.parse(value) > 120) {
//           return "Please enter a valid age (0-120)";
//         }
//         return null;
//       },
//       onSaved: (value) {
//         ageEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.calendar_today),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Age",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//     //email field
//     final genderField = DropdownButtonFormField(
//       value: genderController.text,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.calendar_today),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Gender",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       items: ['Male', 'Female', 'Other']
//                 .map((e) => DropdownMenuItem(
//                       child: Text(e),
//                       value: e,
//                     ))
//                 .toList(),
//       autofocus: false,
//        onChanged: (value) {
//               setState(() {
//                 genderController.text = value.toString();  // Update the selected value
//               });
//        },
//     );
      

//     //signup button
//     final signUpButton = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(30),
//       color: Color.fromARGB(255, 33, 243, 240),
//       child: MaterialButton(
//           padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           minWidth: MediaQuery.of(context).size.width,
//           onPressed: () {
//             //OTPScreen(otpController.text);
            
//           },
//           child: Text(
//             "Next",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
//           )),
//     );
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 33, 243, 240),
//       /*appBar: AppBar(
//         backgroundColor: Colors.deepOrange,
//         //elevation: 0,
//         /*leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             // passing this to our root
//             Navigator.of(context).pop();
//           },
//         ),*/
//         leading: (SizedBox(
//           height: 500,
//           width: 500,
//           child: Image.asset(
//             'assets/jssstu.png',
//             width: 100,
//             height: 150,
//             fit: BoxFit.fill,
//             scale: 0.5,
//           ),
//         )),

//         title: const Text(
//           "Antibiotica",
//           style: TextStyle(
//               color: Color.fromARGB(255, 7, 20, 91),
//               fontWeight: FontWeight.bold,
//               fontSize: 30),
//         ),
//         centerTitle: true,
//         actions: [
//           SizedBox(
//             height: 150,
//             width: 150,
//             child: IconButton(
//               alignment: Alignment.topRight,
//               icon: Image.asset('assets/logo.png'),
//               iconSize: 100,
//               onPressed: () => exit(0),
//             ),
//           ),
//         ],
//       ),*/
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             //color: Colors.white,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30)),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(36.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     /*SizedBox(
//                       height: 150,
//                       width: 150,
//                       child: Image.asset(
//                         "assets/logo-no-background.png",
//                         height: 150,
//                         width: 50,
//                         scale: 0.5,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     Text(
//                       "Funded by ICMR",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),*/
//                     SizedBox(height: 20),
//                     firstNameField,
//                     SizedBox(height: 20),
//                     ageField,
//                     SizedBox(height: 20),
//                     genderField,
//                     SizedBox(height: 20),
//                     signUpButton,
//                     SizedBox(height: 15),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text("Already have an account? "),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => SignInScreen()));
//                             },
//                             child: Text(
//                               "SignIn",
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 33, 243, 240),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 15),
//                             ),
//                           )
//                         ])
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // login function
//   void signUp(String email, String password) async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         // await FirebaseAuth_auth.createUserWithEmailAndPassword(
//         //         email: email, password: password)
//         //     .then((value) => {postDetailsToFirestore()})
//         //     .catchError((e) {
//         //   Fluttertoast.showToast(msg: e!.message);
//         // });
//       } on FirebaseAuthException catch (error) {
//         switch (error.code) {
//           case "invalid-email":
//             errorMessage = "Your email address appears to be malformed.";
//             break;
//           case "wrong-password":
//             errorMessage = "Your password is wrong.";
//             break;
//           case "user-not-found":
//             errorMessage = "User with this email doesn't exist.";
//             break;
//           case "user-disabled":
//             errorMessage = "User with this email has been disabled.";
//             break;
//           case "too-many-requests":
//             errorMessage = "Too many requests";
//             break;
//           case "operation-not-allowed":
//             errorMessage = "Signing in with Email and Password is not enabled.";
//             break;
//           default:
//             errorMessage = "An undefined Error happened.";
//         }
//         Fluttertoast.showToast(msg: errorMessage!);
//         print(error.code);
//       }
//     }
//   }
  

//   postDetailsToFirestore() async {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = FirebaseAuth_auth.currentUser;


//     UserModel userModel = UserModel(
//       ageField: ageEditingController.text,
//     );

//     // writing all the values
//     userModel.email = user!.email;
//     userModel.uid = user.uid;
//     userModel.firstName = firstNameEditingController.text;
//     userModel.secondName = secondNameEditingController.text;
//     userModel.ageField = ageEditingController.text;

//     FirebaseAuth.instance
//         .signInWithEmailAndPassword(
//             email: emailEditingController.text,
//             password: passwordEditingController.text)
//         .then((value) {
//       Navigator.push(
//         (context),
//         MaterialPageRoute(builder: (context) => otpScreen()),
//       );
//     }).onError((error, stackTrace) {
//       print("Error ${error.toString()}");
//     });
//     await firebaseFirestore
//         .collection("users")
//         .doc(user.uid)
//         .set(userModel.toMap());
//     Fluttertoast.showToast(msg: "Account created successfully :) ");
//   }
// }


//New Line



/*import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/otp_screen.dart';
//import '/screens/home_screen.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_complete_guide/screens/signin_screen.dart';
//import 'package:flutter_complete_guide/screens/otp_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/user_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final FirebaseAuth_auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  // string for displaying the error Message
  String? errorMessage;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    /*final secondNameField = TextFormField(
      autofocus: false,
      controller: _controller,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Phone number cannot be empty");
        }
        if (!RegExp("^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}")
            .hasMatch(value)) {
          return "Please enter valid phone number";
        }
        return null;
      },
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone_android),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "+91",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );*/

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password (Min 7 characters)",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.deepOrange,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            otpScreen(otpController.text);
            //signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        //elevation: 0,
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),*/
        leading: (SizedBox(
          height: 500,
          width: 500,
          /*child: Image.asset(
            'assets/jssstu.png',
            width: 100,
            height: 150,
            fit: BoxFit.fill,
            scale: 0.5,
          ),*/
        )),

        title: const Text(
          "SCHOLAMETER",
          style: TextStyle(
              color: Color.fromARGB(255, 7, 20, 91),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        centerTitle: true,
        /*actions: [
          SizedBox(
            height: 150,
            width: 150,
            child: IconButton(
              alignment: Alignment.topRight,
              icon: Image.asset('assets/logo.png'),
              iconSize: 100,
              onPressed: () => exit(0),
            ),
          ),
        ],*/
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 100,
                        width: 330,
                        child: Image.asset(
                          "assets/logo.jpg",
                          height: 100,
                          width: 330,
                          scale: 0.5,
                          fit: BoxFit.fill,
                        )),
                    /*Text(
                      "Funded by ICMR",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),*/
                    SizedBox(height: 20),
                    firstNameField,
                    SizedBox(height: 20),
                    /*secondNameField,
                    SizedBox(height: 20),*/
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    signUpButton,
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInScreen()));
                            },
                            child: Text(
                              "SignIn",
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth_auth.createUserWithEmailAndPassword(
                email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth_auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailEditingController.text,
            password: passwordEditingController.text)
        .then((value) {
      Navigator.push(
        (context),
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    }).onError((error, stackTrace) {
      print("Error ${error.toString()}");
    });
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }
}*/







//New line 
/*import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/otp_screen.dart';
//import '/screens/home_screen.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_complete_guide/screens/signin_screen.dart';
//import 'package:flutter_complete_guide/screens/otp_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/user_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final FirebaseAuth_auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  // string for displaying the error Message
  String? errorMessage;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    /*final secondNameField = TextFormField(
      autofocus: false,
      controller: _controller,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Phone number cannot be empty");
        }
        if (!RegExp("^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}")
            .hasMatch(value)) {
          return "Please enter valid phone number";
        }
        return null;
      },
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone_android),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "+91",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );*/

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password (Min 7 characters)",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.deepOrange,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            otpScreen(otpController.text);
            //signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        //elevation: 0,
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),*/
        leading: (SizedBox(
          height: 500,
          width: 500,
          /*child: Image.asset(
            'assets/jssstu.png',
            width: 100,
            height: 150,
            fit: BoxFit.fill,
            scale: 0.5,
          ),*/
        )),

        title: const Text(
          "SCHOLAMETER",
          style: TextStyle(
              color: Color.fromARGB(255, 7, 20, 91),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        centerTitle: true,
        /*actions: [
          SizedBox(
            height: 150,
            width: 150,
            child: IconButton(
              alignment: Alignment.topRight,
              icon: Image.asset('assets/logo.png'),
              iconSize: 100,
              onPressed: () => exit(0),
            ),
          ),
        ],*/
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 100,
                        width: 330,
                        child: Image.asset(
                          "assets/logo.jpg",
                          height: 100,
                          width: 330,
                          scale: 0.5,
                          fit: BoxFit.fill,
                        )),
                    /*Text(
                      "Funded by ICMR",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),*/
                    SizedBox(height: 20),
                    firstNameField,
                    SizedBox(height: 20),
                    /*secondNameField,
                    SizedBox(height: 20),*/
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    signUpButton,
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInScreen()));
                            },
                            child: Text(
                              "SignIn",
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth_auth.createUserWithEmailAndPassword(
                email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth_auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailEditingController.text,
            password: passwordEditingController.text)
        .then((value) {
      Navigator.push(
        (context),
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    }).onError((error, stackTrace) {
      print("Error ${error.toString()}");
    });
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }
}*/