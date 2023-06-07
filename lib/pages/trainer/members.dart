import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constants.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});


  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Members'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20,20,20,0),
          child: Column(
            children: [
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
    );
  }
}
