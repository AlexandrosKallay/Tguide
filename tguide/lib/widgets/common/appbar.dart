

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tguide/theme.dart';

class MainAppBar extends AppBar {
  final String _stringitle;

  MainAppBar(this._stringitle);


  @override
  _MainAppBarState createState() => _MainAppBarState(_stringitle);
}


class _MainAppBarState extends State<MainAppBar> {
  var imagesVisible = true;
  final String title;

  _MainAppBarState(this.title);


  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(widget._stringitle,
          style: GoogleFonts.jetBrainsMono(
            fontWeight: FontWeight.w900,color: Colors.white),
          ),
        elevation: 10,
        centerTitle: true,
        actions: [
          // Switch(
          //   value: imagesVisible,
          //   activeColor: Colors.yellowAccent,
          //   onChanged: (bool switchState) {
          //     setState(() {
          //       imagesVisible = switchState;
          //     });
          //   },
          // ),
        ]);
  }

}

