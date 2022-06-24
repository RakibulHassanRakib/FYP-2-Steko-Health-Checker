import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'common widgets/bottom_bar.dart';
import 'common widgets/multi_tile_graph.dart';
import 'common widgets/top_bar.dart';

class BloodPressure extends StatefulWidget {
  const BloodPressure({Key key}) : super(key: key);

  @override
  BloodPressureState createState() => BloodPressureState();
}

class BloodPressureState extends State<BloodPressure> {
  final myUserId = FirebaseAuth.instance.currentUser.uid;

  var date = DateTime.now();

  double dia;
  double sys;

  @override
  void initState() {
    super.initState();
    bloodPressure();
  }

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
    return dia == null
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
                  const TopBar(title: 'Blood Pressure'),
                  MultiTileGraph(val1: dia, val2: sys),
                  const BottomBar(text1: 'DIA', text2: 'SYS'),
                ],
              ),
            ));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final String x;
  final double y;
  final double y1;
}
