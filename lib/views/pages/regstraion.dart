import 'package:e_commerce_app/views/pages/auth.dart';

import 'package:e_commerce_app/views/pages/home1.dart';
import 'package:e_commerce_app/views/pages/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Regstration extends StatefulWidget {
  const Regstration({super.key});

  @override
  State<Regstration> createState() => _RegstrationState();
}

class _RegstrationState extends State<Regstration> {
  // late TextEditingController emailController;
  // late TextEditingController passwordController;
  // late TextEditingController usernameController;
    var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fNameController = TextEditingController();
  var sNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool _obsecured = true;

  var _formKey = GlobalKey<FormState>();

     Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
     password: passwordController.text.trim());
      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Auth()));
 
  }

  // @override
  // void initState() {
  //   emailController = TextEditingController();
  //   passwordController = TextEditingController();
  //   usernameController = TextEditingController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   usernameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/3.png'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/4.png'),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // controller: usernameController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.person),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                      labelText: 'user name',
                      hintText: 'write your username....'),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.newline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'you must enter username';
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.email_rounded),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(25)),
                      labelText: 'email',
                      hintText: 'write your name....'),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.newline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'you must write email';
                    } else if (value.split('@').last != 'gmail.com') {
                      return 'email must end with @gmail.com';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: _obsecured,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordController,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _obsecured = !_obsecured;
                            });
                          },
                          child: Icon(_obsecured
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(25)),
                      labelText: 'password',
                      hintText: 'write your password....'),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.newline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'you must write Password';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                           Color.fromARGB(255, 24, 59, 25))),
                    onPressed: () {
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => Home()));
                      //  }
                       signUp(); 
                    },
                    child: Text(
                      'sign up',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
