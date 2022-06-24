import 'package:flutter/material.dart';
import '../constraints.dart';
import '../custom route/scale_route.dart';
import '../custom route/slide_left_route.dart';
import '../widgets/welcome.dart';
import 'log_in_screen.dart';
import 'welcome_screen_2.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WelcomeScreen3 extends StatelessWidget {
  static const id = '/welcome-screen-3';

  const WelcomeScreen3({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onHorizontalDragUpdate: (details) {
            // Note: Sensitivity is integer used when you don't want to mess up vertical drag
            int sensitivity = 1;
            if (details.delta.dx > sensitivity) {
              // Right Swipe
              Navigator.push(
                  context, SlideLeftRoute(page: const WelcomeScreen2()));
            } else if (details.delta.dx < -sensitivity) {
              //Left Swipe
              return;
            }
          },
          child: Welcome(
            title: 'Track Progress',
            description:
                'Progress is progress, no matter how small. Don’t forget to check your progress report to see how things are going so far. ',
            heroImageURL: 'assets/images/welcome3.png',
            indictator: Row(
              children: [
                Hero(
                  tag: 'indicator',
                  child: Container(
                    height: 4.0,
                    width: 11.0,
                    decoration: BoxDecoration(
                        color: const Color(0xFF4BB845).withOpacity(0.20),
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 4.0,
                  width: 11.0,
                  decoration: BoxDecoration(
                      color: const Color(0xFF4BB845).withOpacity(0.20),
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 4.0,
                  width: 22.0,
                  decoration: BoxDecoration(
                      gradient: kGreenGradientColor,
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ],
            ),
            nextButton: Hero(
              tag: 'nextBtn',
              child: CircularPercentIndicator(
                radius: 32.0,
                lineWidth: 2.0,
                percent: 1.0,
                center: Container(
                  child: const Icon(
                    Icons.done_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    gradient: kGreenGradientColor,
                  ),
                ),
                backgroundColor: const Color.fromARGB(255, 250, 243, 243),
                progressColor: const Color(0xFF8BBC45),
              ),
            ),
            navigatorNextPageOnTap: () {
              Navigator.push(context, ScaleRoute(page: const LogIn()));
            },
            skipButtonOnTap: () {
              Navigator.push(context, ScaleRoute(page: const LogIn()));
            },
          ),
        ),
      ),
    );
  }
}
