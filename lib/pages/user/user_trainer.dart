import 'package:flutter/material.dart';
import 'package:tmb_fyp/constants.dart';

class UserTrainer extends StatelessWidget {
  const UserTrainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Trainer'),
        ),
        body: Padding(
          padding: kpda20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             Container(
               height: 220,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(15),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.5),
                     spreadRadius: 5,
                     blurRadius: 7,
                     offset: const Offset(0, 3),
                   ),
                 ],
               ),
               child: Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Column(
                   children: const [
                     Text('Daily Diet', style: kmd1,),
                     Text('Your daily diet will be shown here', style: ksm,),
                   ],
                 ),
               ),
             ),
              gaph20,
              Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: const [
                      Text('Daily Exercise', style: kmd1,),
                      Text('Your daily exercise will be shown here', style: ksm,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
