import 'package:flutter/material.dart';
import 'package:tmb_fyp/pages/bmi_calculator.dart';

import '../../constants.dart';

class GuestProfile extends StatefulWidget {
  const GuestProfile({Key? key}) : super(key: key);

  @override
  State<GuestProfile> createState() => _GuestProfileState();
}

class _GuestProfileState extends State<GuestProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: kpda20,
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
                              children: const [
                                Icon(Icons.fitness_center),
                                gapw10,
                                Text('The Muscle Bar',
                                  style: kmd,
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.logout),
                            )
                          ],
                        ),
                        gaph20,
                        Row(
                          children: const [
                            CircleAvatar(
                              radius: 30,
                              child: Icon(Icons.person),
                            ),
                            gapw20,
                            Text('Sign up for All Features',
                              style: kmd,
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
                SizedBox(
                  height: 150,
                  child: ListView(
                    children: [
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        tileColor: Colors.orange.withOpacity(0.2),
                        title: const Text('Update Profile Info'),
                        leading: const Icon(Icons.fitness_center),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      gaph20,
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        tileColor: Colors.orange.withOpacity(0.2),
                        title: const Text('Change Password'),
                        leading: const Icon(Icons.fitness_center),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                gaph20,
                // gaph20,
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
                SizedBox(
                  height: 300,
                  child: ListView(
                    children: [
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        tileColor: Colors.orange.withOpacity(0.2),
                        title: const Text('Macro Calculator'),
                        leading: const Icon(Icons.fitness_center),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      gaph20,
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const BMICalculator()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        tileColor: Colors.orange.withOpacity(0.2),
                        title: const Text('BMI Calculator'),
                        leading: const Icon(Icons.fitness_center),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      gaph20,
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        tileColor: Colors.orange.withOpacity(0.2),
                        title: const Text('Log Measurement'),
                        leading: const Icon(Icons.fitness_center),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      gaph20,
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        tileColor: Colors.orange.withOpacity(0.2),
                        title: const Text('Log Weight'),
                        leading: const Icon(Icons.fitness_center),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}