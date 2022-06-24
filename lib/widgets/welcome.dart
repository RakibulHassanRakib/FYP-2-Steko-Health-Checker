import 'package:flutter/material.dart';
import 'package:steko_health_checker/constraints.dart';

class Welcome extends StatelessWidget {
  final String heroImageURL;
  final String title;
  final String description;
  final Widget indictator;
  final Widget nextButton;
  final VoidCallback navigatorNextPageOnTap;
  final VoidCallback skipButtonOnTap;

  const Welcome({
    Key key,
    this.heroImageURL,
    this.title,
    this.description,
    this.indictator,
    this.navigatorNextPageOnTap,
    this.skipButtonOnTap,
    this.nextButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(heroImageURL, fit: BoxFit.cover),
        const SizedBox(
          height: 65.0,
        ),
        Padding(
          padding: k30pxPaddingHorizontal,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1D1617),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: k30pxPaddingHorizontal,
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF7B6F72),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: k30pxPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: skipButtonOnTap,
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFA1A1A1),
                  ),
                ),
              ),
              indictator,
              GestureDetector(
                onTap: navigatorNextPageOnTap,
                child: nextButton,
              )
            ],
          ),
        ),
      ],
    );
  }
}
