
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:tguide/models/restaurant_model.dart';
import 'package:tguide/size_config.dart';
import 'package:tguide/theme.dart';
import 'package:tguide/view_model/main_view_model_imp.dart';
import 'package:tguide/widgets/common/common_widgets.dart';
import 'package:tguide/widgets/main/main_widgets.dart';

class RestaurantCarousel extends StatelessWidget {
  const RestaurantCarousel({
    Key? key,
}) : super (key: key);
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
                Text('Top Restaurants',
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
              else
              {
                var lst = snapshot.data as List<RestaurantModel>;
                return Container(margin: const EdgeInsets.only(top: 0),
                  child: LiveList(
                    showItemDuration: Duration(milliseconds: 350),
                    showItemInterval: Duration(milliseconds: 150),
                    reAnimateOnVisibility: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: lst.length,
                    itemBuilder: animationItemBuilder((index)=> InkWell(
                      onTap: (){},
                      child: Container(
                        width:getProportionateScreenWidth(140),      //double.infinity,
                        height:  getProportionateScreenWidth(100),   //MediaQuery.of(context).size.height/1.5*1.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            RestaurantImageWidget(imageUrl: lst[index].imageUrl),
                            RestaurantInfoWidget(name: lst[index].name, address:lst[index].address),
                          ],
                        ),
                      ),
                    )),
                  ),
                );
              }
            },
          )
        )
      ],
    );

  }
}

