import 'package:flutter/material.dart';
import '../widgets/custom_elevated_button_gradient.dart';

class AboutTheApps extends StatelessWidget {
  static const id = '/about-the-app';

  const AboutTheApps({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black54,
          ),
          title: const Text(
            'About The Apps',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16.0,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.2,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  child: const Text(
                    "This application was developed by the KICT department at IIUM.",
                    style: TextStyle(
                      color: Color(0xFF4A4949),
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  CustomElevatedButtonGradient(
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    height: 60.0,
                    borderRadius: BorderRadius.circular(4.0),
                    width: double.infinity,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
