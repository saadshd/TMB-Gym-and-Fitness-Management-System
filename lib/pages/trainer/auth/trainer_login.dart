import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tmb_fyp/pages/trainer/trainer_dashboard.dart';
import 'package:tmb_fyp/pages/trainer/trainer_navbar.dart';
import '../../../constants.dart';

class TrainerLoginPage extends StatefulWidget {
  const TrainerLoginPage({Key? key}) : super(key: key);

  @override
  State<TrainerLoginPage> createState() => _TrainerLoginPageState();
}

class _TrainerLoginPageState extends State<TrainerLoginPage> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


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
                      Text('Welcome',
                        style: kmd.copyWith(color: Colors.indigo),),
                      const Text('Lets get started',
                        style: ksm,),
                    ],
                  ),
                ],
              ),
              gaph20,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Email';
                        }
                        else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                        ),
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email,),
                      ),
                    ),

                    gaph20,
                    TextFormField(
                      obscureText: _isObscure,
                      controller: _passwordController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Password';
                        }
                        else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(
                        ),
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock,),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                    gaph10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () { },
                          child: const Text('Forgot Password?',
                            style: ksm,
                          ),
                        ),
                      ],
                    ),

                    gaph20,
                    gaph20,
                    ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                            .then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const TrainerNavBar()));
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical:  10,horizontal: 100),
                      ),
                      child: const Text('Login'),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}