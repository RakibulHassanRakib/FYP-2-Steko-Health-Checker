// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../widgets/custom_elevated_button_gradient.dart';
import 'calculate_bmi.dart';
import 'result_page.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Future<bool> redAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Failed'),
            content: const Text('Enter all values ',
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

  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  bool colorCheckM = false;
  bool colorCheckF = false;
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
              'Calculate BMI',
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
                Image.asset(
                  'assets/images/undraw_Calculator_re_alsc.png',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          colorCheckM = true;
                          colorCheckF = false;
                        });
                      },
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: colorCheckM == false
                              ? Colors.white
                              : Colors.green,
                        ),
                        child: Icon(
                          Icons.male,
                          size: 100.0,
                          color: colorCheckM == false
                              ? const Color(0xFF70BA45)
                              : Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          colorCheckF = true;
                          colorCheckM = false;
                        });
                      },
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: colorCheckF == false
                              ? Colors.white
                              : Colors.green,
                        ),
                        child: Icon(
                          Icons.female,
                          color: colorCheckF == false
                              ? const Color(0xFFE8C946)
                              : Colors.white,
                          size: 100.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter Your Age (Y)",
                      labelStyle: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xFF8B8B8B),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextField(
                    controller: heightController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter Your Height (CM)",
                      labelStyle: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xFF8B8B8B),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextField(
                    controller: weightController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter Your Weight (KG)",
                      labelStyle: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xFF8B8B8B),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomElevatedButtonGradient(
                  width: double.infinity,
                  onPressed: () {
                    if (heightController.text.isNotEmpty &&
                        weightController.text.isNotEmpty) {
                      CalculateBMI calc = CalculateBMI(
                          height: int.parse(heightController.text),
                          weight: int.parse(weightController.text));

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          ),
                        ),
                      );
                    } else {
                      redAlertDialog(context);
                    }
                  },
                  borderRadius: BorderRadius.circular(4.0),
                  child: const Text(
                    'Calculate',
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
