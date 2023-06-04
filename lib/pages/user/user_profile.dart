import 'package:flutter/material.dart';
import 'package:tmb_fyp/pages/bmi_calculator.dart';

import '../../constants.dart';
import '../macro_calculator.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: kpdh20,
            child: Column(
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    color: kprimary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        gaph20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.fitness_center,
                                  color: Colors.white,),
                                gapw10,
                                Text('The Muscle Bar',
                                  style: kmd.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.logout,
                                color: Colors.white,),
                            )
                          ],
                        ),
                        gaph20,
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              child: Icon(Icons.person),
                            ),
                            gapw20,
                            Text('M. Saad Shahid',
                              style: kmd.copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                gaph20,
                gaph20,
                Row(
                  children: const [
                    gapw20,
                    Text('Profile Manage',
                        style: kmd
                    )
                  ],
                ),
                gaph20,
                gaph10,
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const ListTile(
                        title: Text('Update Profile Info'),
                        leading: Icon(Icons.fitness_center),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    gaph20,
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const ListTile(
                        title: Text('Change Password'),
                        leading: Icon(Icons.fitness_center),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ],
                ),
                gaph20,
                Row(
                  children: const [
                    gapw20,
                    Text('More',
                        style: kmd
                    )
                  ],
                ),
                gaph20,
                gaph10,
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MacroCalculator()));
                        },
                        title: const Text('Macro Calculator'),
                        leading: const Icon(Icons.fitness_center),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    gaph20,
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const BMICalculator()));
                        },
                        title: const Text('BMI Calculator'),
                        leading: const Icon(Icons.fitness_center),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    gaph20
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}