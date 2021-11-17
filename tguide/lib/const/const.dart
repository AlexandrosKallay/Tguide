import 'package:flutter/material.dart';

final RESTAURANT_REF = 'Restaurant';

BoxDecoration myDestinationBoxDecoration(BuildContext context) => BoxDecoration(
  color: Colors.white, //Theme.of(context).primaryColor,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: Theme.of(context).hintColor.withOpacity(0.15),
      offset: const Offset(0, 3),
      blurRadius: 2,
    ),
  ],
);

BoxDecoration myHotelBoxDecoration(BuildContext context) => BoxDecoration(
  color: Colors.white, //Theme.of(context).primaryColor,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: Theme.of(context).hintColor.withOpacity(0.15),
      offset: const Offset(0.0, 3.0),
      blurRadius: 2.0,
    ),
  ],
);