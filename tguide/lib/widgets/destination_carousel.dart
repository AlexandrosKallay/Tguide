import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tguide/const/const.dart';
import 'package:tguide/models/destination_model.dart';
import 'package:tguide/models/restaurant_model.dart';
import 'package:tguide/theme.dart';
import 'package:tguide/view_model/main_view_model_imp.dart';
import 'package:tguide/widgets/common/common_widgets.dart';
import 'package:tguide/widgets/main/main_widgets.dart';

import '../size_config.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final viewModel = MainViewModelImp();

    return Column(
      children: <Widget> [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Text('Top Destinations',
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
          height: getProportionateScreenWidth(120),
          child: FutureBuilder(
              future: viewModel.displayRestaurantList(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator(),); //temp
                else {
                  var lst = snapshot.data as List<RestaurantModel>;
                  return Container(margin: const EdgeInsets.only(top: 5),
                      child: LiveList(
                        showItemDuration: Duration(milliseconds: 350),
                        showItemInterval: Duration(milliseconds: 150),
                        reAnimateOnVisibility: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: lst.length,
                        itemBuilder: animationItemBuilder((index) =>
                            InkWell(
                              onTap: () {},
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.all(
                                      getProportionateScreenWidth(5.0)),
                                  width: getProportionateScreenWidth(85),
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: <Widget>[
                                      Positioned(
                                        bottom: getProportionateScreenWidth(6),
                                        child: Container(
                                          height: getProportionateScreenWidth(
                                              60),
                                          width: getProportionateScreenWidth(
                                              85),
                                          decoration: myDestinationBoxDecoration(
                                              context),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                getProportionateScreenWidth(3)),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .end,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Text("${lst.length} activities",
                                                  style: TextStyle(
                                                    //color: Colors.black ,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                                Text(lst[index].phone,
                                                  style: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          decoration: myDestinationBoxDecoration(
                                              context),
                                          child: Stack(
                                              children: <Widget>[
                                                Hero(
                                                  tag: lst[index].imageUrl,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius
                                                        .circular(20.0),
                                                    child: DestinationImageWidget(imageUrl: lst[index].imageUrl),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: getProportionateScreenWidth(
                                                      5),
                                                  bottom: getProportionateScreenWidth(
                                                      5),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: <Widget>[

                                                      Text(
                                                        lst[index].name,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                          fontWeight: FontWeight
                                                              .w600,
                                                          letterSpacing: 1.2,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Icon(
                                                            FontAwesomeIcons
                                                                .locationArrow,
                                                            size: 14.0,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(
                                                              width: getProportionateScreenWidth(
                                                                  5)),
                                                          Text(
                                                            lst[index].address,
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              color: Colors
                                                                  .white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      )
                  );
                }
              }),
        )
      ],
    );
  }

}