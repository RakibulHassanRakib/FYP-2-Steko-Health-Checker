import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:steko_health_checker/constraints.dart';
import '../custom route/slide_right_route.dart';
import '../health status/health_status_update_screen.dart';
import '../widgets/blc_card.dart';
import '../widgets/bmi_overview.dart';
import '../widgets/home/hero_section_home_page.dart';

class HomeScreen extends StatefulWidget {
  static const id = '/home-page';

  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myUserId = FirebaseAuth.instance.currentUser.uid;

  var date = DateTime.now();

  double heartRateval;

  @override
  void initState() {
    super.initState();
    heartRate();
    bloodPressure();
  }

  heartRate() async {
    var heartRate = await FirebaseFirestore.instance
        .collection('HeartRate')
        .doc(myUserId)
        .collection('weeklyData')
        .doc(DateFormat('EEE').format(date))
        .get();

    setState(() {
      if (heartRate != null) {
        heartRateval = heartRate.data()['value'];
      } else {
        heartRateval = 0;
      }
    });
  }

  double dia;
  double sys;

  bloodPressure() async {
    var bloodPressure = await FirebaseFirestore.instance
        .collection('BloodPressure')
        .doc(myUserId)
        .collection('weeklyData')
        .doc(DateFormat('EEE').format(date))
        .get();

    setState(() {
      dia = bloodPressure.data()['dia'];
      sys = bloodPressure.data()['sys'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const HeroSectionHomePage(),
            //Bmp_calculator_section_home_page(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: k30pxPaddingHorizontal,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: const Color(0xFFD9EAD3).withOpacity(0.7),
                    ),
                    height: 57.0,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Update today\'s health status'),
                        Container(
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                            gradient: kYelloGradientColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlideRightRoute(
                                  page: const HealthStatusScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Start',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: k30pxPaddingHorizontal,
              child: const Text(
                'Overview',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const BMIOverview(),
            const BlcScreen(),
            const SizedBox(
              height: 10.0,
            ),
            Stack(
              children: [
                Image.asset('assets/images/bmp_hr.png'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  margin: const EdgeInsets.only(top: 55.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$sys / $dia",
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
                          Text(
                            "$heartRateval BPM",
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
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 60.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 17,
                              width: 17,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: kGreenGradientColor,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            const Text(
                              '',
                              style: TextStyle(
                                color: Color(0xFF898484),
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
