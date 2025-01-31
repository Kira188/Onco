import 'package:flutter/material.dart';
//import 'package:flutter_complete_guide/forms/repo.dart';
//import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_complete_guide/screens/bottom_navbar.dart';
//import 'package:flutter_complete_guide/screens/home_screen.dart';

String documentId = '';
CollectionReference studentinfo =
    FirebaseFirestore.instance.collection('studentData');

class StudentInfoForm extends StatefulWidget {
  @override
  _StudentInfoFormState createState() => _StudentInfoFormState();
}

class _StudentInfoFormState extends State<StudentInfoForm> {
  //final controller = Get.put(StudentRepository());
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String schoolID = '';
  String birthMonth = 'Select';
  String birthDay = '1';
  String birthYear = DateTime.now().year.toString();
  String address = '';
  String gender = 'Select';
  String studentID = '';
  String schoolYear = 'Select';
  String fatherEducation = '';
  String fatherOccupation = '';
  String motherEducation = '';
  String motherOccupation = '';
  // Function to store form data in Firestore
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String documentId = '';
  Future<void> storeFormData() async {
    /*if (!_formKey.currentState!.validate()) {
      // Form is not valid, do not proceed
      return;
    }
    _formKey.currentState!.save();*/
    try {
      // Get a reference to the Firestore instance

      DocumentReference documentReference =
          await FirebaseFirestore.instance.collection('studentData').add({
        //'timestamp': FieldValue.serverTimestamp(),
        'firstNAme': firstName,
        'middleName': middleName,
        'lastName': lastName,
        'schoolID': schoolID,
        'birthMonth': birthMonth,
        'birthDay': birthDay,
        'birthYear': birthYear,
        'address': address,
        'gender': gender,
        'studentID': studentID,
        'schoolYear': schoolYear,
        'fatherEducation': fatherEducation,
        'fatherOccupation': fatherOccupation,
        'motherEducation': motherEducation,
        'motherOccupation': motherOccupation,
      });
      setState(() {
        documentId =
            documentReference.id; // Set documentId after data is stored
      });

      print(
          'Form data stored successfully! Document ID: ${documentReference.id}');
      // Navigate to NextPage1 with the document ID
    } catch (e) {
      print('Error storing form data: $e');
    }
  }

  // Add the form data to Firestore

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Information Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              'General Information',
              style: TextStyle(fontSize: 20),
            )),
            // ...other input fields
            TextField(
              decoration: InputDecoration(labelText: 'First Name'),
              onChanged: (value) {
                setState(() {
                  firstName = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Middle Name'),
              onChanged: (value) {
                setState(() {
                  middleName = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
              onChanged: (value) {
                setState(() {
                  lastName = value;
                });
              },
            ),
            const SizedBox(width: 10, height: 20),
            Text(
              'Please Select Birth Date',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                DropdownButton<String>(
                  value: birthMonth,
                  onChanged: (value) {
                    setState(() {
                      birthMonth = value!;
                    });
                  },
                  items: <String>[
                    'Select',
                    'January',
                    'February',
                    'March',
                    'April',
                    'May',
                    'June',
                    'July',
                    'August',
                    'September',
                    'October',
                    'November',
                    'December'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: birthDay,
                  onChanged: (value) {
                    setState(() {
                      birthDay = value!;
                    });
                  },
                  items: List.generate(31, (index) {
                    return DropdownMenuItem<String>(
                      value: (index + 1).toString(),
                      child: Text((index + 1).toString()),
                    );
                  }),
                ),
                DropdownButton<String>(
                  value: birthYear,
                  onChanged: (value) {
                    setState(() {
                      birthYear = value!;
                    });
                  },
                  items: List.generate(20, (index) {
                    final year = DateTime.now().year - index;
                    return DropdownMenuItem<String>(
                      value: year.toString(),
                      child: Text(year.toString()),
                    );
                  }),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Address'),
              onChanged: (value) {
                setState(() {
                  address = value;
                });
              },
            ),
            const SizedBox(width: 10, height: 20),
            Text('Please Select Gender', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
              items: ['Select', 'Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'School ID'),
              onChanged: (value) {
                setState(() {
                  schoolID = value;
                });
              },
            ),
            const SizedBox(width: 10, height: 20),
            Text(
              'Please Select the School Year',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: schoolYear,
              onChanged: (value) {
                setState(() {
                  schoolYear = value!;
                });
              },
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(
                  value: 'Select',
                  child: Text('Select'),
                ),

                DropdownMenuItem<String>(
                  value: 'Grade 9',
                  child: Text('Grade 9'),
                ),

                DropdownMenuItem<String>(
                  value: 'Grade 10',
                  child: Text('Grade 10'),
                ),
                // Add more items as needed
              ],
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(labelText: 'Student ID'),
              onChanged: (value) {
                setState(() {
                  studentID = value;
                });
              },
            ),
            //SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(labelText: 'Fathers Education'),
              onChanged: (value) {
                setState(() {
                  fatherEducation = value;
                });
              },
            ),

            TextField(
              decoration: InputDecoration(labelText: 'Fathers Occupation'),
              onChanged: (value) {
                setState(() {
                  fatherOccupation = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Mothers Education'),
              onChanged: (value) {
                setState(() {
                  motherEducation = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Mothers Occupation'),
              onChanged: (value) {
                setState(() {
                  motherOccupation = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement code to save the form data here
                    // For now, display a confirmation message
                    storeFormData();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Form Data Saved!!'),
                          content:
                              Text('Your data has been saved successfully.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next page
                    //save data

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NextPage(documentId: documentId)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Next', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final String documentId;

  NextPage({required this.documentId});
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String anySiblings = 'Select';
  String familySize = 'Select';
  String travelTimeToSchool = 'Select';

  Future<void> saveFormData() async {
    try {
      await studentinfo.doc(widget.documentId).update({
        'anySiblings': anySiblings,
        'familySize': familySize,
        'travelTimeToSchool': travelTimeToSchool,
      });
      setState(() {
        documentId = studentinfo.id; // Set documentId after data is stored
      });

      print('Form data stored successfully! Document ID: ${studentinfo.id}');
    } catch (e) {
      print('Error storing form data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Information Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Family',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(width: 10, height: 30),
            Text(
              'Any siblings',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: anySiblings,
              onChanged: (value) {
                setState(() {
                  anySiblings = value!;
                });
              },
              items: ['Select', 'Yes', 'No']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 30),
            Text(
              'Family size',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: familySize,
              onChanged: (value) {
                setState(() {
                  familySize = value!;
                });
              },
              items: ['Select', '1-2', '3-4', '5+']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 20),
            Text(
              'Time taken to travel to school',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: travelTimeToSchool,
              onChanged: (value) {
                setState(() {
                  travelTimeToSchool = value!;
                });
              },
              items: [
                'Select',
                '< 30 minutes',
                '30-60 minutes',
                '1-2 hours',
                '2+ hours'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentInfoForm()),
                    );
                    // Implement code to navigate to the previous page or section here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Back', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement code to save the form data here
                    saveFormData();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Form Data Saved!!'),
                          content:
                              Text('Your data has been saved successfully.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NextPage1(documentId: widget.documentId)),
                    );
                    // Implement code to navigate to the next page or section here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Next', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage1 extends StatefulWidget {
  final String documentId;

  NextPage1({required this.documentId});
  @override
  _NextPage1State createState() => _NextPage1State();
}

class _NextPage1State extends State<NextPage1> {
  // New variables for Exercise, Fitness, and Diet section
  String tiredDuringClasses = 'Select';
  String mealsPerDay = 'Select';
  String geneticConditions = 'Select';
  String healthStatus = 'Select';
  String allergiesOrConditions = 'Select';
  String exerciseHoursPerWeek = 'Select';
  //CollectionReference documentReference =
  //  FirebaseFirestore.instance.collection('studentData');
  Future<void> saveFormData() async {
    try {
      print('Document ID: ${widget.documentId}');
      if (widget.documentId.isNotEmpty) {
        await studentinfo.doc(widget.documentId).set({
          'tiredDuringClasses': tiredDuringClasses,
          'mealsPerDay': mealsPerDay,
          'geneticConditions': geneticConditions,
          'healthStatus': healthStatus,
          'allergiesOrConditions': allergiesOrConditions,
          'exerciseHoursPerWeek': exerciseHoursPerWeek,
        }, SetOptions(merge: true));

        print('Form data stored successfully! Document ID: ${studentinfo.id}');
      }
    } catch (e) {
      print('Error storing form data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Information Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ... previous form fields ...

            Center(
              child: Text(
                'Exercise, Fitness, and Diet',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'Do you ever feel tired during classes or the day?',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: tiredDuringClasses,
              onChanged: (value) {
                setState(() {
                  tiredDuringClasses = value!;
                });
              },
              items: [
                'Select',
                'Never',
                'Almost Never',
                'Sometimes',
                'Most of the Time',
                'Always'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'How many meals do you have in a day?',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: mealsPerDay,
              onChanged: (value) {
                setState(() {
                  mealsPerDay = value!;
                });
              },
              items: ['Select', '1', '2', '3', 'More than 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'Any genetic conditions recognized?',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: geneticConditions,
              onChanged: (value) {
                setState(() {
                  geneticConditions = value!;
                });
              },
              items: ['Select', 'Yes', 'No']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'How would you rate yourself on your health status?',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: healthStatus,
              onChanged: (value) {
                setState(() {
                  healthStatus = value!;
                });
              },
              items: [
                'Select',
                '1 - Frequently ill',
                '2',
                '3',
                '4',
                '5 - Very healthy'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'Any allergies/health conditions observed?',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: allergiesOrConditions,
              onChanged: (value) {
                setState(() {
                  allergiesOrConditions = value!;
                });
              },
              items: ['Select', 'Yes', 'No']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'How many hours of exercise do you get in a week?',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: exerciseHoursPerWeek,
              onChanged: (value) {
                setState(() {
                  exerciseHoursPerWeek = value!;
                });
              },
              items: [
                'Select',
                'Less than 1 hour',
                '1 hour to 5 hours',
                'More than 5 hours',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            // ... previous form fields ...

            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NextPage(documentId: documentId)),
                    );
                    // Implement code to navigate to the previous page or section here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Back', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement code to save the form data here
                    saveFormData();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Form Data Saved!!'),
                          content:
                              Text('Your data has been saved successfully.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NextPage2(documentId: widget.documentId)),
                    );
                    // Implement code to navigate to the next page or section here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Next', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//PAGE 2

class NextPage2 extends StatefulWidget {
  final String documentId;

  NextPage2({required this.documentId});
  @override
  _NextPage2State createState() => _NextPage2State();
}

class _NextPage2State extends State<NextPage2> {
  // New variables for Student Traits section
  String troubleFallingAsleep = 'Select';
  String timeSpentOnActivities = 'Select';
  int selfConfidence = -1;
  String organizedTimetable = 'Select';
  String competitiveness = 'Select';
  int subjectInterestMath = -1;
  String copingWithStress = 'Select';
  int consistencyInWork = -1;
  String selfRegulation = 'Select';
  int dealingWithChallenges = -1;
  String tasksOnTime = 'Select';
  String longTermGoals = 'Select';
  String futureEducation = 'Select';
  String weeklyGadgetTime = 'Select';
  Future<void> saveFormData() async {
    try {
      print('Document ID: ${widget.documentId}');
      if (widget.documentId.isNotEmpty) {
        await studentinfo.doc(widget.documentId).set({
          'troubleFallingAsleep': troubleFallingAsleep,
          'timeSpentOnActivities': timeSpentOnActivities,
          'selfConfidence': selfConfidence,
          'organizedTimetable': organizedTimetable,
          'competitiveness': competitiveness,
          'subjectInterestMath': subjectInterestMath,
          'copingWithStress': copingWithStress,
          'consistencyInWork': consistencyInWork,
          'selfRegulation': selfRegulation,
          'dealingWithChallenges': dealingWithChallenges,
          'tasksOnTime': tasksOnTime,
          'longTermGoals': longTermGoals,
          'futureEducation': futureEducation,
          'weeklyGadgetTime': weeklyGadgetTime,
        }, SetOptions(merge: true));

        print('Form data stored successfully! Document ID: ${studentinfo.id}');
      }
    } catch (e) {
      print('Error storing form data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Information Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ... previous form fields ...

            Center(
              child: Text(
                'Student Traits',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'I have trouble falling asleep',
              style: TextStyle(fontSize: 20),
            ),

            DropdownButton<String>(
              value: troubleFallingAsleep,
              onChanged: (value) {
                setState(() {
                  troubleFallingAsleep = value!;
                });
              },
              items: [
                'Select',
                'Never',
                'Almost Never',
                'Sometimes',
                'Most of the Time',
                'Always'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'Time spent on extra curricular activities refreshes me',
              style: TextStyle(fontSize: 20),
            ),

            DropdownButton<String>(
              value: timeSpentOnActivities,
              onChanged: (value) {
                setState(() {
                  timeSpentOnActivities = value!;
                });
              },
              items: [
                'Select',
                'Strongly Disagree',
                'Disagree',
                'Neutral',
                'Agree',
                'Strongly Agree'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'How would you rate your self confidence?',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...[1, 2, 3, 4, 5].map((rating) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selfConfidence = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selfConfidence == rating
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (rating == 1)
                        Text('Very Low', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Very High', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'I like to follow an organised timetable to complete my tasks',
              style: TextStyle(fontSize: 20),
            ),

            DropdownButton<String>(
              value: organizedTimetable,
              onChanged: (value) {
                setState(() {
                  organizedTimetable = value!;
                });
              },
              items: [
                'Select',
                'Strongly Disagree',
                'Disagree',
                'Neutral',
                'Agree',
                'Strongly Agree'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'How competetive are you',
              style: TextStyle(fontSize: 20),
            ),

            DropdownButton<String>(
              value: competitiveness,
              onChanged: (value) {
                setState(() {
                  competitiveness = value!;
                });
              },
              items: [
                'Select',
                'Not at all Competitive',
                'Somewhat Competitive',
                'Very Competitive'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'Rate yourself on subject interest for Math',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...[1, 2, 3, 4, 5].map((rating) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            subjectInterestMath = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: subjectInterestMath == rating
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (rating == 1)
                        Text('Worst', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Best', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'I have hard time in coping with stress ?',
              style: TextStyle(fontSize: 20),
            ),

            DropdownButton<String>(
              value: troubleFallingAsleep,
              onChanged: (value) {
                setState(() {
                  troubleFallingAsleep = value!;
                });
              },
              items: [
                'Select',
                'Never',
                'Almost Never',
                'Sometimes',
                'Most of the Time',
                'Always'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'How would you describe yourself on being Consistent in your work?',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...[1, 2, 3, 4, 5].map((rating) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            consistencyInWork = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: consistencyInWork == rating
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (rating == 1)
                        Text('Worst', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Best', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'Do you complete your tasks without anyones reminders or intervention?(self-regulation)',
              style: TextStyle(fontSize: 20),
            ),

            DropdownButton<String>(
              value: selfRegulation,
              onChanged: (value) {
                setState(() {
                  selfRegulation = value!;
                });
              },
              items: [
                'Select',
                'Almost Always',
                'Most of the times',
                'Sometimes',
                'Almost Never',
                'Never'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),

            Text(
              'when you face challenges, how do you deal with them?(perseverence)',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...[1, 2, 3, 4, 5].map((rating) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            dealingWithChallenges = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: dealingWithChallenges == rating
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (rating == 1)
                        Text('Give Up Easily',
                            style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Never Give Up', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'I complete my tasks on time',
              style: TextStyle(fontSize: 20),
            ),

            DropdownButton<String>(
              value: tasksOnTime,
              onChanged: (value) {
                setState(() {
                  tasksOnTime = value!;
                });
              },
              items: [
                'Select',
                'Never',
                'Almost Never',
                'Sometimes',
                'Most of the Time',
                'Always'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'I enjoy setting long term goals and working towards it.',
              style: TextStyle(fontSize: 20),
            ),

            DropdownButton<String>(
              value: longTermGoals,
              onChanged: (value) {
                setState(() {
                  longTermGoals = value!;
                });
              },
              items: [
                'Select',
                'Strongly Disagree',
                'Disagree',
                'Neutral',
                'Agree',
                'Strongly Agree'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'What level of education do you aim to have completed in the next coming ten years?',
              style: TextStyle(fontSize: 20),
            ),

            DropdownButton<String>(
              value: futureEducation,
              onChanged: (value) {
                setState(() {
                  futureEducation = value!;
                });
              },
              items: ['Select', 'Degree', 'Masters', 'Doctoral', 'Others']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'Weekly time spent on gadgets',
              style: TextStyle(fontSize: 20),
            ),

            DropdownButton<String>(
              value: weeklyGadgetTime,
              onChanged: (value) {
                setState(() {
                  weeklyGadgetTime = value!;
                });
              },
              items: [
                'Select',
                'Less than an Hour',
                'One Hour to Five Hours',
                'More than Five Hours'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NextPage1(documentId: documentId)),
                    );
                    // Implement code to navigate to the previous page or section here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Back', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement code to save the form data here
                    saveFormData();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Form Data Saved!!'),
                          content:
                              Text('Your data has been saved successfully.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NextPage3(documentId: widget.documentId)),
                    );
                    // Implement code to navigate to the next page or section here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Next', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage3 extends StatefulWidget {
  final String documentId;

  NextPage3({required this.documentId});
  @override
  _NextPage3State createState() => _NextPage3State();
}

class _NextPage3State extends State<NextPage3> {
  // New variables for Student Traits section
  String school = 'Select';
  String timeSpentOnActivities = 'Select';
  String support = 'Select';
  String nature = 'Select';
  int rate = -1;
  int concepts = -1;
  int doubts = -1;
  int freq = -1;
  String peer = 'Select';
  int fair = -1;
  int timeliness = -1;
  Future<void> saveFormData() async {
    try {
      print('Document ID: ${widget.documentId}');
      if (widget.documentId.isNotEmpty) {
        await studentinfo.doc(widget.documentId).set({
          'school': school,
          'timeSpentOnActivities': timeSpentOnActivities,
          'support': support,
          'nature': nature,
          'rate': rate,
          'concepts': concepts,
          'doubts': doubts,
          'freq': freq,
          'peer': peer,
          'fair': fair,
          'timeliness': timeliness,
        }, SetOptions(merge: true));

        print('Form data stored successfully! Document ID: ${studentinfo.id}');
      }
    } catch (e) {
      print('Error storing form data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Information Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Enrollment History',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'Reason to choose the school',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: school,
              onChanged: (value) {
                setState(() {
                  school = value!;
                });
              },
              items: [
                'Select',
                'Extra-Curricular Activities',
                'Location',
                'Recommendation',
                'Academic Reputation',
                'Other'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'Any extra support given by school?',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: support,
              onChanged: (value) {
                setState(() {
                  support = value!;
                });
              },
              items: [
                'Select',
                'Yes',
                'No',
                'Sometimes',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'Nature of holding of the school',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: nature,
              onChanged: (value) {
                setState(() {
                  nature = value!;
                });
              },
              items: [
                'Select',
                'Private',
                'Govt',
                'Govt Aided',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'Rate non-teaching facilities at School',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...[1, 2, 3, 4, 5].map((rating) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            rate = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: rate == rating ? Colors.blue : Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (rating == 1)
                        Text('Worst', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Best', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'How would you rate on you following concepts taught in school',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...[1, 2, 3, 4, 5].map((rating) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            concepts = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                concepts == rating ? Colors.blue : Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (rating == 1)
                        Text('Worst', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Best', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'How is the follow up done on concepts introduction/doubt clearing?',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...[1, 2, 3, 4, 5].map((rating) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doubts = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: doubts == rating ? Colors.blue : Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (rating == 1)
                        Text('Worst', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Best', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'The frequency of the mock tests/exams conducted is just right for your course',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...[1, 2, 3, 4, 5].map((rating) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            freq = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: freq == rating ? Colors.blue : Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (rating == 1)
                        Text('Disagree', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Agree', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'How would you describe the peer mentaity of your class group',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: peer,
              onChanged: (value) {
                setState(() {
                  peer = value!;
                });
              },
              items: [
                'Select',
                'Highly Incompetitive',
                'Competitive Enough',
                'Highly Competitive',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'Rate the fairness of grading system followed in your school',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...[1, 2, 3, 4, 5].map((rating) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            fair = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: fair == rating ? Colors.blue : Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (rating == 1)
                        Text('Unfair', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Fair', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Text(
              'Rate the timeliness of the guidance received',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...[1, 2, 3, 4, 5].map((rating) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            timeliness = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: timeliness == rating
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (rating == 1)
                        Text('Worst', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Best', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NextPage2(documentId: widget.documentId)),
                    );
                    // Implement code to navigate to the previous page or section here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Back', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    saveFormData();
                    // Implement code to save the form data here
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Form Data Saved!!'),
                          content:
                              Text('Your data has been saved successfully.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NextPage4(documentId: widget.documentId)),
                    );
                    // Implement code to navigate to the next page or section here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Next', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





//PAGE 4
class NextPage4 extends StatefulWidget {
  late final String documentId;

  NextPage4({required this.documentId});
  @override
  _NextPage4State createState() => _NextPage4State();
}

class _NextPage4State extends State<NextPage4> {
  // New variables for Student Traits section
  String? student;
  String assign = '';
  Future<void> saveFormData() async {
    try {
      print('Document ID: ${widget.documentId}');
      if (widget.documentId.isNotEmpty) {
        await studentinfo.doc(widget.documentId).set({
          'student': student ?? 'Select',
          'assign': assign,
        }, SetOptions(merge: true));

        print('Form data stored successfully! Document ID: ${studentinfo.id}');
      }
    } catch (e) {
      print('Error storing form data: $e');
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Information Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'School Academic Records',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 10,
              height: 30,
            ),
            Text(
              'Student to Teacher Ratio',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: student,
              onChanged: (value) {
                setState(() {
                  student = value;
                });
              },
              items: ['Select', 'Less than 15', '15 to 30', 'More than 30']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Maximum 25 characters'),
              onChanged: (value) {
                setState(() {
                  assign = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NextPage3(documentId: widget.documentId)),
                    );
                    // Implement code to navigate to the previous page or section here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Back', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    saveFormData();
                    // Implement code to save the form data here
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Form Data Saved!!'),
                          content:
                              Text('Your data has been saved successfully.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color to blue
                  ),
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showSuccessDialog();
                    // Implement code to navigate to the next page or section here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.green, // Set the background color to blue
                  ),
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
