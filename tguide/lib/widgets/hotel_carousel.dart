import 'package:flutter/material.dart';
import 'package:tguide/const/const.dart';
import 'package:tguide/models/hotel_model.dart';
import 'package:tguide/theme.dart';

import '../size_config.dart';

class HotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Text('Recommended',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    //color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: ()=> print('See All'),

                  child: Text('See All',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                )
              ]
          ),
        ),
        Container(
          height: getProportionateScreenWidth(110),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (BuildContext context, int index){
                Hotel hotel = hotels[index];
                return Container(
                  margin: EdgeInsets.all(getProportionateScreenWidth(5.0)),
                  width: getProportionateScreenWidth(100),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget> [
                      Positioned(
                        bottom: getProportionateScreenWidth(6),
                        child: Container(
                          height: getProportionateScreenWidth(50),
                          width: getProportionateScreenWidth(100),
                          decoration: myHotelBoxDecoration(context),
                          child: Padding(
                            padding: EdgeInsets.all(getProportionateScreenWidth(3)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(hotel.name,
                                  style: TextStyle(
                                    //color: Colors.black ,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                SizedBox(height: getProportionateScreenWidth(1)),
                                Text(hotel.address,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: getProportionateScreenWidth(1)),
                                Text('\$${hotel.price} / Night',
                                  style: TextStyle(
                                      fontSize: 12,
                                      //color: Colors.black,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          decoration: myHotelBoxDecoration(context),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: getProportionateScreenWidth(55),
                              width: getProportionateScreenWidth(95),
                              image: AssetImage(hotel.imageUrl),
                              colorBlendMode: BlendMode.color,
                              fit: BoxFit.cover,
                            ),
                          )
                      )
                    ],
                  ),
                );
              }
          ),
        )
      ],
    );
  }
}