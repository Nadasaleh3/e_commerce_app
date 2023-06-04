import 'package:e_commerce_app/views/pages/auth.dart';

import 'package:e_commerce_app/views/pages/regstraion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home1.dart';




class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool _obsecured = true;

  var _formKey = GlobalKey<FormState>();

    Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
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
  //   super.initState();
  // }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
            key: formKey,
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
                  controller: emailController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.verified_user),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue),
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
                          borderSide: BorderSide(color: Colors.lightBlue),
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
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (_) => Home()));
                    // }
                    signIn();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                         Color.fromARGB(255, 24, 59, 25))),
                  child: Text(
                    'Log in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
          "Don't Have an Account ? ",
          style: GoogleFonts.akayaKanadaka(
              color: Colors.white, fontWeight: FontWeight.w600,
               fontSize: 20),
        ),
           InkWell(
             onTap: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => Regstration()));
                    },
           child: Text(
            'Register Now' ,
            
            style: GoogleFonts.akayaKanadaka(
                color: Color.fromARGB(255, 24, 59, 25), fontWeight: FontWeight.w600,
               ),
                 ),
         ),
                   ],
                 ),
      
                // ElevatedButton(
                //     style: ButtonStyle(
                //         backgroundColor: MaterialStateProperty.all<Color>(
                //             Color.fromARGB(255, 24, 59, 25))),
                //     onPressed: () {
                      
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (_) => Regstration()));
                //       //  }
                //     },
                //     child: Text(
                //       'sign up',
                //       style: TextStyle(color: Colors.white),
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
