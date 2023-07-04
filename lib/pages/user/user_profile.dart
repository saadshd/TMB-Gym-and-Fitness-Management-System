import 'package:flutter/material.dart';
import 'package:tmb_fyp/pages/user/auth/user_login.dart';
import '../../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../notificationpage.dart';


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
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const NotificationPage()));
                                  },
                                  icon: const Icon(Icons.notifications_active,
                                    color: Colors.white,),
                                ),
                                IconButton(
                                  onPressed: () {
                                    FirebaseAuth.instance.signOut().then((value) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => const UserLoginPage()));
                                    });
                                  },
                                  icon: const Icon(Icons.logout,
                                    color: Colors.white,),
                                ),
                              ],
                            )
                          ],
                        ),
                        gaph20,
                        const CircleAvatar(
                          radius: 40,
                          child: Icon(Icons.person, size: 30,),
                        )
                      ],
                    ),
                  ),
                ),
                gaph20,
                Row(
                  children: const [
                    gapw20,
                    Text('Profile',
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
                      child: Column(
                        children: const [
                          ListTile(
                            title: Text('Name'),
                            trailing: Text('M. Saad Shahid'),
                          ),
                          Divider(),
                          ListTile(
                            title: Text('CNIC'),
                            trailing: Text('36603-4788047-3'),
                          ),
                          Divider(),
                          ListTile(
                            title: Text('Contact'),
                            trailing: Text('0335-7735290'),
                          ),
                          Divider(),
                          ListTile(
                            title: Text('Age'),
                            trailing: Text('21'),
                          ),
                          Divider(),
                          ListTile(
                            title: Text('Weight'),
                            trailing: Text('105'),
                          ),
                          Divider(),
                          ListTile(
                            title: Text('Email'),
                            trailing: Text('saad@tmb.com'),
                          ),
                        ],
                      )
                    ),
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