import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constraints.dart';
import '../../custom route/slide_right_route.dart';
import '../../health_quiz/screens/quizz_screen.dart';

class HeroSectionHomePage extends StatefulWidget {
  const HeroSectionHomePage({
    Key key,
  }) : super(key: key);

  @override
  State<HeroSectionHomePage> createState() => _HeroSectionHomePageState();
}

class _HeroSectionHomePageState extends State<HeroSectionHomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  String userName;
  String imageUrl;

  final user = FirebaseAuth.instance.currentUser;

  getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("userData").doc(user.uid);

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      // ignore: void_checks
      setState(() {
        if (snapshot.data() != null) {
          userName = snapshot.get('name');
          imageUrl = snapshot.get('imageUrl');
        } else {
          return const CircularProgressIndicator(backgroundColor: Colors.white);
        }
      });
    });
  }



  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('userData')
          .doc(user.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/heroImg.png',
                          fit: BoxFit.cover),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  backgroundImage: (imageUrl == null)
                                      ? const AssetImage(
                                          'assets/images/Profileactive.png')
                                      : NetworkImage(imageUrl)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Welcome Back',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  (userName == null) ? "New User" : userName,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                       
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 10.0),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'How fit you are? Answer these Questions and find out!',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 25.0,
                            ),
                            Container(
                              width: 80,
                              height: 35,
                              decoration: BoxDecoration(
                                gradient: kYelloGradientColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    SlideRightRoute(
                                      // page: QuizScreen(),
                                      page: const QuizzScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
