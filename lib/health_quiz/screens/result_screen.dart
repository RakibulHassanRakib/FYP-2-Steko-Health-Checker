// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:steko_health_checker/botton%20navigation%20bar/main_page.dart';
import 'package:steko_health_checker/health_quiz/screens/quizz_screen.dart';

import '../ui/shared/color.dart';

// ignore: must_be_immutable
class ResultScreen extends StatefulWidget {
  int score;
  ResultScreen(this.score, {Key key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pripmaryColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Congratulations",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 45.0,
            ),
            const Center(
              child: Text(
                "You Score is",
                style: TextStyle(color: Colors.white, fontSize: 34.0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                "${widget.score}",
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 85.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizzScreen(),
                    ));
              },
              color: AppColor.secondaryColor,
              padding: const EdgeInsets.all(18.0),
              child: const Text(
                "Reapeat the quizz",
                style: TextStyle(color: Colors.amberAccent),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ));
              },
              color: AppColor.secondaryColor,
              padding: const EdgeInsets.all(18.0),
              child: const Text(
                "Back To Home",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
