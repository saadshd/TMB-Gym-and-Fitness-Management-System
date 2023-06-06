import 'package:flutter/material.dart';

import '../../constants.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: kpda20,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('TMB',
                          style: kmd.copyWith(color: Colors.indigo)),
                      const Text('THE MUSCLE BAR',
                        style: ksm,),
                      gaph20,
                      gaph20,
                      gaph20,
                      gaph20,
                      Text('Lets set you up',
                        style: kmd.copyWith(color: Colors.indigo),),
                      const Text('Just few minutes',
                        style: ksm,),
                    ],
                  ),
                ],
              ),
              gaph20,
              Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                      ),
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email,),
                    ),
                  ),

                  gaph20,
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                      ),
                      hintText: 'Phone No.',
                      prefixIcon: Icon(Icons.phone,),
                    ),
                  ),

                  gaph20,
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                      ),
                      hintText: 'Name',
                      prefixIcon: Icon(Icons.person,),
                    ),
                  ),

                  gaph20,
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                      ),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock,),
                      suffixIcon: Icon(Icons.visibility_off_outlined,),
                    ),
                  ),
                ],
              ),
              gaph20,
              gaph20,
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical:  10,horizontal: 100),
                ),
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}