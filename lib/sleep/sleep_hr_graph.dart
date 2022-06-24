import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/graph/common widgets/bottom_bar.dart';
import '../widgets/graph/common widgets/single_tile_graph.dart';
import '../widgets/graph/common widgets/top_bar.dart';

class SleepHourGraph extends StatefulWidget {
  const SleepHourGraph({Key key}) : super(key: key);

  @override
  SleepHourGraphState createState() => SleepHourGraphState();
}

class SleepHourGraphState extends State<SleepHourGraph> {
  final myUserId = FirebaseAuth.instance.currentUser.uid;

  var date = DateTime.now();

  double totalSleepHr;

  @override
  void initState() {
    super.initState();
    sleeptracker();
  }

  sleeptracker() async {
    var sleepHr = await FirebaseFirestore.instance
        .collection('SleepTracker')
        .doc(myUserId)
        .collection('weeklyData')
        .doc(DateFormat('EEE').format(date))
        .get();

    setState(() {
      totalSleepHr = sleepHr.data()['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return totalSleepHr == null
        ? const CircularProgressIndicator()
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.00),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const TopBar(title: 'Sleep Hour'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SingleTileGraph(
                    maximum: 20,
                    minimum: 1,
                    interval: 2,
                    val: totalSleepHr,
                  ),
                  const BottomBar(text1: 'Normal', text2: 'Over Weight'),
                ],
              ),
            ),
          );
  }
}

// ignore: unused_element
class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
