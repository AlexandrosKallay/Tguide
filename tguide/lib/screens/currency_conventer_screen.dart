


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tguide/widgets/common/appbar.dart';
import 'package:tguide/widgets/common/maindrawer.dart';

class CurrencyPage extends StatelessWidget {
  final FirebaseApp app;

  const CurrencyPage({Key? key, required this.app}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar("CURRENCY CONVERTER"),
        drawer: Drawer(
          child:MainDrawer(app: app),
        ),

    );
  }
}
