
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tguide/size_config.dart';

class RestaurantImageWidget extends StatelessWidget {
  const RestaurantImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(81),
      child: Card( semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          errorWidget: (context,url,err) =>
              Center(child: Icon(Icons.image),),
          progressIndicatorBuilder: (context,url,downloadProgress) =>
              Center(child: CircularProgressIndicator(),
              ),
        ),
      ),
    );
  }
}

class DestinationImageWidget extends StatelessWidget {
  const DestinationImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(70),
      child: CachedNetworkImage(
          colorBlendMode: BlendMode
              .saturation,
          height: getProportionateScreenWidth(75),
          width: getProportionateScreenWidth(75),
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          errorWidget: (context,url,err) =>
              Center(child: Icon(Icons.image),),
          progressIndicatorBuilder: (context,url,downloadProgress) =>
              Center(child: CircularProgressIndicator(),
              ),
        ),
        // child: CachedNetworkImage(
        //   imageUrl: imageUrl,
        //   fit: BoxFit.cover,
        //   errorWidget: (context,url,err) =>
        //       Center(child: Icon(Icons.image),),
        //   progressIndicatorBuilder: (context,url,downloadProgress) =>
        //       Center(child: CircularProgressIndicator(),
        //       ),
        // ),
    );
  }
}




class RestaurantInfoWidget extends StatelessWidget {
  const RestaurantInfoWidget({
    Key? key,
    required this.name, required this.address
  }) : super(key: key);

  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding:  EdgeInsets.all(getProportionateScreenWidth(2)),
        width: double.infinity,
        child: Column(
          children: [
            Text(name, style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.w900),
            ),
            Text(address, style: GoogleFonts.jetBrainsMono(
              fontWeight: FontWeight.w400,
              fontSize:12,
            ),
            ),
          ],
        ),
      ),
    );
  }
}