import 'package:flutter/material.dart';
import '../model/food_habbits.dart'; // Import your MealPlan list
import 'dart:async';

class DietDetail extends StatefulWidget {
  const DietDetail({super.key});

  @override
  State<DietDetail> createState() => _DietDetailState();
}

class _DietDetailState extends State<DietDetail> {
  List<String> list = [
    'Monday / ಸೋಮವಾರ', 'Tuesday / ಮಂಗಳವಾರ', 'Wednesday / ಬುಧವಾರ', 'Thursday / ಗುರುವಾರ', 'Friday / ಶುಕ್ರವಾರ', 'Saturday / ಶನಿವಾರ', 'Sunday / ಭಾನುವಾರ'
  ];
  late MealPlan currDiet;
  late int day;
  String? selectedMeal;

  @override
  void initState() {
    final now = DateTime.now();
    day = now.weekday - 1; // Monday is 1, so subtract 1 to match index in list
    currDiet = mealPlans[day]; // Initialize currDiet based on the current day
    super.initState();
  }

  void changeDay(int dayIndex) {
    setState(() {
      day = dayIndex;
      currDiet = mealPlans[day]; // Update currDiet based on selected day
    });
  }

  // Function to show a modal with meal details
  void showMealDetails(String mealType, String mealDetails) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjust to content size
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealType,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  mealDetails,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the modal
                  },
                  child: const Text('Close / ಮುಚ್ಚಿ'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Dietary Details",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton<int>(
                value: day, // Currently selected day index
                items: List.generate(list.length, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(list[index]), // Display day name
                  );
                }),
                onChanged: (int? newDay) {
                  if (newDay != null) {
                    changeDay(newDay); // Call changeDay with the new selected index
                  }
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 3, 16, 3),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currDiet.day,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      // Wrap mealInfo in GestureDetector to handle click inside mealInfo
                      mealInfo("Breakfast / ಬೆಳಗಿನ ತಿಂಡಿ", currDiet.breakfast, selectedMeal == "Breakfast / ಬೆಳಗಿನ ತಿಂಡಿ", () {
                        setState(() {
                          selectedMeal = "Breakfast / ಬೆಳಗಿನ ತಿಂಡಿ";
                        });
                        showMealDetails("Breakfast / ಬೆಳಗಿನ ತಿಂಡಿ", currDiet.breakfast);
                        Timer(const Duration(seconds: 1), () {
                          setState(() {
                            selectedMeal = null; // Reset selectedMeal to remove the outline
                          });
                        });
                      }),
                      const SizedBox(height: 4),
                      mealInfo("Mid-Meal / ಮಧ್ಯಾನ್ತ ಆಹಾರ", currDiet.midMeal, selectedMeal == "Mid-Meal / ಮಧ್ಯಾನ್ತ ಆಹಾರ", () {
                        setState(() {
                          selectedMeal = "Mid-Meal / ಮಧ್ಯಾನ್ತ ಆಹಾರ";
                        });
                        showMealDetails("Mid-Meal / ಮಧ್ಯಾನ್ತ ಆಹಾರ", currDiet.midMeal);
                        Timer(const Duration(seconds: 1), () {
                          setState(() {
                            selectedMeal = null; // Reset selectedMeal to remove the outline
                          });
                        });
                      }),
                      const SizedBox(height: 4),
                      mealInfo("Lunch / ಮಧ್ಯಾಹ್ನದ ಊಟ", currDiet.lunch, selectedMeal == "Lunch / ಮಧ್ಯಾಹ್ನದ ಊಟ", () {
                        setState(() {
                          selectedMeal = "Lunch / ಮಧ್ಯಾಹ್ನದ ಊಟ";
                        });
                        showMealDetails("Lunch / ಮಧ್ಯಾಹ್ನದ ಊಟ", currDiet.lunch);
                        Timer(const Duration(seconds: 1), () {
                          setState(() {
                            selectedMeal = null; // Reset selectedMeal to remove the outline
                          });
                        });
                      }),
                      const SizedBox(height: 4),
                      mealInfo("Evening / ಸಿಂಜೆ", currDiet.evening, selectedMeal == "Evening / ಸಿಂಜೆ", () {
                        setState(() {
                          selectedMeal = "Evening / ಸಿಂಜೆ";
                        });
                        showMealDetails("Evening / ಸಿಂಜೆ", currDiet.evening);
                        Timer(const Duration(seconds: 1), () {
                          setState(() {
                            selectedMeal = null; // Reset selectedMeal to remove the outline
                          });
                        });
                      }),
                      const SizedBox(height: 4),
                      mealInfo("Dinner / ರಾತ್ರಿಯ ಊಟ", currDiet.dinner, selectedMeal == "Dinner / ರಾತ್ರಿಯ ಊಟ", () {
                        setState(() {
                          selectedMeal = "Dinner / ರಾತ್ರಿಯ ಊಟ";
                        });
                        showMealDetails("Dinner / ರಾತ್ರಿಯ ಊಟ", currDiet.dinner);
                        Timer(const Duration(seconds: 1), () {
                          setState(() {
                            selectedMeal = null; // Reset selectedMeal to remove the outline
                          });
                        });
                      }),
                      const SizedBox(height: 4),
                      mealInfo("Bed Time / ಮಲಗುವ ಮುಂಚೆ", currDiet.bedTime, selectedMeal == "Bed Time / ಮಲಗುವ ಮುಂಚೆ", () {
                        setState(() {
                          selectedMeal = "Bed Time / ಮಲಗುವ ಮುಂಚೆ";
                        });
                        showMealDetails("Bed Time / ಮಲಗುವ ಮುಂಚೆ", currDiet.bedTime);
                        Timer(const Duration(seconds: 1), () {
                          setState(() {
                            selectedMeal = null; // Reset selectedMeal to remove the outline
                          });
                        });
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to display meal information with animation and gesture detection
  Widget mealInfo(String mealType, String mealDetails, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Call the provided onTap callback
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300), // Animation duration
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent, // Highlight border if selected
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            
              Text(
                mealType,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}


// class DropDownChanger extends StatefulWidget {
//   const DropDownChanger(this.day, {super.key});
//   final int day;
//   @override
//   State<DropDownChanger> createState() => _DropDownChangerState();
// }

// class _DropDownChangerState extends State<DropDownChanger> {
  
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
//}
