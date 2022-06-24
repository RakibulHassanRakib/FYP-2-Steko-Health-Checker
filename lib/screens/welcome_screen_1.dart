import 'package:flutter/material.dart';
import 'package:steko_health_checker/custom%20route/scale_route.dart';
import 'package:steko_health_checker/screens/log_in_screen.dart';
import '../constraints.dart';
import '../custom route/slide_right_route.dart';
import '../widgets/welcome.dart';
import 'welcome_screen_2.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WelcomeScreen1 extends StatelessWidget {
  static const id = '/welcome-screen-1';

  const WelcomeScreen1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {},
          onHorizontalDragUpdate: (details) {
            // Note: Sensitivity is integer used when you don't want to mess up vertical drag
            int sensitivity = 1;
            if (details.delta.dx > sensitivity) {
              // Right Swipe
              return;
            } else if (details.delta.dx < -sensitivity) {
              //Left Swipe
              Navigator.push(
                  context, SlideRightRoute(page: const WelcomeScreen2()));
            }
          },
          child: Welcome(
            title: 'Update Health Status',
            description:
                'Update your health status on a daily basis to receive feedback from doctors. ',
            heroImageURL: 'assets/images/welcome1.png',
            indictator: Row(
              children: [
                Hero(
                  tag: 'indicator',
                  child: Container(
                    height: 4.0,
                    width: 22.0,
                    decoration: BoxDecoration(
                        gradient: kGreenGradientColor,
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
                  width: 11.0,
                  decoration: BoxDecoration(
                      color: const Color(0xFF4BB845).withOpacity(0.20),
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ],
            ),
            nextButton: Hero(
              tag: 'nextBtn',
              child: CircularPercentIndicator(
                radius: 32.0,
                lineWidth: 2.0,
                percent: 0.33,
                center: Container(
                  child: const Icon(
                    Icons.chevron_right_outlined,
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
              Navigator.push(
                context,
                SlideRightRoute(
                  page: const WelcomeScreen2(),
                ),
              );
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
