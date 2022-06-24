import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:steko_health_checker/authentication/google/google_sign_in.dart';
import '../authentication/authentication_provider.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_elevated_button_gradient.dart';
import '../widgets/custom_input_button.dart';
import '../widgets/single_button_input.dart';
import 'sign_up_screen.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  static const id = '/log-in';

  const LogIn({Key key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: height / 5.5,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Hey there!',
                        style: TextStyle(
                          color: Color(0xFF1D1617),
                          fontSize: 16.0,
                        ),
                      ),
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Color(0xFF1D1617),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 70.0,
                      ),
                      SingleButtonInput(
                        controller: emailController,
                        title: 'Email',
                        textInputType: TextInputType.emailAddress,
                        prefixIconUrl: const Icon(
                          Icons.mail_outlined,
                        ),
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomInputButton(
                        controller: passwordController,
                        obscureText: passwordVisibility,
                        title: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        prefixIconUrl: const Icon(
                          Icons.lock_outlined,
                        ),
                        suffixIconUrl: GestureDetector(
                          onTap: () {
                            setState(() {
                              passwordVisibility = false;
                            });
                          },
                          child: Icon(
                            Icons.visibility_off_outlined,
                            color: passwordVisibility == true
                                ? Colors.grey
                                : Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: const Color(0xFFF7F7F7),
                            context: context,

                            builder: (context) => SingleChildScrollView(
                              controller: ModalScrollController.of(context),
                              child: Container(
                                padding: const EdgeInsets.all(30.0),
                                height:
                                    (MediaQuery.of(context).size.height) / 1.5,
                                child: Column(
                                  children: [
                                    SingleButtonInput(
                                      controller: emailController,
                                      title: 'Email',
                                      textInputType: TextInputType.emailAddress,
                                      prefixIconUrl: const Icon(
                                        Icons.mail_outlined,
                                      ),
                                      obscureText: false,
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    CustomElevatedButtonGradient(
                                      width: double.infinity,
                                      onPressed: () {
                                        context
                                            .read<AuthenticationProvider>()
                                            .resetPassword(
                                                emailController.text);

                                        Navigator.of(context).pop();
                                      },
                                      borderRadius: BorderRadius.circular(4.0),
                                      child: const Text(
                                        'Reset Password',
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
                            ),
                            clipBehavior: Clip.antiAlias,
                            // set shape to make top corners rounded
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: Color(0xFFADA4A5),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomElevatedButtonGradient(
                        width: double.infinity,
                        onPressed: () {
                          if (emailController.text.isEmpty) {
                            var snackBar = const SnackBar(
                              content: Text('Email is Required'),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (passwordController.text.isEmpty) {
                            var snackBar = const SnackBar(
                              content: Text('Password is Required'),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            context.read<AuthenticationProvider>().signIn(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                          }
                        },
                        borderRadius: BorderRadius.circular(4.0),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        height: 62.0,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Image.asset('assets/images/or.png'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      CustomElevatedButton(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            'assets/images/google.png',
                          ),
                        ),
                        bordRadious: 4.0,
                        height: 62.0,
                        color: Colors.white,
                        onPress: () {
                          GoogleSignInMethod.signInWithGoogle();
                        },
                        textColor: const Color(0xFFDA982A),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don’t have an account yet?',
                            style: TextStyle(
                              color: Color(0xFF1D1617),
                              fontSize: 14.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(SignUpScreen.id);
                            },
                            child: const Text(
                              ' Register',
                              style: TextStyle(
                                color: Color(0xFF4BB845),
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
