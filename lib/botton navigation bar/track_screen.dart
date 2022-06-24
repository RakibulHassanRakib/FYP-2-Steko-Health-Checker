import 'package:flutter/material.dart';
import '../sleep/sleep_hr_graph.dart';
import '../widgets/graph/blood_pressure.dart';
import '../widgets/graph/blood_sugar.dart';
import '../widgets/graph/heart_rate.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({Key key}) : super(key: key);

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Statistics',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: const [
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  BloodPressure(),
                  SizedBox(
                    height: 10.0,
                  ),
                  BloodSugar(),
                  SizedBox(
                    height: 10.0,
                  ),
                  HeartRate(),
                  SizedBox(
                    height: 10.0,
                  ),
                  SleepHourGraph(),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
