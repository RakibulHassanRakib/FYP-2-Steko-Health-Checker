import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BlcScreen extends StatefulWidget {
  const BlcScreen({Key key}) : super(key: key);

  @override
  State<BlcScreen> createState() => _BlcScreenState();
}

class _BlcScreenState extends State<BlcScreen> {
  final myUserId = FirebaseAuth.instance.currentUser.uid;

  @override
  void initState() {
    super.initState();
    getCaloriesIntakeData();
    sleeptracker();
    bloodSugar();
    //getData();
  }

  var date = DateTime.now();

  double totalSleepHr;

  sleeptracker() async {
    var sleepHr = await FirebaseFirestore.instance
        .collection('SleepTracker')
        .doc(user.uid)
        .collection('weeklyData')
        .doc(DateFormat('EEE').format(date))
        .get();

    if (sleepHr.data()['value'] as double != null) {
      totalSleepHr = sleepHr.data()['value'] as double;
    } else {
      totalSleepHr = 0;
    }
  }

  double blodSugarLevel;

  bloodSugar() async {
    var bloodSugar = await FirebaseFirestore.instance
        .collection('BloodSugar')
        .doc(user.uid)
        .collection('weeklyData')
        .doc(DateFormat('EEE').format(date))
        .get();

    setState(() {
      blodSugarLevel = bloodSugar.data()['value'];
    });
  }

  int totalCal;
  int breakFast = 0;
  int lunch = 0;
  int dinner = 0;

  final user = FirebaseAuth.instance.currentUser;

  getCaloriesIntakeData() async {
    var resultBreak = await FirebaseFirestore.instance
        .collection('CaloriesIntake')
        .doc(user.uid)
        .collection('Breakfast')
        .doc('t')
        .get();



    setState(() {
      if (resultBreak.data()['caloriesIntake'] as int != null) {
        breakFast = resultBreak.data()['caloriesIntake'] as int;
      }


      totalCal = breakFast + lunch + dinner;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 315,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    height: 275,
                    width: 15,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8F8),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: FAProgressBar(
                      borderRadius: BorderRadius.circular(30.0),
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.up,
                      currentValue:
                          blodSugarLevel == null ? 0 : blodSugarLevel * 10,
                      progressColor: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    width: .0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Blood Sugar',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1D242A),
                        ),
                      ),
                      Text(
                        '$blodSugarLevel',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: <Color>[
                                Color(0xFF8BBC45),
                                Color(0xFF4BB845),
                                //add more color here.
                              ],
                            ).createShader(
                              const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
                            ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/graphbar.png',
                        scale: 1.8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Last Night Sleep',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1D242A),
                          ),
                        ),
                        Text(
                          '$totalSleepHr hr',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: <Color>[
                                  Color(0xFF8BBC45),
                                  Color(0xFF4BB845),
                                  //add more color here.
                                ],
                              ).createShader(
                                const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
                              ),
                          ),
                        ),
                        Center(
                          child: Image.asset(
                            'assets/images/Vector-sleep.png',
                            scale: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Calories Intake',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1D242A),
                          ),
                        ),
               
                        Center(
                          child: CircularPercentIndicator(
                            radius: 40.0,
                            lineWidth: 5.0,
                            percent: 0.4,
                            backgroundColor:
                                const Color(0xFF4BB845).withOpacity(0.1),
                            progressColor: const Color(0xFF4BB845),
                            center: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$totalCal \n',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 8.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    'kCal',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 8.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              height: 64,
                              width: 64,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFF8BBC45),
                                    Color(0xFF4BB845),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
