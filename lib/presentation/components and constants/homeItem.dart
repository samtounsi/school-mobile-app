import 'package:flutter/material.dart';

import 'constants.dart';

class HomeText extends StatelessWidget {
  String text;
  String image;
  double? numS = 22;

  HomeText({
    Key? key,
    required this.text,
    required this.image,
    this.numS,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 80,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(blurRadius: 2, color: Color(0x3A75A4FF), spreadRadius: 5)
        ],
        color: Colors.white,
        // color: Color(0xF3F5F5F6),
        borderRadius: BorderRadius.circular(80), //10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(
              text,
              style: TextStyle(fontSize: numS, color: AppColors.darkBlue),
            ),
          ),
          Container(
            height: 75,
            width: 45,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
              scale: 0.9,
            ),
          ),
        ],
      ),
    );
  }
}
