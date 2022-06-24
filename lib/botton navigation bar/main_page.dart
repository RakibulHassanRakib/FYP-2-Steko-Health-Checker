import 'package:flutter/material.dart';

import 'home_screen.dart';
import '../more/more_feature_screen.dart';
import 'pfofile_screen.dart';
import 'track_screen.dart';

class MainPage extends StatefulWidget {
  static const id = '/main-page';

  const MainPage({Key key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomeScreen(),
    const TrackScreen(),
    MoreFeatureScreen(),
    const ProfileScreen()
  ];

  int currentindex = 0;
  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 80.0,
        color: Colors.white,
        padding: const EdgeInsets.only(top: 10.0),
        child: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.red,
              bottomAppBarColor: Colors.green,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: const TextStyle(
                      color: Colors
                          .grey))), // sets the inactive color of the `BottomNavigationBar`
          child: BottomNavigationBar(
              onTap: onTap,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 1,
              currentIndex: currentindex,
              selectedItemColor: const Color(0xFF8BBC45),
              unselectedItemColor: const Color(0xFFADA4A5),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      size: 32,
                    ),
                    label: 'Home',
                    backgroundColor: Colors.black),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.insights_outlined,
                    size: 32,
                  ),
                  label: 'Track',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.grid_view_outlined,
                    size: 32,
                  ),
                  label: 'more',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_outlined,
                    size: 32,
                  ),
                  label: 'Profile',
                ),
              ]),
        ),
      ),
    );
  }
}
