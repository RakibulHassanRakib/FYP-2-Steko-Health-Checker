import 'package:flutter/material.dart';
import '../constraints.dart';
import '../custom route/slide_right_route.dart';
import '../widgets/custom_elevated_button.dart';
import 'welcome_screen_1.dart';

class SplashScreen extends StatefulWidget {
  static const id = '/splash-screen';

  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
      upperBound: 1,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: kGreenGradientColor,
          ),
          child: Padding(
            padding: k30pxPaddingHorizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: false,
                  child: Column(
                    children: const [
                      SizedBox(height: 5.0),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: animation.value * 95,
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomElevatedButton(
                      child: const Text(
                        'Get Statred',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                        ),
                      ),
                      bordRadious: 4.0,
                      height: 60.0,
                      color: Colors.white,
                      onPress: () {
                        Navigator.push(context,
                            SlideRightRoute(page: const WelcomeScreen1()));
                      },
                      textColor: const Color(0xFFDA982A),
                    ),
                    const SizedBox(
                      height: 45.0,
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
