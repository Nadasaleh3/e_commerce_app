import 'package:e_commerce_app/provider/product_provider.dart';
import 'package:e_commerce_app/views/pages/home1.dart';
import 'package:e_commerce_app/views/pages/spalsh.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:e_commerse_app/views/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  //ConfigurationService.init();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ProductProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion Store',
      theme: ThemeData(),
      home: SplashPage(),
    );
  }
}
