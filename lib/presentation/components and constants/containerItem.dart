
import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

class ContainerItem extends StatelessWidget {
  String title;
  double? fontSize;

   ContainerItem({required this. title,this.fontSize,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(blurRadius: 2, color: Color(0x3A75A4FF), spreadRadius: 5),
        ],
        border: Border.all(color: AppColors.borderColor),
        color: Colors.white,

      ),
      child: Center(
        child: Text(title,
        style: TextStyle(
          fontSize:fontSize,
          color: AppColors.darkBlue
        ),),
      ),
    );
  }
}
