import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steko_health_checker/FAQ/faq.dart';
import 'package:steko_health_checker/about_the_app.dart';
import 'package:steko_health_checker/custom%20route/slide_right_route.dart';
import 'authentication/authentication_provider.dart';
import 'authentication/google/google_sign_in.dart';
import 'botton navigation bar/home_screen.dart';
import 'botton navigation bar/main_page.dart';
import 'notification/notification_screen.dart';
import 'screens/log_in_screen.dart';
import 'screens/sign_up_complete.dart';
import 'screens/sign_up_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/terms_of_use.dart';
import 'screens/welcome_screen_1.dart';
import 'screens/welcome_screen_2.dart';
import 'screens/welcome_screen_3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // ignore: avoid_print
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(MultiProvider(
    child: const StekoHealthChecker(),
    providers: [
      Provider<AuthenticationProvider>(
        create: (_) => AuthenticationProvider(FirebaseAuth.instance),
      ),
      StreamProvider(
        create: (context) => context.read<AuthenticationProvider>().authState,
        initialData: null,
      ),
      Provider<GoogleSignInMethod>(
        create: (_) => GoogleSignInMethod(),
      ),
    ],
  ));
}

bool isLoading = false;

class StekoHealthChecker extends StatefulWidget {
  const StekoHealthChecker({Key key}) : super(key: key);

  @override
  State<StekoHealthChecker> createState() => _StekoHealthCheckerState();
}

class _StekoHealthCheckerState extends State<StekoHealthChecker> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Navigator.push(
        context,
        SlideRightRoute(
          page: const NotificationScreen(),
        ),
      );
      // ignore: avoid_print
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            });
      }
    });
  }

  void showNotification() {
    setState(() {
      _counter++;
    });
    flutterLocalNotificationsPlugin.show(
        0,
        "Testing $_counter",
        "How you doin ?",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const Center(child: CircularProgressIndicator());
          }
          final user = snapshot.data;
          if (user != null) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MainPage(),
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: ThemeData(
                primarySwatch: Colors.green,
                fontFamily: 'Poppins',
                scaffoldBackgroundColor: const Color(0xFFF7F7F7),
                dividerColor: const Color(0xFFDDDADA),
              ),

              // NameRoute for Navigation

              initialRoute:
                  firebaseUser != null ? MainPage.id : SplashScreen.id,
              routes: {
                SplashScreen.id: (context) => const SplashScreen(),
                WelcomeScreen1.id: (context) => const WelcomeScreen1(),
                WelcomeScreen2.id: (context) => const WelcomeScreen2(),
                WelcomeScreen3.id: (context) => const WelcomeScreen3(),
                LogIn.id: (context) => const LogIn(),
                SignUpScreen.id: (context) => const SignUpScreen(),
                SignUpScreenComplete.id: (context) => SignUpScreenComplete(),
                TermsOfUse.id: (context) => const TermsOfUse(),
                HomeScreen.id: (context) => const HomeScreen(),
                MainPage.id: (context) => const MainPage(),
                FAQ.id: (context) => const FAQ(),
                AboutTheApps.id: (context) => const AboutTheApps(),
              },
            );
          }
        });
  }
}
