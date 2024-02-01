import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intern_asgn_persist/screens/add_prod.dart';
import 'package:intern_asgn_persist/screens/chats.dart';
import 'package:intern_asgn_persist/screens/discover.dart';
import 'package:intern_asgn_persist/screens/group_screen.dart';
import 'package:intern_asgn_persist/screens/home_screen.dart';
import 'package:intern_asgn_persist/screens/liked_prods.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const Group_screen(),
    const Discover(),
    const SavedProducts(),
    const ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6A1B9A),
              Color(0xFF7B1FA2),
              Color(0xFF8E24AA),
              Color(0xFF9C27B0),
              Color(0xFFAB47BC),
              Color(0xFFBA68C8),

              // Color(0xFFc2410c),
              // Color(0xFFea580c),
              // Color(0xFFea580c),
              // Color(0xFFf97316),
              // Color(0xFFfb923c),
              // Color(0xFFfdba74),
            ],
          ),
        ),
        child: MotionTabBar(
          initialSelectedTab: "Closet",
          useSafeArea: true,
          labels: const [
            "Closet",
            "Groups",
            "Discover",
            "Saved",
            "Chats"
          ],
          icons: const [
            FontAwesomeIcons.circleUser,
            FontAwesomeIcons.peopleGroup,
            FontAwesomeIcons.house,
            FontAwesomeIcons.gratipay,
            FontAwesomeIcons.comment,
          ],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
          //tabIconColor: Colors.blue[600]
          //make tabicon color to be cyan
          tabIconColor: Colors.white,
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          //tabSelectedColor: Colors.blue[900],
          tabSelectedColor: Colors.deepPurple[800],
          tabIconSelectedColor: Colors.white,
          tabBarColor: Colors.transparent,
          onTabItemSelected: (int value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
