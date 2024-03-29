import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmb_fyp/pages/user/auth/signup.dart';
import '../../../constants.dart';
import '../../trainer/auth/trainer_login.dart';
import '../user_navbar.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late SharedPreferences _prefs;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
    });
  }

  Future<void> _saveLoginStatus(bool isLoggedIn) async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool('isLoggedIn', isLoggedIn);
  }

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
                      Text(
                        'TMB',
                        style: kmd.copyWith(color: Colors.indigo),
                      ),
                      const Text(
                        'THE MUSCLE BAR',
                        style: ksm,
                      ),
                      gaph20,
                      gaph20,
                      gaph20,
                      gaph20,
                      Text(
                        'Welcome',
                        style: kmd.copyWith(color: Colors.indigo),
                      ),
                      const Text(
                        'Lets get started',
                        style: ksm,
                      ),
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
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        } else if (!RegExp(
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                            .hasMatch(value)) {
                          return 'Enter valid email';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    gaph20,
                    TextFormField(
                      obscureText: _isObscure,
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Password';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure ? Icons.visibility : Icons
                                .visibility_off,
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
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                            .then((value) {
                          _saveLoginStatus(true);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserNavBar(),
                            ),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 100),
                      ),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
              gaph20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: ksm,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignupPage()),
                      );
                    },
                    child: Text(
                      ' Sign Up',
                      style: ksm.copyWith(
                          color: Colors.indigo, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              gaph20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TrainerLoginPage()),
                      );
                    },
                    child: Text(
                      'Login ',
                      style: ksm.copyWith(
                          color: Colors.indigo, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "as a trainer",
                    style: ksm,
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

