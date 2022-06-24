import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'common widgets/single_tile_graph.dart';
import 'common widgets/top_bar.dart';

class BloodSugar extends StatefulWidget {
  const BloodSugar({Key key}) : super(key: key);

  @override
  BloodSugarState createState() => BloodSugarState();
}

class BloodSugarState extends State<BloodSugar> {
  final myUserId = FirebaseAuth.instance.currentUser.uid;
  var date = DateTime.now();
  double val;

  @override
  void initState() {
    super.initState();
    gBloodSugarData();
  }

  gBloodSugarData() async {
    var resultSat = await FirebaseFirestore.instance
        .collection('BloodSugar')
        .doc(myUserId)
        .collection('weeklyData')
        .doc(DateFormat('EEE').format(date))
        .get();

    setState(() {
      val = resultSat.data()['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return val == null
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
                  const TopBar(title: 'Blood Sugar'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SingleTileGraph(
                      val: val, interval: 20, maximum: 120, minimum: 0),
                  //const BottomBar(text1: 'Normal', text2: 'Over Weight'),
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
