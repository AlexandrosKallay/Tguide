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
  late StreamSubscription<User?> _sub;
  final _navigatorKey = new GlobalKey<NavigatorState>();
  

  void initState() {
    super.initState();

    _sub = FirebaseAuth.instance.userChanges().listen((event) {
      if (event == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
      _navigatorKey.currentState!.pushReplacementNamed(
        event != null ? 'home' : 'login',
      );
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      initialRoute:
      FirebaseAuth.instance.currentUser == null ? 'login' : 'home',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'home':
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => MyHomeScreen(app: app),
            );
          case 'login':
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => LoginScreen(),
            );
          default:
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => RegistrationScreen(),
            );
        }

      },
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),

    );
  }
}







