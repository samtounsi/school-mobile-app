import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

Widget buildSubject(text) {
  return Padding(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 13),
    child: Container(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.lightOrange),
      ),
    ),
  );
}
