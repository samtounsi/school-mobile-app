import 'package:flutter/material.dart';

Widget middle({
  required Widget element,
  MainAxisAlignment alignment= MainAxisAlignment.center
}) =>
    Row(
      mainAxisAlignment: alignment,
      children: [
        Spacer(),
        element,
        Spacer(),
      ],
    );