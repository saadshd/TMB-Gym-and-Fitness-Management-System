import 'package:flutter/material.dart';

import 'user_dashboard.dart';
import 'user_packages.dart';
import 'user_profile.dart';

class UserNavBar extends StatefulWidget {
  const UserNavBar({Key? key}) : super(key: key);


  @override
  State<UserNavBar> createState() => _UserNavBarState();
}


class _UserNavBarState extends State<UserNavBar> {
  int index = 0;
  final screens = [
    const UserDashboard(),
    const UserPackages(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screens[index],

      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          // indicatorColor: Colors.black12,
        ),
        child: NavigationBar(
          // backgroundColor: Colors.grey.shade200,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
              tooltip: "",
              icon: Icon(Icons.dashboard_outlined),
              label: 'Dashboard',
              selectedIcon: Icon(Icons.dashboard, color: Colors.black),
            ),
            NavigationDestination(
              tooltip: "",
              icon: Icon(Icons.message_outlined),
              label: 'Packages',
              selectedIcon: Icon(Icons.message, color: Colors.black),
            ),
            NavigationDestination(
              tooltip: "",
              icon: Icon(Icons.person_outlined),
              label: 'Profile',
              selectedIcon: Icon(Icons.person, color: Colors.black),
            ),
          ],
        ),
      ),


    );
  }
}