import 'package:flutter/material.dart';

import '../blood pressure/track_blood_pressure.dart';
import '../blood sugar/track_blood_sugar_details.dart';
import '../bmi/bmi_calculation_screen.dart';
import '../calories intake/calories_intake.dart';
import '../custom route/slide_right_route.dart';
import '../health_quiz/screens/quizz_screen.dart';
import '../heart rate/count_heart_rate_details.dart';
import '../sleep/sleep_tracker_screen.dart';
import '../tips and tricks/tips_and_tricks.dart';
import 'more_collection.dart';

// ignore: must_be_immutable
class MoreFeatureScreen extends StatelessWidget {
  MoreCollection moreCollection = MoreCollection();

  MoreFeatureScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black54,
          ),
          title: const Text(
            'Key Features',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16.0,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.2,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          SlideRightRoute(
                            page: const CountHeartRateDetails(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/images/love.png',
                            scale: 1.3,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFDADA),
                            shape: BoxShape.circle,
                          ),
                        ),
                        title: const Text(
                          'Count Heart Rate',
                          style: TextStyle(
                            color: Color(0xFF1D1617),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    ///
                    const SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          SlideRightRoute(
                            page: const BloodSugarLevel(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/images/blood_sugar.png',
                            scale: 1.3,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xFFD8DEFF),
                            shape: BoxShape.circle,
                          ),
                        ),
                        title: const Text(
                          'Track Blood Sugar',
                          style: TextStyle(
                            color: Color(0xFF1D1617),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    ///
                    const SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          SlideRightRoute(
                            page: const TrackBloodPressure(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/images/blood-pressure.png',
                            scale: 1.3,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFBDADA),
                            shape: BoxShape.circle,
                          ),
                        ),
                        title: const Text(
                          'Track Blood Pressure',
                          style: TextStyle(
                            color: Color(0xFF1D1617),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    ///
                    const SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          SlideRightRoute(
                            page: const CaloriesIntake(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/images/calories_intake.png',
                            scale: 1.3,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xFFD1E6FC),
                            shape: BoxShape.circle,
                          ),
                        ),
                        title: const Text(
                          'Count Calories Intake',
                          style: TextStyle(
                            color: Color(0xFF1D1617),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    ///
                    const SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          SlideRightRoute(
                            page: const BMICalculator(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/images/bmi.png',
                            scale: 1.3,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFD98A),
                            shape: BoxShape.circle,
                          ),
                        ),
                        title: const Text(
                          'Calculate BMI',
                          style: TextStyle(
                            color: Color(0xFF1D1617),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    ///
                    const SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          SlideRightRoute(
                            page: const QuizzScreen(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/images/quiz.png',
                            scale: 1.3,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xFFCAD3F8),
                            shape: BoxShape.circle,
                          ),
                        ),
                        title: const Text(
                          'Fitness Quiz',
                          style: TextStyle(
                            color: Color(0xFF1D1617),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    ///
                    const SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          SlideRightRoute(
                            page: const SleepTrackerScreen(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/images/sleep.png',
                            scale: 1.3,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xFFD7FFD4),
                            shape: BoxShape.circle,
                          ),
                        ),
                        title: const Text(
                          'Sleep Tracker',
                          style: TextStyle(
                            color: Color(0xFF1D1617),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    ///
                    const SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          SlideRightRoute(
                            page: TipsAndTricks(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: const Icon(
                            Icons.tips_and_updates,
                            size: 30,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF111111).withOpacity(0.47),
                            shape: BoxShape.circle,
                          ),
                        ),
                        title: const Text(
                          'Tips & Tricks',
                          style: TextStyle(
                            color: Color(0xFF1D1617),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
