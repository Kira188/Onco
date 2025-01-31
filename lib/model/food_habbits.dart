class MealPlan {
  final String day;
  final String breakfast;
  final String midMeal;
  final String lunch;
  final String evening;
  final String dinner;
  final String bedTime;

  MealPlan({
    required this.day,
    required this.breakfast,
    required this.midMeal,
    required this.lunch,
    required this.evening,
    required this.dinner,
    required this.bedTime,
  });
}


List<MealPlan> mealPlans = [
  MealPlan(
    day: "Day 01 / ದಿನ 01",
    breakfast: "Moong dal chilla-2 + 2 tsp coconut chutney \n\nಹಸಿರುಬೇಳೆ ದೋಸೆ -2 + 2 ಚಮಚ ಕಾಯಿ ಚಟ್ನಿ",
    midMeal: "Roasted peanuts 1 fist \n\nಉರಿದ ಕಡಲೆಕಾಯಿ 1 ಹಿಡಿ",
    lunch: "1 chapathi + 1 cup (150gm) soya chunks curry + 1/2 cup rice + 1/2 cup curd \n\n1 ಚಪಾತಿ + 1 ಕಪ್ ಸೋಯಾ ಚಂಕ್ಸ್ ಕರಿ + 1/2 ಕಪ್ ಅಕ್ಕಿ + 1/2 ಕಪ್ ಮೊಸರು",
    evening: "1 cup vegetable soup (tomato/mixed vegetables) \n\n1 ಕಪ್ ತರಕಾರಿ ಸೂಪ್ (ಟೊಮೇಟೊ/ಮಿಶ್ರ ತರಕಾರಿ)",
    dinner: "1.5 cup rice + 1/2 cup rasam + 1/2 cup snake gourd sambar \n\n1.5 ಕಪ್ ಅಕ್ಕಿ + 1/2 ಕಪ್ ರಸಂ + 1/2 ಕಪ್ ಪಡವಲಕಾಯಿ ಸಾಂಬಾರ್",
    bedTime: "Turmeric Milk (150ml) \n\nಅರಿಶಿನ ಹಾಲು (150ml)",
  ),
  MealPlan(
    day: "Day 02 / ದಿನ 02",
    breakfast: "Dosa 2 + ridge gourd chutney + 1 glass milk \n\nದೋಸೆ 2 + ಹೀರೆಕಾಯಿ ಚಟ್ನಿ + 1 ಗ್ಲಾಸ್ ಹಾಲು",
    midMeal: "Green peas soup 1 cup \n\nಹಸಿರು ಬಟಾಣಿ ಸೂಪ್ 1 ಕಪ್",
    lunch: "2 multigrain roti (ragi, wheat, bajra, jowar) + 1/2 cup methi dal + 1/2 cup ridge gourd sambar + 1/2 cup curd \n\n2 ಧಾನ್ಯ ರೊಟ್ಟಿ (ರಾಗಿ, ಗೋಧಿ, ಜೋಳ) + 1/2 ಕಪ್ ಮೆಂತ್ಯೆ ಬೇಳೆ ಪಪ್ಪು + 1/2 ಕಪ್ ಹೀರೆಕಾಯಿ ಸಾಂಬಾರ್ + 1/2 ಕಪ್ ಮೊಸರು",
    evening: "Boiled Bengal gram sprouts - 1 cup + 1 glass milk \n\nಬೇಯಿಸಿದ ಕಡಲೆಕಾಳು ಉಸಲಿ 1 ಕಪ್ + 1 ಗ್ಲಾಸ್ ಹಾಲು",
    dinner: "Same as lunch \n\nಮಧ್ಯಾಹ್ನದ ಹಾಗೆಯೇ",
    bedTime: "1 glass milk (150ml) \n\n1 ಗ್ಲಾಸ್ ಹಾಲು (150ml)",
  ),
  MealPlan(
    day: "Day 03 / ದಿನ 03",
    breakfast: "Idly: 3-4 + sambhar + 2 tsp groundnut chutney \n\nಇಡ್ಲಿ 3-4 + 1 ಕಪ್ ಸಾಂಬಾರ್ + 2 ಚಮಚ ಕಡಲೆಕಾಯಿ ಚಟ್ನಿ",
    midMeal: "Carrot soup 1 cup \n\nಕ್ಯಾರೆಟ್ ಸೂಪ್ 1 ಕಪ್",
    lunch: "1 cup rice + 2 wheat dosa + 1/2 cup rajmah curry + 1/2 cup greens sambar + 1/2 cup curd \n\n1 ಕಪ್ ಅಕ್ಕಿ + 2 ಗೋಧಿ ದೋಸೆ + 1/2 ಕಪ್ ರಾಜ್ಮಾ ಕರಿ + 1/2 ಕಪ್ ಸೊಪ್ಪಿನ ಸಾಂಬಾರ್ + 1/2 ಕಪ್ ಮೊಸರು",
    evening: "1 fist of roasted nuts (peanuts, almonds, cashews) + 1 glass milk or tea \n\n1 ಹಿಡಿ ಉರಿದ ತೊಗರಿ ಬೇಳೆ + 1 ಗ್ಲಾಸ್ ಹಾಲು ಅಥವಾ ಚಹಾ",
    dinner: "1.5 cup rice + 1/2 cup methi buttermilk + 1/2 cup greens sambar \n\n1.5 ಕಪ್ ಅಕ್ಕಿ + 1/2 ಕಪ್ ಮೆಂತ್ಯೆ ಮಜ್ಜಿಗೆ + 1/2 ಕಪ್ ಸೊಪ್ಪಿನ ಸಾಂಬಾರ್",
    bedTime: "Turmeric Milk (150ml) \n\nಅರಿಶಿನ ಹಾಲು (150ml)",
  ),
  MealPlan(
    day: "Day 04 / ದಿನ 04",
    breakfast: "Broken wheat khichdi with vegetables - 1.5 cup + 2 tsp coconut chutney \n\nಗೋಧಿ ಕಿಚ್ಚಡಿ 1.5 ಕಪ್ + 2 ಚಮಚ ಚಟ್ನಿ",
    midMeal: "1 glass milk \n\n1 ಗ್ಲಾಸ್ ಹಾಲು",
    lunch: "2 ragi dosa + 1/2 cup rice + 1/2 cup dal + 1/2 cup green peas curry + 1/2 cup curd \n\n2 ರಾಗಿ ದೋಸೆ + 1/2 ಕಪ್ ಅಕ್ಕಿ + 1/2 ಕಪ್ ಬೇಳೆ + 1/2 ಕಪ್ ಬಟಾಣಿ ಕರಿ + 1/2 ಕಪ್ ಮೊಸರು",
    evening: "1 glass date milkshake (7 dates + 150ml milk) \n\n1 ಗ್ಲಾಸ್ ಕರ್ಜೂರ ಮಿಲ್ಕ್‌ಶೇಕ್ (7 ಕರ್ಜೂರ + 150ml ಹಾಲು)",
    dinner: "1 cup rice + 1/2 cup green peas curry \n\n1 ಕಪ್ ಅಕ್ಕಿ + 1/2 ಕಪ್ ಬಟಾಣಿ ಕರಿ",
    bedTime: "1 glass milk (150ml) \n\n1 ಗ್ಲಾಸ್ ಹಾಲು (150ml)",
  ),
  MealPlan(
    day: "Day 05 / ದಿನ 05",
    breakfast: "Vegetable upma - 1 cup \n\nತರಕಾರಿ ಉಪ್ಪಿಟ್ಟು 1 ಕಪ್",
    midMeal: "1 glass milk \n\n1 ಗ್ಲಾಸ್ ಹಾಲು",
    lunch: "1 cup rice + 2 moong dal dosa + 1/2 cup mixed veg sambar + 1/2 cup methi paneer curry + 1/2 cup curd \n\n1 ಕಪ್ ಅಕ್ಕಿ + 2 ಹಸಿರುಬೇಳೆ ದೋಸೆ + 1/2 ಕಪ್ ಮಿಶ್ರ ಸಾಂಬಾರ್ + 1/2 ಕಪ್ ಮೆಂತ್ಯೆ ಪನೀರ್ ಕರಿ + 1/2 ಕಪ್ ಮೊಸರು",
    evening: "Boiled Chana chaat - 1 cup + 1 glass milk \n\nಬೇಯಿಸಿದ ಕಡಲೆಕಾಯಿ ಚಾಟ್ 1 ಕಪ್ + 1 ಗ್ಲಾಸ್ ಹಾಲು",
    dinner: "1.5 cup rice + 1/2 cup rasam + 1/2 cup mixed veg sambar \n\n1.5 ಕಪ್ ಅಕ್ಕಿ + 1/2 ಕಪ್ ರಸಂ + 1/2 ಕಪ್ ಮಿಶ್ರ ಸಾಂಬಾರ್",
    bedTime: "Turmeric Milk (150ml) \n\nಅರಿಶಿನ ಹಾಲು (150ml)",
  ),
  MealPlan(
    day: "Day 06 / ದಿನ 06",
    breakfast: "1 cup Millets upma + omelette - 2 + 1 glass milk \n\nಸಿರಿಧಾನ್ಯ ಉಪ್ಪಿಟ್ಟು 1 ಕಪ್ + 2 ಮೊಟ್ಟೆ + 1 ಗ್ಲಾಸ್ ಹಾಲು",
    midMeal: "Boiled green gram sprouts - 1 cup \n\nಬೇಯಿಸಿದ ಹಸಿರು ಕಾಳು ಉಸಲಿ 1 ಕಪ್",
    lunch: "1.5 cup rice + 1/2 cup green gram sambar + 1/2 cup curd \n\n1.5 ಕಪ್ ಅಕ್ಕಿ + 1/2 ಕಪ್ ಹಸಿರು ಕಾಳು ಸಾಂಬಾರ್ + 1/2 ಕಪ್ ಮೊಸರು",
    evening: "1 cup poha (avalakki upma) + 1 glass milk \n\nಅವಲಕ್ಕಿ ಉಪ್ಪಿಟ್ಟು 1 ಕಪ್ + 1 ಗ್ಲಾಸ್ ಹಾಲು",
    dinner: "1 cup rice + 1/2 cup cluster beans (gorikai) sambar \n\n1 ಕಪ್ ಅಕ್ಕಿ + 1/2 ಕಪ್ ಕೊರ್ಲಿ ಸಾಂಬಾರ್",
    bedTime: "1 glass milk (150ml) \n\n1 ಗ್ಲಾಸ್ ಹಾಲು (150ml)",
  ),
  MealPlan(
    day: "Day 07 / ದಿನ 07",
    breakfast: "Vegetable pulao - 1 cup + 2 tsp green chutney \n\nತರಕಾರಿ ಪಲಾವ್ 1 ಕಪ್ + 2 ಚಮಚ ಹಸಿರು ಚಟ್ನಿ",
    midMeal: "1 glass milk \n\n1 ಗ್ಲಾಸ್ ಹಾಲು",
    lunch: "1 cup rice + 1 chapathi + egg curry + 1/2 cup curd \n\n1 ಕಪ್ ಅಕ್ಕಿ + 1 ಚಪಾತಿ + ಮೊಟ್ಟೆ ಕರಿ + 1/2 ಕಪ್ ಮೊಸರು",
    evening: "4 multigrain biscuits + 1 glass milk \n\n4 ಧಾನ್ಯ ಬಿಸ್ಕೆಟ್ + 1 ಗ್ಲಾಸ್ ಹಾಲು",
    dinner: "1.5 cup rice + 1/2 cup methi buttermilk + 1/2 cup horse gram sambar \n\n1.5 ಕಪ್ ಅಕ್ಕಿ + 1/2 ಕಪ್ ಮೆಂತ್ಯೆ ಮಜ್ಜಿಗೆ + 1/2 ಕಪ್ ಕುರುಹು ಸಾಂಬಾರ್",
    bedTime: "Turmeric Milk (150ml) \n\nಅರಿಶಿನ ಹಾಲು (150ml)",
  ),

];

