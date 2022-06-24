import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:steko_health_checker/bmi/reusable_card.dart';
import '../widgets/custom_elevated_button_gradient.dart';
import 'bmi_c.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage(
      {Key key, this.resultText, this.interpretation, this.bmiResult})
      : super(key: key);
  final String resultText;
  final double bmiResult;
  final String interpretation;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final myUserId = FirebaseAuth.instance.currentUser.uid;
  var date = DateTime.now();
  @override
  Future<void> initState() async {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    final docWriteBMI =
        FirebaseFirestore.instance.collection("BMI").doc(myUserId);

    final bmiResult = BMI_C(
      bmi: widget.bmiResult.roundToDouble(),
      comment: widget.interpretation,
      result: widget.resultText,
    );

    final json = bmiResult.toJson();

    docWriteBMI.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Result',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(15.0),
                child: const Center(
                  child: (Text(
                    "Your Result",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black87,
                    ),
                  )),
                )),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                card_child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        widget.resultText.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      widget.bmiResult.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 75,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.interpretation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(),
                    ),
                  ],
                ),
                colour: null,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: (CustomElevatedButtonGradient(
              width: double.infinity,
              onPressed: () {
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(4.0),
              child: const Text(
                'Re-calculate',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              height: 62.0,
            )),
          ),
        ],
      ),
    );
  }
}
