import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../bmi/bmi_calculation_screen.dart';
import '../constraints.dart';
import '../custom route/slide_right_route.dart';

class BMIOverview extends StatefulWidget {
  const BMIOverview({Key key}) : super(key: key);

  @override
  State<BMIOverview> createState() => _BMIOverviewState();
}

class _BMIOverviewState extends State<BMIOverview> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  String result;
  double bmi;

  final user = FirebaseAuth.instance.currentUser;

  getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("BMI").doc(user.uid);

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      // ignore: void_checks
      setState(() {
        if (snapshot.data() != null) {
          result = snapshot.get('result');
          bmi = snapshot.get('bmi');
        } else {
          return const CircularProgressIndicator();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return //stake
        Stack(
      children: [
        Column(
          children: [
            Image.asset('assets/images/Banner.png'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'BMI (Body Mass Index)',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        // ignore: unnecessary_string_interpolations
                        '$result',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 95,
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
                                page: const BMICalculator(),
                              ),
                            );
                          },
                          child: const Text(
                            'Calculate',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset(
                      'assets/images/Banner--Pie-Ellipse.png',
                    ),
                    Text(
                      '$bmi',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
