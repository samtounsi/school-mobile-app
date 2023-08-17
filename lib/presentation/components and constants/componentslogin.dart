import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

Widget defaultButton({
  required String text,
  Color color = AppColors.aqua,
  required void Function()? onPressed,
}) =>
    MaterialButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
      color: color,
      minWidth: 292,
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(17)),
      ),
    );

Widget middleInRow({
  required Widget element,
}) =>
    Row(
      children: [
        Spacer(),
        element,
        Spacer(),
      ],
    );

Widget defultTextFormField({
  TextEditingController? controller,
  TextInputType? kType,
  String? text,
  FormFieldValidator? validate,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  bool isPassword = false,
  IconData? sufIcon,
  VoidCallback? onSufPressed,
}) =>
    Container(
      width: 311,
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(17)),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        obscureText: isPassword,
        validator: validate,
        controller: controller,
        keyboardType: kType,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 20,
          color: AppColors.darkBlue,
        ),
        cursorColor: AppColors.blue,
        decoration: InputDecoration(
          isDense: true,
          hintText: text,
          suffixIcon: IconButton(
              onPressed: onSufPressed,
              icon: Icon(
                sufIcon,
                color: AppColors.blue,
                size: 27,
              )),
          labelStyle: TextStyle(color: AppColors.blue),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.0),
              borderSide: BorderSide(color: AppColors.blue, width: 2)),
          enabled: true,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.0),
              borderSide:
                  BorderSide(color: AppColors.blue.withOpacity(1), width: 2)),
        ),
      ),
    );


