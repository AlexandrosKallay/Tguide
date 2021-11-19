
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tguide/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tguide/size_config.dart';
import 'package:tguide/strings/main_strings.dart';
import 'package:tguide/view_model/main_view_model_imp.dart';
import 'package:tguide/widgets/common/appbar.dart';

import 'package:tguide/widgets/common/maindrawer.dart';
import 'package:tguide/widgets/destination_carousel.dart';
import 'package:tguide/widgets/hotel_carousel.dart';

import 'package:tguide/widgets/restaurant_carousel.dart';


class MyHomeScreen extends StatefulWidget {
  static String id = 'MyHome';
  MyHomeScreen({Key? key, required this.app}) : super(key: key);
  final FirebaseApp app;
  final viewModel = MainViewModelImp();

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState(app);
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  final FirebaseApp app;
  final viewModel = MainViewModelImp();

  _MyHomeScreenState(this.app);

  //get current user
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: MainAppBar('HOME'),
        drawer: Drawer(
            child:MainDrawer(app: app),
        ),
        body: SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverFixedExtentList(
                  itemExtent: getProportionateScreenWidth(145),
                  delegate: SliverChildListDelegate(
                    [
                      RestaurantCarousel(),
                      DestinationCarousel(),
                      HotelCarousel(),
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}