import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tguide/services/api_currencies.dart';
import 'package:tguide/theme.dart';
import 'package:tguide/widgets/common/appbar.dart';
import 'package:tguide/widgets/common/maindrawer.dart';

class CurrencyPage extends StatefulWidget {
  static String id = 'MyHome';
  CurrencyPage({Key? key, required this.app}) : super(key: key);
  final FirebaseApp app;

  @override
  _CurrencyPageState createState() => _CurrencyPageState(app);
}

class _CurrencyPageState extends State<CurrencyPage> {
  _CurrencyPageState(this.app);

  ApiClient client = ApiClient();

  final FirebaseApp app;
  var from = 'EUR';
  List<String> currencies=[];
  var to = 'EUR';
  var rate;
  var result = "";
  String dropdownValue = 'EUR';

  @override
  void initState() {
    super.initState();
    (() async {
      List<String> list = await client.getCurrencies();
      setState(() {
        currencies = list;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: MainAppBar("CURRENCY CONVERTER"),
      drawer: Drawer(
        child: MainDrawer(app: app),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(""),
              ),
              Expanded(
                  child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Let's set the text field
                      TextField(
                        onSubmitted:(value) async {
                          rate = await client.getRate(from, to);
                          setState(() {
                            result = (rate * double.parse(value)).toStringAsFixed(2);
                          });

                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.input),
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          labelText: "Input value to convert",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18.0,
                              color: kPrimaryColor),
                          //hintText: "Input Value To Convert",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //create a custom widget for the currencies drop down button
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 4.0,horizontal: 30.0),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: DropdownButton<String>(
                                  menuMaxHeight: null,//check it later
                                  //itemHeight: 30,
                                  dropdownColor: kPrimaryColor,
                                  value: from,
                                  icon: const Icon(Icons.arrow_downward,color: Colors.white),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.white),
                                  underline: Container(
                                    height: 2,
                                    color: kSecondaryColor,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      from = newValue!;
                                    });
                                  },
                                  items: currencies
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  String temp = from;
                                  setState((){
                                    from = to;
                                    to = temp;
                                  });
                                },
                                child: Icon(Icons.swap_horizontal_circle,color: Colors.white),
                                elevation: 0.0,
                                backgroundColor: kPrimaryColor,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 4.0,horizontal: 30.0),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: DropdownButton<String>(
                                  menuMaxHeight: null,
                                  //itemHeight: 30,
                                  dropdownColor: kPrimaryColor,
                                  value: to,
                                  icon: const Icon(Icons.arrow_downward,color: Colors.white),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.white),
                                  underline: Container(
                                    height: 2,
                                    color: kSecondaryColor,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      to = newValue!;
                                    });
                                  },
                                  items: currencies
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Text("Result",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text(result,style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                      )
                    ],
                  ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
