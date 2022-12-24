import 'package:flutter/material.dart';

// My imports
import 'src/homepage/homepage.dart';
import 'src/login/login_page.dart';
import 'src/login/splash_page.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),//const MyHomePage(), //SplashScreen(), //
    );
  }
}

