// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:steko_health_checker/constraints.dart';
import '../widgets/custom_elevated_button_gradient.dart';

class CaloriesIntake extends StatefulWidget {
  const CaloriesIntake({Key key}) : super(key: key);

  @override
  State<CaloriesIntake> createState() => _CaloriesIntakeState();
}

class _CaloriesIntakeState extends State<CaloriesIntake> {
  final myUserId = FirebaseAuth.instance.currentUser.uid;

  @override
  void initState() {
    super.initState();
  }

  automaticallyAdd() {}

  Future<bool> alertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Done'),
            content: const Text(' ✔ Added Successfully ',
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
            content: const Text('☓ Invalid Entry ',
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

  // This will be displayed below the autocomplete field
  String _selectedAnimal;
  int caloriesIntake;
  String foodName;
  String mealTime;

  // This list holds all the suggestions
  final List<String> _suggestions = [
    'Nasi Goreng 388 Cal',
    'Nasi Lemak 400 Cal',
  ];

  String _groupValue = '';

  void checkRadio(String value) {
    setState(() {
      _groupValue = value;
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
              'Calories Intake',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Add Meal Details',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Search Food',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Autocomplete<String>(
                        optionsBuilder: (TextEditingValue value) {
                          // When the field is empty
                          if (value.text.isEmpty) {
                            return [];
                          }

                          // The logic to find out which ones should appear
                          return _suggestions.where((suggestion) => suggestion
                              .toLowerCase()
                              .contains(value.text.toLowerCase()));
                        },
                        onSelected: (value) {
                          setState(() {
                            _selectedAnimal = value;

                            if (_selectedAnimal == 'Nasi Goreng 388 Cal') {
                              caloriesIntake = 388;
                              foodName = "Nasi Goreng";
                            } else if (_selectedAnimal ==
                                'Nasi Lemak 400 Cal') {
                              caloriesIntake = 400;
                              foodName = "Nasi Lemak";
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: foodName ?? 'Food Name',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 61, 61, 61),
                            fontSize: 15.0,
                          ),
                          prefixIcon:
                              const Icon(Icons.restaurant, color: Colors.green),
                          suffixIcon: Container(
                            width: 100,
                            child: Center(
                              child: caloriesIntake == null
                                  ? const Text(
                                      '00 Calories',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : Text(
                                      '$caloriesIntake Calories',
                                      style: const TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                            ),
                            decoration: BoxDecoration(
                              gradient: kGreenGradientColor,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    
                    const SizedBox(
                      height: 20.0,
                    ),
                    
                    Center(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text('Breakfast'),
                            leading: Radio(
                                activeColor: Colors.green,
                                value: 'Breakfast',
                                groupValue: _groupValue,
                                onChanged: (value) {
                                  checkRadio(value as String);
                                }),
                          ),
                          ListTile(
                            title: const Text('Lunch'),
                            leading: Radio(
                                activeColor: Colors.green,
                                value: 'Lunch',
                                groupValue: _groupValue,
                                onChanged: (value) {
                                  checkRadio(value as String);
                                }),
                          ),
                          ListTile(
                            title: const Text('Dinner'),
                            leading: Radio(
                                activeColor: Colors.green,
                                value: 'Dinner',
                                groupValue: _groupValue,
                                onChanged: (value) {
                                  checkRadio(value as String);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                CustomElevatedButtonGradient(
                  width: double.infinity,
                  onPressed: () {
                    if (caloriesIntake != null && _groupValue != null) {
                      FirebaseFirestore.instance
                          .collection("CaloriesIntake")
                          .doc(myUserId)
                          .collection(_groupValue)
                          .doc('t')
                          .set({
                        "caloriesIntake": caloriesIntake,
                      });

                      alertDialog(context);
                    } else {
                      redAlertDialog(context);
                    }
                  },
                  borderRadius: BorderRadius.circular(4.0),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  height: 62.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
