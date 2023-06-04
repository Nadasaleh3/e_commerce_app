import 'package:e_commerce_app/views/pages/log_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    // Future.delayed(
    //     const Duration(seconds: 3),
    //     () => Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (_) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/2.png'), fit: BoxFit.cover)),

                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 60,
                            width: 30,
                            ),
                             Text(
                                        'Welcome To',
                                        style: GoogleFonts.akayaKanadaka(
                                            color: Color.fromARGB(255, 24, 59, 25), fontSize: 50),
                                      ),
                                      // SizedBox(width: 10,),
                                      Text(
                                        'Our App',
                                        style: GoogleFonts.akayaKanadaka(
                                            color: Color.fromARGB(255, 24, 59, 25), fontSize: 40),
                                      ),

                                       InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (_) => LogIn()));
                                        },
                                        child: Container(
                                          child: Text(
                                            "                        -> Let's Start",
                                            style: GoogleFonts.akayaKanadaka(
                                                color:Colors.white, fontSize: 25,fontWeight:FontWeight.bold),
                                          ),
                                        ),
                                      ),
                          ],
                        ),
                      ],
                    ),
                  
                  ],
                ),
                 
        //  color: Color.fromARGB(255, 241, 220, 191),
        // child: Column(
        //   // mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     Row(
        //       children: [
        //         Column(
        //           children: [
        //              SizedBox(
        //               height: 60,
        //              ),
        //                            Text(
        //                         'Welcome To',
        //                         style: GoogleFonts.akayaKanadaka(
        //                             color: Color.fromARGB(255, 24, 59, 25), fontSize: 40),
        //                       ),
        //                       // SizedBox(width: 10,),
        //                       Text(
        //                         'Our App',
        //                         style: GoogleFonts.akayaKanadaka(
        //                             color: Color.fromARGB(255, 24, 59, 25), fontSize: 30),
        //                       ),
        //                       SizedBox(height: 10,),
        //                       Column(
        //                         crossAxisAlignment: CrossAxisAlignment.end,
        //                         // mainAxisAlignment: MainAxisAlignment.end,
        //                         children: [
        //                           InkWell(
        //                             onTap: () {
        //                               Navigator.push(
        //                                   context, MaterialPageRoute(builder: (_) => LogIn()));
        //                             },
        //                             child: Container(
        //                               child: Text(
        //                                 "                             Let's Start",
        //                                 style: GoogleFonts.akayaKanadaka(
        //                                     color:Colors.white, fontSize: 25),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
                            
        //             // Row(
        //             //   mainAxisAlignment: MainAxisAlignment.start,
        //             //   children: [
                      

        //             //     // const SizedBox(
        //             //     //   height: 10,
        //             //     // ),
        //             //     // InkWell(
        //             //     //   onTap: () {
        //             //     //     Navigator.push(
        //             //     //         context, MaterialPageRoute(builder: (_) => LogIn()));
        //             //     //   },
        //             //     //   child: Text(
        //             //     //     'Get Srarted',
        //             //     //     style: GoogleFonts.akayaKanadaka(
        //             //     //         color: Colors.white, fontSize: 50),
        //             //     //   ),
        //             //     // ),
        //             //     // const SizedBox(
        //             //     //   height: 10,
        //             //     // ),
        //             //     //CircularProgressIndicator()
        //             //   ],
        //             // ),
        //             // const SizedBox(
        //             //   height: 50,
        //             // ),
                    
        //               //  Column(
        //               //   // mainAxisAlignment: MainAxisAlignment.start,
        //               //   children: [
        //               //     const SizedBox(
        //               //       height: 10,
        //               //       width: 10,
        //               //     ),
                     
                          
                            
        //               //       // mainAxisAlignment: MainAxisAlignment.start,
                            
        //               //              Text(
        //               //           'Welcome To',
        //               //           style: GoogleFonts.akayaKanadaka(
        //               //               color: Colors.white, fontSize: 30),
        //               //         ),
        //               //         SizedBox(width: 10,),
        //               //         Text(
        //               //           'Our App',
        //               //           style: GoogleFonts.akayaKanadaka(
        //               //               color: Colors.white, fontSize: 0),
        //               //         ),
        //               //         InkWell(
        //               //           onTap: () {
        //               //             Navigator.push(
        //               //                 context, MaterialPageRoute(builder: (_) => LogIn()));
        //               //           },
        //               //           child: Container(
        //               //             child: Text(
        //               //               "Let's Start",
        //               //               style: GoogleFonts.akayaKanadaka(
        //               //                   color: Colors.white, fontSize: 10),
        //               //             ),
        //               //           ),
        //               //         ),
                            
        //               //     const SizedBox(
        //               //       height: 10,
        //               //     ),
        //               //   ],
        //               // ),
                    
        //           ],
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
