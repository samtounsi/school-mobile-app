

import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';


import 'components.dart';
import 'constants.dart';

Widget buildQuestion(controller)
{
  return Padding(
    padding: EdgeInsetsDirectional.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        formFeild(
          controller: controller[0],
          type: TextInputType.text,
          Width: 380,
          maxlines: 4,
          circular: 30,
          height: 150,
          bordersidecolor: AppColors.darkBlue,
          bordercolor:AppColors.darkBlue ,
          color: Colors.white,
          label: 'Question statement',
          labelTextColor: AppColors.darkBlue,
          validate: (value) {
            if (value.toString().isEmpty) {
              return 'enter question statement please!!';
            }
          },
        textStyle: TextStyle(
          fontSize: 20,
          color: AppColors.darkBlue
        )
        ),
        SizedBox(height: 30,),
        formFeild(
          controller: controller[1],
          type: TextInputType.text,
          Width: 350,
          height: 120,
          circular: 30,
          maxlines: 3,
          label: 'add correct answer',
          labelTextColor: AppColors.lightOrange,
          bordersidecolor: AppColors.borderColor,
          bordercolor:AppColors.borderColor ,
          color: Colors.white,
          validate: (value) {
            if (value.toString().isEmpty) {
              return 'enter the correct answer please!!';
            }
          },
            textStyle: TextStyle(
                fontSize: 20,
                color: AppColors.lightOrange
            )
        ),
        SizedBox(height: 30,),
        Row(
          children: [
            Icon(
              Mdi.alphaACircleOutline,
              color: AppColors.lightOrange,
              size: 40,
            ),
            SizedBox(width: 10,),
            formFeild(
              controller: controller[2],
              type: TextInputType.text,
              Width: 290,
              height: 120,
              circular: 30,
              maxlines: 3,
              label: 'add first option',
              labelTextColor: AppColors.darkBlue,
              bordersidecolor: Colors.white,
              bordercolor:Colors.white ,
              color: Colors.white,
              validate: (value) {
                if (value.toString().isEmpty) {
                  return 'enter first option please!!';
                }
              },
              textStyle: TextStyle(
                  fontSize: 20,
                  color: AppColors.darkBlue
              ),
            ),
          ],
        ),
        SizedBox(height:30,),
        Row(
          children: [
            Icon(
            Mdi.alphaBCircleOutline,
              color: AppColors.lightOrange,
              size: 40,
            ),
            SizedBox(width: 10,),
            formFeild(
              textStyle: TextStyle(
                  fontSize: 20,
                  color: AppColors.darkBlue
              ),
              controller: controller[3],
              type: TextInputType.text,
              Width: 290,
              height: 120,
              circular: 30,
              maxlines: 3,
              label: 'add second option',
              labelTextColor: AppColors.darkBlue,
              bordersidecolor: Colors.white,
              bordercolor:Colors.white ,
              color: Colors.white,
              validate: (value) {
                if (value.toString().isEmpty) {
                  return 'enter second option please!!';
                }
              }
                ,),
          ],
        ),
        SizedBox(height:30,),
        Row(
          children: [
            Icon(
              Mdi.alphaCCircleOutline,
              color: AppColors.lightOrange,
              size: 40,
            ),
            SizedBox(width: 10,),
            formFeild(
              controller: controller[4],
              type: TextInputType.text,
              Width: 290,
              height: 120,
              circular: 30,
              maxlines: 3,
              bordersidecolor: Colors.white,
              bordercolor:Colors.white ,
              color: Colors.white,
              label: 'add third option',
              labelTextColor: AppColors.darkBlue,
              validate: (value) {
                if (value.toString().isEmpty) {
                  return 'enter third option please!!';
                }
              },
              textStyle: TextStyle(
                  fontSize: 20,
                  color: AppColors.darkBlue
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


Widget buildTitle({required label})
{
  return Padding(
    padding: EdgeInsetsDirectional.symmetric(vertical: 20.0),
    child: Text(label,
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: AppColors.lightOrange
      ),
    ),
  );
}

Widget buildButton(
    {
      required String name,
      double width=220,
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
      borderRadius: BorderRadius.circular(50),

    ),
    child: Center(
      child: Text(
        name,
        maxLines: 1,
        style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: AppColors.lightOrange
        ),
      ),
    ),
  );
}
