import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tmb_fyp/constants.dart';
import 'package:tmb_fyp/pages/auth/login.dart';
import 'package:tmb_fyp/pages/guest/guest_navbar.dart';

import '../main.dart';


class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState ();
    Timer(const Duration(seconds: 5),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()
            )
        ));
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.fitness_center,
              size: 70,
              color: kprimary,
            ),
            gaph20,
            Text('TMB - The Muscle Bar',
              style: TextStyle(
                color: kprimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );

  }
}