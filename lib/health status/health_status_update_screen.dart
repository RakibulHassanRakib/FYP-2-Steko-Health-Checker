// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:steko_health_checker/constraints.dart';

import '../widgets/custom_elevated_button_gradient.dart';
import 'health.dart';

class HealthStatusScreen extends StatefulWidget {
  const HealthStatusScreen({Key key}) : super(key: key);

  @override
  State<HealthStatusScreen> createState() => _HealthStatusScreenState();
}

class _HealthStatusScreenState extends State<HealthStatusScreen> {
  final myUserId = FirebaseAuth.instance.currentUser.uid;
  TextEditingController nameController = TextEditingController();
  TextEditingController bodyTempController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String _selectedFeeling;
  String _selectedThroat;
  String _selectedCough;
  String _selectedFatigen;
  String _selectedBrith;
  String _selectedFever;
  String _selectedSuspect;

  var date = DateTime.now();

  Future<bool> alertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Done'),
            content: const Text(' ✔ Submitted ',
                style: TextStyle(
                  color: Colors.green,
                )),
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
            title: const Text('Failed'),
            content: const Text('Enter All Details ',
                style: TextStyle(
                  color: Colors.red,
                )),
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
              'Update Health Status',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: kGreenGradientColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Enter your Personal details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Health(
                          controller: nameController,
                          obscureText: false,
                          title: 'Name',
                          textInputType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Health(
                          controller: ageController,
                          obscureText: false,
                          title: 'Age',
                          textInputType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Health(
                          controller: bodyTempController,
                          obscureText: false,
                          title: 'Body Temperature ℃',
                          textInputType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Health(
                          controller: phoneController,
                          obscureText: false,
                          title: 'Phone Number',
                          textInputType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //2nd
                Container(
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: kGreenGradientColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'How are you feeling today?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '😀',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'Happy',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'happy',
                            activeColor: Colors.white,
                            groupValue: _selectedFeeling,
                            onChanged: (value) {
                              setState(() {
                                _selectedFeeling = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '😭',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'Sad',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'sad',
                            activeColor: Colors.white,
                            groupValue: _selectedFeeling,
                            onChanged: (value) {
                              setState(() {
                                _selectedFeeling = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '😔',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'Not Sure',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'not sure',
                            activeColor: Colors.white,
                            groupValue: _selectedFeeling,
                            onChanged: (value) {
                              setState(() {
                                _selectedFeeling = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ////
                ///
                ///
                ///
                const SizedBox(
                  height: 10,
                ),
                //2nd
                Container(
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: kGreenGradientColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Do you feel a sore throat?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'yes',
                            activeColor: Colors.white,
                            groupValue: _selectedThroat,
                            onChanged: (value) {
                              setState(() {
                                _selectedThroat = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'no',
                            activeColor: Colors.white,
                            groupValue: _selectedThroat,
                            onChanged: (value) {
                              setState(() {
                                _selectedThroat = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                //2nd
                Container(
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: kGreenGradientColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Do you feel cough and sputum production?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'yes',
                            activeColor: Colors.white,
                            groupValue: _selectedCough,
                            onChanged: (value) {
                              setState(() {
                                _selectedCough = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'no',
                            activeColor: Colors.white,
                            groupValue: _selectedCough,
                            onChanged: (value) {
                              setState(() {
                                _selectedCough = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                //2nd
                Container(
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: kGreenGradientColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Do you feel fatigue?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'yes',
                            activeColor: Colors.white,
                            groupValue: _selectedFatigen,
                            onChanged: (value) {
                              setState(() {
                                _selectedFatigen = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'no',
                            activeColor: Colors.white,
                            groupValue: _selectedFatigen,
                            onChanged: (value) {
                              setState(() {
                                _selectedFatigen = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                //2nd
                Container(
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: kGreenGradientColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Do you feel short or breath or difficulty breating?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'yes',
                            activeColor: Colors.white,
                            groupValue: _selectedBrith,
                            onChanged: (value) {
                              setState(() {
                                _selectedBrith = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'no',
                            activeColor: Colors.white,
                            groupValue: _selectedBrith,
                            onChanged: (value) {
                              setState(() {
                                _selectedBrith = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                //2nd
                Container(
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: kGreenGradientColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Have you had fever for more than three days >37.8 °C?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'yes',
                            activeColor: Colors.white,
                            groupValue: _selectedFever,
                            onChanged: (value) {
                              setState(() {
                                _selectedFever = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'no',
                            activeColor: Colors.white,
                            groupValue: _selectedFever,
                            onChanged: (value) {
                              setState(() {
                                _selectedFever = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                //2nd
                Container(
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: kGreenGradientColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Have you had fever for more than three days >37.8 °C?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'yes',
                            activeColor: Colors.white,
                            groupValue: _selectedFever,
                            onChanged: (value) {
                              setState(() {
                                _selectedFever = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'no',
                            activeColor: Colors.white,
                            groupValue: _selectedFever,
                            onChanged: (value) {
                              setState(() {
                                _selectedFever = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                //2nd
                Container(
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: kGreenGradientColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Have you had anu contact with anyone who has been diagnosed or suspected of the new coronavirus?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'yes',
                            activeColor: Colors.white,
                            groupValue: _selectedSuspect,
                            onChanged: (value) {
                              setState(() {
                                _selectedSuspect = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        child: ListTile(
                          iconColor: Colors.white,
                          style: ListTileStyle.list,
                          leading: const Text(
                            '',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: const Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio<String>(
                            value: 'no',
                            activeColor: Colors.white,
                            groupValue: _selectedSuspect,
                            onChanged: (value) {
                              setState(() {
                                _selectedSuspect = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButtonGradient(
                  width: double.infinity,
                  onPressed: () {
                    if (nameController != null &&
                        ageController != null &&
                        bodyTempController != null &&
                        phoneController != null &&
                        _selectedFeeling != null &&
                        _selectedBrith != null &&
                        _selectedCough != null &&
                        _selectedFatigen != null &&
                        _selectedFever != null &&
                        _selectedSuspect != null &&
                        _selectedThroat != null) {
                      FirebaseFirestore.instance
                          .collection("HealthStatusUpdate")
                          .doc(myUserId)
                          .collection(DateFormat('yyyy-MM-dd').format(date))
                          .add({
                        "nameController": nameController.text,
                        "bodyTempController": bodyTempController.text,
                        "ageController": ageController.text,
                        "phoneController": phoneController.text,
                        "selectedFeeling": _selectedFeeling,
                        "selectedThroat": _selectedThroat,
                        "selectedCough": _selectedCough,
                        "selectedFatigen": _selectedFatigen,
                        "selectedBrith": _selectedBrith,
                        "selectedFever": _selectedFever,
                        "selectedSuspect": _selectedSuspect,
                      });

                      alertDialog(context);
                      // Navigator.push(
                      //   context,
                      //   SlideRightRoute(
                      //     page: const MainPage(),
                      //   ),
                      // );

                    } else {
                      redAlertDialog(context);
                    }
                  },
                  borderRadius: BorderRadius.circular(4.0),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  height: 62.0,
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
