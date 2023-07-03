

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'components.dart';
import 'constants.dart';

Widget buildMarksHeaderItem(
{
  required String name,
   double width=180,
  Color color=Colors.white

}
    )
{
  return Container(
    width: width,
    height: 60,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border:  Border.all(color: AppColors.shadow),
      boxShadow: [BoxShadow(blurRadius: 4,
          color: AppColors.shadow,
          spreadRadius: 7)],
      color: color,
      borderRadius: BorderRadius.circular(10),

    ),
    child: Center(
      child: Text(
        name,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColors.darkBlue
        ),
      ),
    ),
  );
}


Widget buildMarksItem(
{
  required String name,
  required String obt,
  required String max
}
    )
{
  return Padding(
      padding: EdgeInsetsDirectional.only(start: 15,end:15,top: 10),
    child: Container(
      width:350,
      height:60,
      child: Row(
        children: [
          buildMarksHeaderItem(
              name: name,
              color: Colors.white
          ),
          SizedBox(width: 20,),
          buildMarksHeaderItem(
              width: 65,
              name: obt,
              color: Colors.white
          ),
          SizedBox(width: 20,),
          buildMarksHeaderItem(
              width: 65,
              name: max,
              color: Colors.white
          ),
        ],
      ),
    ),
  );
}



Widget addMarks({required student,required markController})
{
  return Padding(
    padding: EdgeInsetsDirectional.only(start: 10,end:30,top: 30),
    child: Container(
      width:350,
      height:60,
      child: Row(
        children: [
          buildMarksHeaderItem(
              name: student,
              color: Colors.white
          ),
          SizedBox(width: 20,),
          defaultformfeild(
            controller: markController,
            type: TextInputType.number,

            label:'mark' ,
            height: 60,
            width: 120,
            validate:(value) {
              if (value.toString().isEmpty) {
                return 'enter student\'s mark';
              }
            },
            textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.darkBlue
            ),
            color: Colors.white,

          ),
        ],
      ),
    ),
  );
}