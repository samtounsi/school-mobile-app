
import 'package:flutter/material.dart';

import 'constants.dart';

Widget buildAttendance(text,number)
{

  return Padding(
    padding: EdgeInsetsDirectional.all(10),
    child: Row(
      children: [
        Text(text,
          style: TextStyle(
              fontSize: 28,
              //fontWeight: FontWeight.bold,
              color: AppColors.lightOrange
          ),
        ),
        Container(
          height: 35,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkBlue,width: 2),
            borderRadius: BorderRadius.circular(10.0),

          ),
          child: Center(
            child: Text(number,
              style: TextStyle(
                  fontSize: 25,
                  //fontWeight: FontWeight.bold,
                  color: AppColors.lightOrange
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


