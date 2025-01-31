import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/bottom_navbar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:flutter_complete_guide/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String documentId = '';
CollectionReference teacherinfo =
    FirebaseFirestore.instance.collection('teacherData');

class TeacherInfoForm extends StatefulWidget {
  @override
  _TeacherInfoFormState createState() => _TeacherInfoFormState();
}

class _TeacherInfoFormState extends State<TeacherInfoForm> {
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String profession = 'Select';
  String tenth = '';
  String twelfth = '';
  String degree = '';
  String masters = '';
  String mastersd = 'Select';
  String doc = 'Select';
  String sch = 'Select';
  String coun = 'Select';
  String scout = 'Select';
  int grad = -1;
  int child = -1;
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
          await FirebaseFirestore.instance.collection('teacherData').add({
        //'timestamp': FieldValue.serverTimestamp(),
        'firstName': firstName,
        'middleName': middleName,
        'lastName': lastName,
        'profession': profession,
        'tenth': tenth,
        'twelfth': twelfth,
        'degree': degree,
        'masters': masters,
        'mastersd': mastersd,
        'doc': doc,
        'sch': sch,
        'coun': coun,
        'scout': scout,
        'grad': grad,
        'child': child,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Information Form'),
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
            Text('Profession', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: profession,
              onChanged: (value) {
                setState(() {
                  profession = value!;
                });
              },
              items: [
                'Select',
                'Art',
                'Biology',
                'English',
                'French',
                'History',
                'Math',
                'Music',
                'Principal',
                'Science',
                'Substitute Teacher'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Score in Tenth'),
              onChanged: (value) {
                setState(() {
                  tenth = value;
                });
              },
            ),
            const SizedBox(width: 10, height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Score in Twelfth'),
              onChanged: (value) {
                setState(() {
                  twelfth = value;
                });
              },
            ),
            const SizedBox(width: 10, height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Score in Degree'),
              onChanged: (value) {
                setState(() {
                  degree = value;
                });
              },
            ),
            const SizedBox(width: 10, height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Score in Masters'),
              onChanged: (value) {
                setState(() {
                  masters = value;
                });
              },
            ),
            const SizedBox(width: 10, height: 20),
            Text('Masters Done', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: mastersd,
              onChanged: (value) {
                setState(() {
                  mastersd = value!;
                });
              },
              items: [
                'Select',
                'Yes',
                'No',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 20),
            Text('Doctoral Programme Completed?',
                style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: doc,
              onChanged: (value) {
                setState(() {
                  doc = value!;
                });
              },
              items: [
                'Select',
                'Yes',
                'No',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 20),
            Text('Any Academic Scholarships Won?',
                style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: sch,
              onChanged: (value) {
                setState(() {
                  sch = value!;
                });
              },
              items: [
                'Select',
                'Yes',
                'No',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 20),
            Text('Have you represented state/country for any activity/event?',
                style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: coun,
              onChanged: (value) {
                setState(() {
                  coun = value!;
                });
              },
              items: [
                'Select',
                'Yes',
                'No',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 20),
            Text('Have you ever been part of scouts/NCC?',
                style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: scout,
              onChanged: (value) {
                setState(() {
                  scout = value!;
                });
              },
              items: [
                'Select',
                'Yes',
                'No',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 20),
            Text(
              'How would you describe your exposure to education before graduation?',
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
                            grad = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: grad == rating ? Colors.blue : Colors.grey,
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
                        Text('Low', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('High', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),
            const SizedBox(width: 10, height: 20),
            Text(
              'How would you describe your early childhood residence neighbourhood?',
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
                            child = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: child == rating ? Colors.blue : Colors.grey,
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
                        Text('Low', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('High', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    storeFormData();
                    // Implement code to save the form data here
                    // For now, display a confirmation message
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              nextpage(documentId: documentId)),
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

//PAGE 1
class nextpage extends StatefulWidget {
  late final String documentId;

  nextpage({required this.documentId});
  @override
  _nextpageState createState() => _nextpageState();
}

class _nextpageState extends State<nextpage> {
  String mentor = 'Select';
  String research = 'Select';
  String design = 'Select';
  String assessment = 'Select';
  String participate = 'Select';
  int teach = -1;

  Future<void> saveFormData() async {
    try {
      await teacherinfo.doc(widget.documentId).update({
        'mentor': mentor,
        'design': design,
        'assessment': assessment,
        'participate': participate,
        'teach': teach,
      });
      setState(() {
        documentId = teacherinfo.id; // Set documentId after data is stored
      });

      print('Form data stored successfully! Document ID: ${teacherinfo.id}');
    } catch (e) {
      print('Error storing form data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Information Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Center(
                child: Text(
              'General Information',
              style: TextStyle(fontSize: 20),
            )),*/
            // ...other input fields

            const SizedBox(width: 10, height: 20),
            Text(
                'Did you receive timely mentorship during your career planning?',
                style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: mentor,
              onChanged: (value) {
                setState(() {
                  mentor = value!;
                });
              },
              items: [
                'Select',
                'Yes',
                'No',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 20),
            Text('Any Research papers published?',
                style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: research,
              onChanged: (value) {
                setState(() {
                  research = value!;
                });
              },
              items: [
                'Select',
                'Yes',
                'No',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 20),
            Text(
                'Have you designed independently or in a team a curriculum for a course?',
                style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: design,
              onChanged: (value) {
                setState(() {
                  design = value!;
                });
              },
              items: [
                'Select',
                'Yes',
                'No',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 20),
            Text(
                'Have you been invited as a resource person to write for reference books/text books/Question papers/ national level assessments?',
                style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: assessment,
              onChanged: (value) {
                setState(() {
                  assessment = value!;
                });
              },
              items: [
                'Select',
                'Yes',
                'No',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 20),
            Text(
                'How often do you participate in events/activities that contribute to your continual learning and skill upgrading?',
                style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: participate,
              onChanged: (value) {
                setState(() {
                  participate = value!;
                });
              },
              items: [
                'Select',
                'Yes',
                'No',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 20),
            Text(
              'How would you describe the influence your peers had on you to choose teaching?',
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
                            teach = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: teach == rating ? Colors.blue : Colors.grey,
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
                        Text('Low', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('High', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),
            const SizedBox(width: 10, height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TeacherInfoForm()),
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
                    // For now, display a confirmation message
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
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              secondpage(documentId: widget.documentId)),
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

//PAGE 2
class secondpage extends StatefulWidget {
  final String documentId;

  secondpage({required this.documentId});
  @override
  _secondpageState createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  String reason = 'Select';
  String exp = '';
  String sub = 'Select';
  int interest = -1;
  int happy = -1;
  int response = -1;
  int interaction = -1;
  int timeliness = -1;
  Future<void> saveFormData() async {
    try {
      print('Document ID: ${widget.documentId}');
      if (widget.documentId.isNotEmpty) {
        await teacherinfo.doc(widget.documentId).set({
          'reason': reason,
          'exp': exp,
          'sub': sub,
          'interest': interest,
          'happy': happy,
          'response': response,
          'interaction': interaction,
          'timeliness': timeliness,
        }, SetOptions(merge: true));

        print('Form data stored successfully! Document ID: ${teacherinfo.id}');
      }
    } catch (e) {
      print('Error storing form data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Information Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              'Classroom Interaction',
              style: TextStyle(fontSize: 20),
            )),
            // ...other input fields

            const SizedBox(width: 10, height: 20),
            Text('Reason to join this school', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: reason,
              onChanged: (value) {
                setState(() {
                  reason = value!;
                });
              },
              items: [
                'Select',
                'Location',
                'Renumeration',
                'Reputation',
                'Other',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10, height: 20),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Total number of years of experience'),
              onChanged: (value) {
                setState(() {
                  exp = value;
                });
              },
            ),
            Text('Subjects currently you are teaching',
                style: TextStyle(fontSize: 18)),
            /*DropdownButton<String>(
              value: sub,
              onChanged: (value) {
                setState(() {
                  sub = value!;
                });
              },
              items: [
                'Select',
                'English',
                'Math',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),*/
            DropdownButton<String>(
              value: sub,
              onChanged: (value) {
                setState(() {
                  sub = value!;
                });
              },
              items: [
                'Select',
                'English',
                'Math',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18), // Add style here
                  ),
                );
              }).toList(),
            ),

            const SizedBox(width: 10, height: 20),
            Text(
              'How would you describe  interest you have in the current subjects you are engaging?',
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
                            interest = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                interest == rating ? Colors.blue : Colors.grey,
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
                        Text('Lowest', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Highest', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),
            const SizedBox(width: 10, height: 20),

            Text(
              'How would you describe happiness quotient in the profession ?',
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
                            happy = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: happy == rating ? Colors.blue : Colors.grey,
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
                        Text('Lowest', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Highest', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),

            const SizedBox(width: 10, height: 20),

            Text(
              'How would you describe student reponse to your teaching in the class ?',
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
                            response = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                response == rating ? Colors.blue : Colors.grey,
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
                        Text('Lowest', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Highest', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),

            const SizedBox(width: 10, height: 20),
            Text(
              'How would you describe the timeliness with which students are submitting their homeworks ?',
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
                        Text('Lowest', style: TextStyle(fontSize: 12.0)),
                      if (rating == 5)
                        Text('Highest', style: TextStyle(fontSize: 12.0)),
                      if (rating == 2 || rating == 3 || rating == 4) Text(' '),
                    ],
                  );
                }).toList(),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              nextpage(documentId: documentId)),
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
                    // For now, display a confirmation message
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
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              thirdpage(documentId: widget.documentId)),
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
//PAGE 3

class thirdpage extends StatefulWidget {
  final String documentId;

  thirdpage({required this.documentId});
  @override
  _thirdpageState createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  int peer = -1;
  int student = -1;
  int qu = -1;
  int appr = -1;
  int rate = -1;
  Future<void> saveFormData() async {
    try {
      print('Document ID: ${widget.documentId}');
      if (widget.documentId.isNotEmpty) {
        await teacherinfo.doc(widget.documentId).set({
          'peer': peer,
          'student': student,
          'qu': qu,
          'appr': appr,
          'rate': rate,
        }, SetOptions(merge: true));

        print('Form data stored successfully! Document ID: $teacherinfo.id}');
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
        title: Text('Teacher Information Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              'Teacher Feedback',
              style: TextStyle(fontSize: 20),
            )),
            // ...other input fields

            const SizedBox(width: 10, height: 20),
            Text(
              'Peer average rating received',
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
                            peer = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: peer == rating ? Colors.blue : Colors.grey,
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
            const SizedBox(width: 10, height: 20),

            Text(
              'Student average rating ',
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
                            student = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                student == rating ? Colors.blue : Colors.grey,
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

            const SizedBox(width: 10, height: 20),

            Text(
              'Approachability/availability for students',
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
                            appr = rating;
                          });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appr == rating ? Colors.blue : Colors.grey,
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

            const SizedBox(width: 10, height: 20),

            Text(
              'Effective doubts clearing/concept clarity by the teacher ',
              style: TextStyle(fontSize: 20),
            ),
            RatingBar.builder(
              initialRating: rate.toDouble(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 40.0,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  rate = rating.toInt();
                });
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              secondpage(documentId: widget.documentId)),
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
                    // For now, display a confirmation message
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
                    backgroundColor: Colors.blue,
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
