import 'package:flutter/material.dart';
import 'package:tmb_fyp/pages/auth/signup.dart';
import '../../constants.dart';
import '../user/user_navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock,),
                      suffixIcon: Icon(Icons.visibility_off_outlined,),
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
                  )

                ],
              ),
              gaph20,
              gaph20,
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserNavBar()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical:  10,horizontal: 100),
                ),
                child: const Text('Login'),
              ),
              gaph20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",
                    style: ksm,),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignupPage()),
                      );
                    },
                    child: const Text('Sign Up',
                      // style: kmd1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}