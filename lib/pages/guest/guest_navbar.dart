import 'package:flutter/material.dart';
import 'package:tmb_fyp/pages/guest/guest_dashboard.dart';
import 'package:tmb_fyp/pages/guest/guest_packages.dart';
import 'package:tmb_fyp/pages/guest/guest_profile.dart';
// import 'package:tmb_fyp/pages/member/member_trainer.dart';

class GuestNavBar extends StatefulWidget {
  const GuestNavBar({Key? key}) : super(key: key);


  @override
  State<GuestNavBar> createState() => _GuestNavBarState();
}


class _GuestNavBarState extends State<GuestNavBar> {
  int index = 0;
  final screens = [
    const GuestDashboard(),
    const GuestPackages(),
    const GuestProfile(),
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