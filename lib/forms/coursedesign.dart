import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_complete_guide/screens/bottom_navbar.dart';
//import 'package:flutter_complete_guide/screens/home_screen.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
// Define a global key for the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Define variables to store user input

  String question1 = "";
  String question2 = "";
  String question3 = "";
  String question4 = "";
  String question5 = "";
  String question6 = "";
  String question7 = "";
  String question8 = "";
  String question9 = "";
  String question10 = "";
  String question11 = "";
  String question12 = "";
  String question13 = "";
  String question14 = "";
  String question15 = "";
  String question16 = "";
  String question17 = "";
  // Reference to Firestore collection
  final CollectionReference _formCollection =
      FirebaseFirestore.instance.collection('courseDesign');
  // Function to save form data to Firestore
  Future<void> _saveFormData() async {
    try {
      // Add your Firebase Firestore logic here to save the form data
      await _formCollection.add({
        'question 1': question1,
        'question 2': question2,
        'question 3': question3,
        'question 4': question4,
        'question 5': question5,
        'question 6': question6,
        'question 7': question7,
        'question 8': question8,
        'question 9': question9,
        'question 10': question10,
        'question 11': question11,
        'question 12': question12,
        'question 13': question13,
        'question 14': question14,
        'question 15': question15,
        'question 16': question16,
        'question 17': question17,
      });

      // Show success dialog
      _showSuccessDialog();
    } catch (e) {
      print('Error saving form data: $e');
    }
  }

  // Function to show the success dialog
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Form Submitted Successfully'),
          content: Text('Thank you for submitting the form.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        MyBottomNav(), // Replace HomeScreen() with the actual screen you want to navigate to
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  // Custom validation function to ensure at least one option is selected
  /*String? _validateRadioGroup(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }
    return null;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0), // Adjust the preferred height
        child: Container(
          padding: EdgeInsets.all(25.0), // Add padding here
          color: Colors.deepOrange, // Set your desired background color
          child: AppBar(
            title: Text(
              'COURSE DESIGN FORM\n(Mark only one option)',
              style: TextStyle(
                fontSize: 15, // Adjust font size as needed
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Q1
                Text(
                    '1. Any changes in the course syllabus compared to previous year?',
                    style: TextStyle(fontSize: 17)),

                Material(
                  child: RadioListTile<String>(
                    title: Text('Yes'),
                    value: 'Yes',
                    groupValue: question1,
                    onChanged: (value) {
                      setState(() {
                        question1 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('No'),
                    value: 'No',
                    groupValue: question1,
                    onChanged: (value) {
                      setState(() {
                        question1 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Not aware'),
                    value: 'Not aware',
                    groupValue: question1,
                    onChanged: (value) {
                      setState(() {
                        question1 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                // Add similar Material and RadioListTile widgets for the remaining questions...
                //Q2
                Text('2. How many Modules are Completed?',
                    style: TextStyle(fontSize: 17)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('1'),
                    value: '1',
                    groupValue: question2,
                    onChanged: (value) {
                      setState(() {
                        question2 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('2'),
                    value: '2',
                    groupValue: question2,
                    onChanged: (value) {
                      setState(() {
                        question2 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('3'),
                    value: '3',
                    groupValue: question2,
                    onChanged: (value) {
                      setState(() {
                        question2 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('4'),
                    value: '4',
                    groupValue: question2,
                    onChanged: (value) {
                      setState(() {
                        question2 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('None'),
                    value: 'None',
                    groupValue: question2,
                    onChanged: (value) {
                      setState(() {
                        question2 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q3
                Text('3. Difficulty level of Module 1',
                    style: TextStyle(fontSize: 17)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Easy'),
                    value: 'Very Easy',
                    groupValue: question3,
                    onChanged: (value) {
                      setState(() {
                        question3 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Easy'),
                    value: 'Easy',
                    groupValue: question3,
                    onChanged: (value) {
                      setState(() {
                        question3 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Moderate'),
                    value: 'Moderate',
                    groupValue: question3,
                    onChanged: (value) {
                      setState(() {
                        question3 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Difficult'),
                    value: 'Difficult',
                    groupValue: question3,
                    onChanged: (value) {
                      setState(() {
                        question3 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Difficult'),
                    value: 'Very Difficult',
                    groupValue: question3,
                    onChanged: (value) {
                      setState(() {
                        question3 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q4
                Text('4. Difficulty level of Module 2',
                    style: TextStyle(fontSize: 17)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Easy'),
                    value: 'Very Easy',
                    groupValue: question4,
                    onChanged: (value) {
                      setState(() {
                        question4 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Easy'),
                    value: 'Easy',
                    groupValue: question4,
                    onChanged: (value) {
                      setState(() {
                        question4 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Moderate'),
                    value: 'Moderate',
                    groupValue: question4,
                    onChanged: (value) {
                      setState(() {
                        question4 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Difficult'),
                    value: 'Difficult',
                    groupValue: question4,
                    onChanged: (value) {
                      setState(() {
                        question4 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Difficult'),
                    value: 'Very Difficult',
                    groupValue: question4,
                    onChanged: (value) {
                      setState(() {
                        question4 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q5
                Text('5. Difficulty level of Module 3',
                    style: TextStyle(fontSize: 17)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Easy'),
                    value: 'Very Easy',
                    groupValue: question5,
                    onChanged: (value) {
                      setState(() {
                        question5 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Easy'),
                    value: 'Easy',
                    groupValue: question5,
                    onChanged: (value) {
                      setState(() {
                        question5 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Moderate'),
                    value: 'Moderate',
                    groupValue: question5,
                    onChanged: (value) {
                      setState(() {
                        question5 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Difficult'),
                    value: 'Difficult',
                    groupValue: question5,
                    onChanged: (value) {
                      setState(() {
                        question5 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Difficult'),
                    value: 'Very Difficult',
                    groupValue: question5,
                    onChanged: (value) {
                      setState(() {
                        question5 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q6
                Text('6. Difficulty level of Module 4',
                    style: TextStyle(fontSize: 17)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Easy'),
                    value: 'Very Easy',
                    groupValue: question6,
                    onChanged: (value) {
                      setState(() {
                        question6 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Easy'),
                    value: 'Easy',
                    groupValue: question6,
                    onChanged: (value) {
                      setState(() {
                        question6 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Moderate'),
                    value: 'Moderate',
                    groupValue: question6,
                    onChanged: (value) {
                      setState(() {
                        question6 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Difficult'),
                    value: 'Difficult',
                    groupValue: question6,
                    onChanged: (value) {
                      setState(() {
                        question6 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Difficult'),
                    value: 'Very Difficult',
                    groupValue: question6,
                    onChanged: (value) {
                      setState(() {
                        question6 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q7
                Text('7. Expected Performance of Students in Module 1',
                    style: TextStyle(fontSize: 16)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Low'),
                    value: 'Very Low',
                    groupValue: question7,
                    onChanged: (value) {
                      setState(() {
                        question7 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Low'),
                    value: 'Low',
                    groupValue: question7,
                    onChanged: (value) {
                      setState(() {
                        question7 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Moderate'),
                    value: 'Moderate',
                    groupValue: question7,
                    onChanged: (value) {
                      setState(() {
                        question7 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('High'),
                    value: 'High',
                    groupValue: question7,
                    onChanged: (value) {
                      setState(() {
                        question7 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very High'),
                    value: 'Very High',
                    groupValue: question7,
                    onChanged: (value) {
                      setState(() {
                        question7 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q8
                Text('8. Expected Performance of Students in Module 2',
                    style: TextStyle(fontSize: 16)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Low'),
                    value: 'Very Low',
                    groupValue: question8,
                    onChanged: (value) {
                      setState(() {
                        question8 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Low'),
                    value: 'Low',
                    groupValue: question8,
                    onChanged: (value) {
                      setState(() {
                        question8 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Moderate'),
                    value: 'Moderate',
                    groupValue: question8,
                    onChanged: (value) {
                      setState(() {
                        question8 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('High'),
                    value: 'High',
                    groupValue: question8,
                    onChanged: (value) {
                      setState(() {
                        question8 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very High'),
                    value: 'Very High',
                    groupValue: question8,
                    onChanged: (value) {
                      setState(() {
                        question8 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q9
                Text('9. Expected Performance of Students in Module 3',
                    style: TextStyle(fontSize: 16)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Low'),
                    value: 'Very Low',
                    groupValue: question9,
                    onChanged: (value) {
                      setState(() {
                        question9 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Low'),
                    value: 'Low',
                    groupValue: question9,
                    onChanged: (value) {
                      setState(() {
                        question9 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Moderate'),
                    value: 'Moderate',
                    groupValue: question9,
                    onChanged: (value) {
                      setState(() {
                        question9 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('High'),
                    value: 'High',
                    groupValue: question9,
                    onChanged: (value) {
                      setState(() {
                        question9 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very High'),
                    value: 'Very High',
                    groupValue: question9,
                    onChanged: (value) {
                      setState(() {
                        question9 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q10
                Text('10. Expected Performance of Students in Module 4',
                    style: TextStyle(fontSize: 16)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Low'),
                    value: 'Very Low',
                    groupValue: question10,
                    onChanged: (value) {
                      setState(() {
                        question10 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Low'),
                    value: 'Low',
                    groupValue: question10,
                    onChanged: (value) {
                      setState(() {
                        question10 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Moderate'),
                    value: 'Moderate',
                    groupValue: question10,
                    onChanged: (value) {
                      setState(() {
                        question10 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('High'),
                    value: 'High',
                    groupValue: question10,
                    onChanged: (value) {
                      setState(() {
                        question10 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very High'),
                    value: 'Very High',
                    groupValue: question10,
                    onChanged: (value) {
                      setState(() {
                        question10 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q11
                Text('11. Revisions/ Mock Tests are held regularly in School?',
                    style: TextStyle(fontSize: 17)),

                Material(
                  child: RadioListTile<String>(
                    title: Text('Yes'),
                    value: 'Yes',
                    groupValue: question11,
                    onChanged: (value) {
                      setState(() {
                        question11 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('No'),
                    value: 'No',
                    groupValue: question11,
                    onChanged: (value) {
                      setState(() {
                        question11 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q12
                Text('12. How is the average performance in Mock Tests?',
                    style: TextStyle(fontSize: 17)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Poor'),
                    value: 'Poor',
                    groupValue: question12,
                    onChanged: (value) {
                      setState(() {
                        question12 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Fair'),
                    value: 'Fair',
                    groupValue: question12,
                    onChanged: (value) {
                      setState(() {
                        question12 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Average'),
                    value: 'Average',
                    groupValue: question12,
                    onChanged: (value) {
                      setState(() {
                        question12 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Good'),
                    value: 'Good',
                    groupValue: question12,
                    onChanged: (value) {
                      setState(() {
                        question12 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Excellent'),
                    value: 'Excellent',
                    groupValue: question12,
                    onChanged: (value) {
                      setState(() {
                        question12 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q13
                Text(
                    '13. Difficulty level of the Final Exam Question Paper last year',
                    style: TextStyle(fontSize: 17)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Easy'),
                    value: 'Very Easy',
                    groupValue: question13,
                    onChanged: (value) {
                      setState(() {
                        question13 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Easy'),
                    value: 'Easy',
                    groupValue: question13,
                    onChanged: (value) {
                      setState(() {
                        question13 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Moderate'),
                    value: 'Moderate',
                    groupValue: question13,
                    onChanged: (value) {
                      setState(() {
                        question13 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Difficult'),
                    value: 'Difficult',
                    groupValue: question13,
                    onChanged: (value) {
                      setState(() {
                        question13 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Difficult'),
                    value: 'Very Difficult',
                    groupValue: question13,
                    onChanged: (value) {
                      setState(() {
                        question13 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q14
                Text(
                    '14. Difficulty level of the Final Exam Question Paper this year',
                    style: TextStyle(fontSize: 17)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Easy'),
                    value: 'Easy',
                    groupValue: question14,
                    onChanged: (value) {
                      setState(() {
                        question14 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Easy'),
                    value: 'Very Easy',
                    groupValue: question14,
                    onChanged: (value) {
                      setState(() {
                        question14 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Moderate'),
                    value: 'Moderate',
                    groupValue: question14,
                    onChanged: (value) {
                      setState(() {
                        question14 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Difficult'),
                    value: 'Difficult',
                    groupValue: question14,
                    onChanged: (value) {
                      setState(() {
                        question14 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Difficult'),
                    value: 'Very Difficult',
                    groupValue: question14,
                    onChanged: (value) {
                      setState(() {
                        question14 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q15
                Text(
                    '15. Expected Average Performance of the students for this years Exams',
                    style: TextStyle(fontSize: 17)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very Low'),
                    value: 'Very Low',
                    groupValue: question15,
                    onChanged: (value) {
                      setState(() {
                        question15 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Low'),
                    value: 'Low',
                    groupValue: question15,
                    onChanged: (value) {
                      setState(() {
                        question15 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Moderate'),
                    value: 'Moderate',
                    groupValue: question15,
                    onChanged: (value) {
                      setState(() {
                        question15 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('High'),
                    value: 'High',
                    groupValue: question15,
                    onChanged: (value) {
                      setState(() {
                        question15 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('Very High'),
                    value: 'Very High',
                    groupValue: question15,
                    onChanged: (value) {
                      setState(() {
                        question15 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q16
                Text(
                    '16. Expected Average Performance of the students for this years Exams',
                    style: TextStyle(fontSize: 17)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('0 to 25 percentile'),
                    value: '0 to 25 percentile',
                    groupValue: question16,
                    onChanged: (value) {
                      setState(() {
                        question16 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('25 to 50 percentile'),
                    value: '25 to 50 percentile',
                    groupValue: question16,
                    onChanged: (value) {
                      setState(() {
                        question16 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('50 to 75 percentile'),
                    value: '50 to 75 percentile',
                    groupValue: question16,
                    onChanged: (value) {
                      setState(() {
                        question16 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('75 to 100 percentile'),
                    value: '75 to 100 percentile',
                    groupValue: question16,
                    onChanged: (value) {
                      setState(() {
                        question16 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //Q17
                Text(
                    '17. This year the School is Aiming to acheive the percentile of',
                    style: TextStyle(fontSize: 17)),
                Material(
                  child: RadioListTile<String>(
                    title: Text('0 to 25 percentile'),
                    value: '0 to 25 percentile',
                    groupValue: question17,
                    onChanged: (value) {
                      setState(() {
                        question17 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('25 to 50 percentile'),
                    value: '25 to 50 percentile',
                    groupValue: question17,
                    onChanged: (value) {
                      setState(() {
                        question17 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('50 to 75 percentile'),
                    value: '50 to 75 percentile',
                    groupValue: question17,
                    onChanged: (value) {
                      setState(() {
                        question17 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),
                Material(
                  child: RadioListTile<String>(
                    title: Text('75 to 100 percentile'),
                    value: '75 to 100 percentile',
                    groupValue: question17,
                    onChanged: (value) {
                      setState(() {
                        question17 = value!;
                      });
                    },
                    activeColor: Colors.blue, // Change color when clicked
                  ),
                ),

                //form submit

                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Custom validation to check if at least one option is selected for each question
                      if (question1.isEmpty ||
                          question2.isEmpty ||
                          question3.isEmpty ||
                          question4.isEmpty ||
                          question5.isEmpty ||
                          question6.isEmpty ||
                          question7.isEmpty ||
                          question8.isEmpty ||
                          question9.isEmpty ||
                          question10.isEmpty ||
                          question12.isEmpty ||
                          question13.isEmpty ||
                          question14.isEmpty ||
                          question15.isEmpty ||
                          question16.isEmpty ||
                          question17.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                  'Please fill in all the required fields.',
                                  style: TextStyle()),
                            ),
                          ),
                        );
                      } else {
                        // If all required fields are filled, show the success dialog
                        _saveFormData();

                        //_showSuccessDialog();
                      }
                      /*if (_formKey.currentState!.validate()) {
                        // If form is valid, save data to Firestore
                        _saveFormData();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                  'Please fill in all the required fields.',
                                  style: TextStyle()),
                            ),
                          ),
                        );
                      }*/
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Set the background color to blue
                    ),
                    child:
                        Text('Submit', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
