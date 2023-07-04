import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tmb_fyp/constants.dart';
import '../user/auth/user_login.dart';


class TrainerDashboard extends StatefulWidget {
  const TrainerDashboard({Key? key}) : super(key: key);

  @override
  State<TrainerDashboard> createState() => _TrainerDashboardState();
}

class _TrainerDashboardState extends State<TrainerDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20,0,20,0),
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
                            onPressed: () {
                              FirebaseAuth.instance.signOut().then((value) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const UserLoginPage()));
                              });
                            },
                            icon: const Icon(Icons.logout,
                              color: Colors.white,),
                          )
                        ],
                      ),
                      gaph20,
                      gaph20,
                      Text(' Welcome Trainer', style: kmd.copyWith(color: Colors.white),)
                    ],
                  ),
                ),
              ),
              gaph20,
              const Text('Members', style: kmd,),
              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('Member').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      if(!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context,index){
                            return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Container(
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
                                  height: 140,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start, children: [
                                          Row(
                                            children: [
                                              const Text('Name: ', style: kmd1),
                                              Text(snapshot.data.docs[index]['Name'],style: kmd1,)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text('Contact: ', style: ksm),
                                              Text(snapshot.data.docs[index]['Contact'],style: ksm,)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text('CNIC: ', style: ksm),
                                              Text(snapshot.data.docs[index]['CNIC'],style: ksm,)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text('Age: ', style: ksm),
                                              Text(snapshot.data.docs[index]['Age'],style: ksm,)
                                            ],
                                          ),
                                        ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            );
                          }
                      );
                    }
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
