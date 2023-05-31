import 'dart:developer';
import 'package:donation/core/app_color.dart';
import 'package:donation/core/icon_constant.dart';
import 'package:donation/features/goal/presenter/goal_screen.dart';
import 'package:donation/features/home/presenter/home_screen.dart';
import 'package:donation/features/profile/presenter/profile_screen.dart';
import 'package:donation/features/statistic/presenter/statistic_screen.dart';
import 'package:flutter/material.dart';
import 'package:icon_forest/flat_icons_medium.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  List<Widget> listBody = [
    HomeScreen(),
    GoalScreen(),
    StatisticScreen(),
    ProfileScreen(),
  ];
  List<BottomNavigationBarItem> listBottom = [];
  @override
  void initState() {
    listBottom = <BottomNavigationBarItem>[
      bottomNavigationBarItem(
        icon: Image.asset(
          IconConstants.homepage,
          fit: BoxFit.fill,
          color: AppColor.white,
          height: 25,
          width: 25,
        ),
        label: "HOME",
      ),
      bottomNavigationBarItem(
        icon: Image.asset(
          IconConstants.goal,
          fit: BoxFit.fill,
          color: AppColor.white,
          height: 25,
          width: 25,
        ),
        label: "GOAL",
      ),
      bottomNavigationBarItem(
        icon: Image.asset(
          IconConstants.statistic,
          fit: BoxFit.fill,
          color: AppColor.white,
          height: 25,
          width: 25,
        ),
        label: "STATISTIC",
      ),
      bottomNavigationBarItem(
        icon: Image.asset(
          IconConstants.user,
          fit: BoxFit.fill,
          color: AppColor.white,
          height: 25,
          width: 25,
        ),
        label: "PROFILE",
      ),
    ];

    super.initState();
  }

  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      backgroundColor: AppColor.white,
      bottomNavigationBar: BottomNavigationBar(
        items: listBottom,
        currentIndex: currentindex,
        onTap: (value) {
          setState(() {
            currentindex = value;
            log('IN ' + value.toString() + ' task');
          });
        },
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem({
    required Widget icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
      backgroundColor: AppColor.black,
    );
  }

  Widget getBody() {
    return listBody[currentindex];
  }
}
