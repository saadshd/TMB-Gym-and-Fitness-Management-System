import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tmb_fyp/pages/user/user_navbar.dart';
import '../../../constants.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                      Text('Lets set you up',
                        style: kmd.copyWith(color: Colors.indigo),),
                      const Text('Just few minutes',
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
                    //
                    // gaph20,
                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //     border: UnderlineInputBorder(
                    //     ),
                    //     hintText: 'Phone No.',
                    //     prefixIcon: Icon(Icons.phone,),
                    //   ),
                    // ),
                    //
                    // gaph20,
                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //     border: UnderlineInputBorder(
                    //     ),
                    //     hintText: 'Name',
                    //     prefixIcon: Icon(Icons.person,),
                    //   ),
                    // ),

                    gaph20,
                    TextFormField(
                      obscureText: _isObscure,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Password';
                        }
                        else {
                          return null;
                        }
                      },
                      controller: _passwordController,
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
                    gaph20,
                    gaph20,
                    ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                            .then((value) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const UserNavBar()));
                        }).onError((error, stackTrace) {
                          const Text('Error Occured');
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical:  10,horizontal: 100),
                      ),
                      child: const Text('Sign Up'),
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