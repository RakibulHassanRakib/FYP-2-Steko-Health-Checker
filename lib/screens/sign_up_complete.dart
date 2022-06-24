import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../botton navigation bar/main_page.dart';
import '../widgets/custom_elevated_button_gradient.dart';
import '../widgets/custom_input_button.dart';

// ignore: must_be_immutable
class SignUpScreenComplete extends StatelessWidget {
  static const id = '/sign-up-complete';
  String selectedValue = "USA";

  SignUpScreenComplete({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/details.png'),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Let’s complete your profile',
                        style: TextStyle(
                          color: Color(0xFF1D1617),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'It will help us to know more about you!',
                        style: TextStyle(
                          color: Color(0xFF7B6F72),
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      const CustomInputButton(
                        textInputType: TextInputType.phone,
                        title: 'Phone Number',
                        prefixIconUrl: Icon(
                          Icons.call_outlined,
                        ),
                        suffixIconUrl: Visibility(
                          visible: false,
                          child: Icon(
                            Icons.person_outlined,
                          ),
                        ),
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        obscureText: false,
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Choose Gender',
                          labelStyle: TextStyle(
                            color: Color(0xFFADA4A5),
                            fontSize: 14.0,
                          ),
                          prefixIcon: Icon(
                            Icons.people_outlined,
                          ),
                          suffixIcon: Visibility(
                            visible: false,
                            child: Icon(
                              Icons.person_outlined,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const CustomInputButton(
                        title: 'Date of Birth',
                        textInputType: TextInputType.datetime,
                        prefixIconUrl: Icon(
                          Icons.event_note_outlined,
                        ),
                        suffixIconUrl: Visibility(
                          visible: false,
                          child: Icon(
                            Icons.person_outlined,
                          ),
                        ),
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: CustomInputButton(
                              obscureText: false,
                              textInputType: TextInputType.number,
                              title: 'Your Weight',
                              prefixIconUrl: Icon(
                                Icons.monitor_weight_outlined,
                              ),
                              suffixIconUrl: Visibility(
                                visible: false,
                                child: Icon(
                                  Icons.person_outlined,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.only(left: 8.0),
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFF8BBC45),
                                    Color(0xFF4BB845),
                                  ],
                                ),
                              ),
                              child: const Center(
                                  child: Text(
                                'KG',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: CustomInputButton(
                              textInputType: TextInputType.number,
                              obscureText: false,
                              title: 'Your Height',
                              prefixIconUrl: Icon(
                                Icons.height_outlined,
                              ),
                              suffixIconUrl: Visibility(
                                visible: false,
                                child: Icon(
                                  Icons.person_outlined,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.only(left: 8.0),
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFF8BBC45),
                                    Color(0xFF4BB845),
                                  ],
                                ),
                              ),
                              child: const Center(
                                  child: Text(
                                'CM',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomElevatedButtonGradient(
                    width: double.infinity,
                    onPressed: () {
                      if (FirebaseAuth.instance.currentUser != null) {
                        Navigator.of(context).pushNamed(MainPage.id);
                      }
                    },
                    borderRadius: BorderRadius.circular(4.0),
                    child: const Text(
                      'Done',
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
          ],
        ),
      ),
    );
  }
}
