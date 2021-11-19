import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tguide/screens/home_screen.dart';
import 'package:tguide/screens/login_screen.dart';
import 'package:tguide/screens/registration_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp(app:app));
}


class MyApp extends StatefulWidget {
  final FirebaseApp app;

  const MyApp({Key? key, required this.app}) : super(key: key);

  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState(app);
}

class _MyAppState extends State<MyApp> {
  final FirebaseApp app;
  _MyAppState(this.app);
  

  late StreamSubscription<User?> user;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:
      FirebaseAuth.instance.currentUser == null ? LoginScreen.id : MyHomeScreen.id,

      ///key value pair
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        MyHomeScreen.id: (context) => MyHomeScreen(app: app),
      },
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),

    );
  }
}







