
import 'package:flutter/material.dart';

import 'constants.dart';

Widget buildDropdown(
    {
      double width= 160,
      required String label,
      required List list,
      Text? hintText,
      // required List<DropdownMenuItem<Object>>? list,
      required ValueChanged<Object?>? onChanged,
      required int maxLength,
      Object? value,
      Color labelColor=AppColors.darkBlue
    }
    ){

  return Padding(
    padding: EdgeInsetsDirectional.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: labelColor
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(7)),
          child: DropdownButton(
            value: value,
            hint: hintText,
            items: list.map((option) {
              return DropdownMenuItem(
                child: Text("$option"),
                value: option,
              );
            }).toList(),
            onChanged: onChanged
            ,
            icon: Padding(
              //Icon at tail, arrow bottom is default icon
                padding: EdgeInsets.only(
                    left: 20, right: 10),
                child: Icon(
                  Icons.arrow_drop_down,
                  color:
                  AppColors.darkBlue,
                )),
            style: TextStyle(
                fontSize: 20,
                color: AppColors.darkBlue
            ),
            dropdownColor:
            Colors.white,
            //dropdown background color
            underline: Container(),
            //remove underline
            isExpanded:
            true, //make true to make width 100%
          ),
        ),
      ],
    ),
  );
}