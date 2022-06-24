// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:steko_health_checker/constraints.dart';
import 'package:steko_health_checker/more/more_feature_screen.dart';
import '../custom route/slide_right_route.dart';
import '../main.dart';
import '../widgets/graph/heart_rate.dart';
import 'package:intl/intl.dart';

showNotification() async {
  // ignore: prefer_const_constructors
  var android = AndroidNotificationDetails('channel id', 'channel NAME',
      priority: Priority.high, importance: Importance.max);
  var platform = NotificationDetails(android: android);
  await flutterLocalNotificationsPlugin.show(0,
      'Alert from Steko health Checker', 'Heart rate is too high. ', platform,
      payload:
          'Your heart rate is Not Normal, make an appointment to see a health care provider. ');
}

class CountHeartRateDetails extends StatefulWidget {
  const CountHeartRateDetails({Key key}) : super(key: key);

  @override
  State<CountHeartRateDetails> createState() => _CountHeartRateDetailsState();
}

class _CountHeartRateDetailsState extends State<CountHeartRateDetails> {
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

  final myUserId = FirebaseAuth.instance.currentUser.uid;

  // ignore: non_constant_identifier_names
  TextEditingController HeartRateController = TextEditingController();

  var date = DateTime.now();

  

  Future<bool> greenAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Done'),
            content: const Text(
              '✓ Added Successfully',
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
              'Count Heart Rate',
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
                // ignore: prefer_const_constructors
                HeartRate(),
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
                    Container(
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
                                  title: "Heart Rate",
                                  content: Column(
                                    children: <Widget>[
                                      TextField(
                                        controller: HeartRateController,
                                        obscureText: false,
                                        decoration: const InputDecoration(
                                          labelText: 'Enter heart rate',
                                        ),
                                      ),
                                    ],
                                  ),
                                  buttons: [
                                    DialogButton(
                                      gradient: kGreenGradientColor,
                                      onPressed: () async {
                                        if (HeartRateController
                                            .text.isNotEmpty) {
                                          if (double.parse(HeartRateController
                                                      .text) >
                                                  100 ||
                                              double.parse(HeartRateController
                                                      .text) <
                                                  66) {
                                            showNotification();
                                          }

                                          FirebaseFirestore.instance
                                              .collection("HeartRate")
                                              .doc(myUserId)
                                              .collection('weeklyData')
                                              .doc(DateFormat('EEE')
                                                  .format(date))
                                              .set({
                                            "value": double.parse(
                                                HeartRateController.text),
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
                                            color: Colors.white, fontSize: 20),
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
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('Heart Rate',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFF1D1617),
                                fontWeight: FontWeight.w600,
                              )),
                        ],
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
