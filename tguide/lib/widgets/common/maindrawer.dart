import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tguide/models/user_model.dart';
import 'package:tguide/screens/currency_conventer_screen.dart';
import 'package:tguide/screens/home_screen.dart';
import 'package:tguide/screens/login_screen.dart';
import 'package:tguide/theme.dart';




class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key, required this.app}) : super(key: key);
  final FirebaseApp app;

  @override
  _MainDrawerState createState() => _MainDrawerState(app);
}

class _MainDrawerState extends State<MainDrawer>{


  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final FirebaseApp app;

  _MainDrawerState(this.app);


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
    return _buildDrawer(context);
  }


  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () async {
        await FirebaseAuth.instance.signOut();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout"),
      content: Text("Are you sure you want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://i.stack.imgur.com/l60Hf.png",),
            ),
            accountEmail: Text('${loggedInUser.email}',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w800,
              ),),
            accountName: Text(
              "${loggedInUser.firstName} ${loggedInUser.secondName}",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            // child: Text('Drawer Header'),
          ),
          ListTile(
            leading: const Icon(Icons.house),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 15.0),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>  MyHomeScreen(app: app),
                ),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.apartment),
          //   title: const Text(
          //     'Apartments',
          //     style: TextStyle(fontSize: 24.0),
          //   ),
          //   onTap: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute<void>(
          //         builder: (BuildContext context) => const MyHomePage(
          //           title: 'Apartments',
          //         ),
          //       ),
          //     );
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: const Text(
              'Currency Converter',
              style: TextStyle(fontSize: 15.0),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => CurrencyPage(app: app),
                ),
              );
            },
          ),
          const Divider(
            height: 10,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 15.0),
            ),
            onTap: () {

            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 15.0),
            ),
            onTap: () {

            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 15.0),
            ),
            onTap: () {
              showAlertDialog(context);
            },
          ),
        ],
      ),
    );
  }



}