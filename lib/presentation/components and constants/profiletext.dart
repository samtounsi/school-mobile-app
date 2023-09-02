import 'package:flutter/material.dart';
import 'constants.dart';

class ProfileText extends StatelessWidget {
  String text1;
  String text2;

  ProfileText({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: AppColors.lightOrange),
        ),
        SizedBox(
          height: 17,
        ),
        Container(
          width: 340,
          height: 85,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: AppColors.shadow, spreadRadius: 15)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              text2,
              style: const TextStyle(
                color: AppColors.darkBlue,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
