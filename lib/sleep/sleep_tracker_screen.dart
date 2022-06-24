import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:steko_health_checker/constraints.dart';

import 'sleep_hr_graph.dart';

class SleepTrackerScreen extends StatefulWidget {
  const SleepTrackerScreen({Key key}) : super(key: key);

  @override
  State<SleepTrackerScreen> createState() => _SleepTrackerScreenState();
}

class _SleepTrackerScreenState extends State<SleepTrackerScreen> {
  final myUserId = FirebaseAuth.instance.currentUser.uid;
  var date = DateTime.now();
  TextEditingController sleepRateController = TextEditingController();
  double sleepTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Sleep Tracker',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Column(
              children: [
                
                const SizedBox(
                  height: 10.0,
                ),
                const SleepHourGraph(),
                const SizedBox(
                  height: 10.0,
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    
                    SizedBox(
                      height: 8,
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Builder(
          builder: (BuildContext context) => FloatingActionButton.extended(
            onPressed: () async {
              var resultingDuration = await showDurationPicker(
                decoration: const BoxDecoration(
                  gradient: kGreenGradientColor,
                  color: Colors.white,
                  backgroundBlendMode: BlendMode.colorBurn,
                ),
                context: context,
                initialTime: const Duration(hours: 7),
              );

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Duration : ${resultingDuration.inHours}')));

              FirebaseFirestore.instance
                  .collection("SleepTracker")
                  .doc(myUserId)
                  .collection('weeklyData')
                  .doc(DateFormat('EEE').format(date))
                  .set({
                "value": resultingDuration.inHours.toDouble(),
              });
              Navigator.of(context).pop();
            },
            tooltip: 'Popup Duration Picker',
            label: const Text('Add Bed Time'),
            backgroundColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
