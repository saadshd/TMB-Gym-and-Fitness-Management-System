import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tmb_fyp/pages/user/auth/signup.dart';

import '../../../constants.dart';


class UserData extends StatefulWidget {

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {

  final formkey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController cniccontrller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();


  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: kpda20,
          child: Form(
            key: formkey,
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
                TextFormField(
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.person),
                    border: UnderlineInputBorder(),
                    labelText: 'Name',
                  ),
                  controller: namecontroller,
                  keyboardType: TextInputType.name,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter your name';
                    }
                    else if(!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                      return 'Enter valid name';
                    }
                    else {
                      return null;
                    }
                  },
                ),

                gaph10,

                TextFormField(
                  decoration: const  InputDecoration(
                    border: UnderlineInputBorder(
                    ),
                    labelText: 'CNIC',
                    helperText: 'XXXXX-XXXXXXX-X',
                  ),
                  controller: cniccontrller,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter your CNIC';
                    }
                    else if(!RegExp(r'^\d{5}-\d{7}-\d+$').hasMatch(value)){
                      return 'Enter valid CNIC';
                    }
                    else {
                      return null;
                    }
                  },
                ),
                gaph10,

                TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                      ),
                      labelText: 'Phone No.',
                      helperText: 'XXXX-XXXXXXX'
                  ),
                  controller: phonecontroller,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter your phone number';
                    }
                    else if(!RegExp(r'^\d{4}[-\s./\d]+$').hasMatch(value)){
                      return 'Enter valid phone number';
                    }
                    else {
                      return null;
                    }
                  },
                ),
                gaph10,


                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                    ),
                    labelText: 'Age',

                  ),
                  controller: agecontroller,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter your Age';
                    }
                    else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                    ),
                    labelText: 'Weight',

                  ),
                  controller: weightcontroller,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter your Weight';
                    }
                    else {
                      return null;
                    }
                  },
                ),
                gaph10,
                gaph20,
                ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        // final snackBar = SnackBar(
                        //   content: const Text('Signed Up Successfully.'),
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        // );
                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        FirebaseFirestore.instance.collection("Member").add({
                          'Name':namecontroller.text,
                          'CNIC':cniccontrller.text,
                          'Contact':phonecontroller.text,
                          'Age':agecontroller.text,
                          'Weight':weightcontroller.text
                        }
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignupPage()),
                        );
                      }
                      namecontroller.clear();
                      cniccontrller.clear();
                      phonecontroller.clear();
                      agecontroller.clear();
                      weightcontroller.clear();
                    },
                    child: const Text('Next',)
                ),

                const SizedBox(height: 20),


              ],
            ),
          ),
        ),

      ),
    );
  }
}