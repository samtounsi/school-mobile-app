import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

class TimeTableTeacherItem extends StatelessWidget {
  String day;

  TimeTableTeacherItem({super.key, required this.day});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.borderColor),
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 2, color: Color(0x3A75A4FF), spreadRadius: 5)
        ],
      ),
      child:Center(
        child: Text(day,
        style: TextStyle(
          color: AppColors.darkBlue,
          fontSize: 35,
          fontWeight: FontWeight.w500
        ),),
      ) ,
    );
  }
}
