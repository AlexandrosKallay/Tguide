import 'package:flutter/material.dart';
import 'package:tguide/theme.dart';


Widget customDropDown(List<String>items, void onChange(val),String dropdownValue){

  String dropdownValue = 'EUR';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0,horizontal: 18.0),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<String>(
        menuMaxHeight: 200,
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: kPrimaryColor),
        underline: Container(
          height: 2,
          color: kSecondaryColor,
        ),
        onChanged: (String? newValue) {
          onChange(newValue);
        },
        items: items
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
}
