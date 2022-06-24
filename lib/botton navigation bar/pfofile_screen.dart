import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:steko_health_checker/FAQ/faq.dart';
import 'package:steko_health_checker/about_the_app.dart';
import 'package:steko_health_checker/constraints.dart';
import 'package:steko_health_checker/screens/log_in_screen.dart';
import 'package:provider/provider.dart';

import '../authentication/authentication_provider.dart';
import '../screens/terms_of_use.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      setState(() {
        userName = snapshot.get('name');
        imageUrl = snapshot.get('imageUrl');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 151,
                    width: 151,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: kGreenGradientColor,
                    ),
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 70,
                            child: ClipOval(
                              child: (imageUrl == null)
                                  ? Image.asset(
                                      'assets/images/Profileactive.png')
                                  : Image.network(
                                      imageUrl,
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          Positioned(
                              bottom: 1,
                              right: 1,
                              child: Container(
                                height: 40,
                                width: 40,
                                child: const Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                ),
                                decoration: const BoxDecoration(
                                    gradient: kGreenGradientColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      (userName == null) ? "New User" : userName,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TermsOfUse(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Text('Privecy Policy'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FAQ(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Text('FAQ'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutTheApps(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Text('About the App'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(
                    Icons.logout,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      context.read<AuthenticationProvider>().signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LogIn()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
