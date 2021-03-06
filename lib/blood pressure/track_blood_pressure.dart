// ignore_for_file: unnecessary_new, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:steko_health_checker/constraints.dart';
import 'package:steko_health_checker/more/more_feature_screen.dart';
import '../custom route/slide_right_route.dart';
import '../main.dart';
import '../widgets/graph/blood_pressure.dart';

showNotification() async {
  // ignore: prefer_const_constructors
  var android = AndroidNotificationDetails('channel id', 'channel NAME',
      priority: Priority.high, importance: Importance.max);
  var platform = NotificationDetails(android: android);
  await flutterLocalNotificationsPlugin.show(
      0, 'Alert from Steko health Checker', 'Blood Pressure. ', platform,
      payload:
          'Your blood Pressure is Not Normal, make an appointment to see a health care provider. ');
}

class TrackBloodPressure extends StatefulWidget {
  const TrackBloodPressure({Key key}) : super(key: key);

  @override
  State<TrackBloodPressure> createState() => _TrackBloodPressureState();
}

class _TrackBloodPressureState extends State<TrackBloodPressure> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');

    var initSetttings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  // ignore: missing_return
  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Notification'),
        content: Text(payload),
      ),
    );
  }

  TextEditingController bloodPressureControllerDIA = TextEditingController();
  TextEditingController bloodPressureControllerSYS = TextEditingController();

  final myUserId = FirebaseAuth.instance.currentUser.uid;

  var date = DateTime.now();

  Future<bool> greenAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Done'),
            content: const Text(
              '??? Added Successfully',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Future<bool> redAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Faild'),
            content: const Text(
              ' Invalid',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

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
              'Track Blood Pressure',
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
                const BloodPressure(),
                const SizedBox(
                  height: 10.0,
                ),
                
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Records',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6F1E5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Alert(
                                    context: context,
                                    title: "Blood Pressure",
                                    content: Column(
                                      children: <Widget>[
                                        TextField(
                                          controller:
                                              bloodPressureControllerDIA,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            labelText: 'Enter DIA',
                                          ),
                                        ),
                                        TextField(
                                          controller:
                                              bloodPressureControllerSYS,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            labelText: 'Enter SYS',
                                          ),
                                        ),
                                      ],
                                    ),
                                    buttons: [
                                      DialogButton(
                                        gradient: kGreenGradientColor,
                                        onPressed: () async {
                                          if (bloodPressureControllerDIA
                                              .text.isNotEmpty) {
                                            if (double.parse(
                                                        bloodPressureControllerSYS
                                                            .text) >
                                                    120 &&
                                                double.parse(
                                                        bloodPressureControllerDIA
                                                            .text) >
                                                    80) {
                                              showNotification();
                                            }

                                            FirebaseFirestore.instance
                                                .collection("BloodPressure")
                                                .doc(myUserId)
                                                .collection('weeklyData')
                                                .doc(DateFormat('EEE')
                                                    .format(date))
                                                .set({
                                              "dia": double.parse(
                                                  bloodPressureControllerDIA
                                                      .text),
                                              "sys": double.parse(
                                                  bloodPressureControllerSYS
                                                      .text),
                                            });

                                            setState(() {});
                                            Navigator.of(context).pop();
                                            Navigator.push(
                                              context,
                                              SlideRightRoute(
                                                page: MoreFeatureScreen(),
                                              ),
                                            );

                                            greenAlertDialog(context);
                                          } else {
                                            redAlertDialog(context);
                                          }
                                        },
                                        child: const Text(
                                          "ADD",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )
                                    ]).show();
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  gradient: kGreenGradientColor,
                                  shape: BoxShape.circle,
                                ),
                                child:
                                    const Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('Blood Pressure',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF1D1617),
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
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
