import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

Widget defaultTextButton({
  required String text,
  required function,
  required radius,
  double width = 250,
  double height=50,
  Color background = AppColors.lightOrange,
  bool isUpperCase = true,
  double textSize=23,
  Color textColor=Colors.white,
  FontWeight? fontWeight

})=>Container(
  height: height,
  width: width,
  child:   TextButton(
    onPressed: function,
    style: TextButton.styleFrom(
      backgroundColor: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style:TextStyle(
          color: textColor,
          fontSize: textSize,
          fontWeight: fontWeight
      ) ,),),
);


Widget defaultformfeild({
  required TextEditingController controller,
  required TextInputType type,
  double width=340,
  double height=100,
  double radius=10,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  VoidCallback? onTap,
  bool isClickable=true,
  bool ispassword=false,
  VoidCallback? suffixpressed,
  required String label,
   IconData? prefix,
  required FormFieldValidator validate,
  IconData? suffix,
  TextStyle? textStyle,
  Color? color,
  Color bordercolor=Colors.white,
  List<TextInputFormatter>? maxChars
})=>Container(
  width: width,
  height: height,
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    border:  Border.all(color: AppColors.borderColor),
    boxShadow: [BoxShadow(blurRadius: 10,
        color: AppColors.shadow,
        spreadRadius: 20)],
    color: Colors.white,
    borderRadius: BorderRadius.circular(radius),
  ),
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      maxLines: 3,

      inputFormatters: maxChars,

      textDirection: TextDirection.ltr,

      style: textStyle,

      controller: controller,

      keyboardType: type,

      onFieldSubmitted: onSubmit,

      onChanged: onChange,

      onTap: onTap,

      enabled: isClickable,

      obscureText: ispassword,

      validator:validate,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
        border: InputBorder.none,

        filled: true,

        fillColor: color,

        labelText: label,
        labelStyle: TextStyle(

          color: AppColors.darkBlue
        ),
        enabledBorder: OutlineInputBorder(

          borderRadius: BorderRadius.circular(50.0),

          borderSide: BorderSide(

            color: Colors.white

          )

        ),

        prefixIcon: Icon(

          prefix,

        ),

        suffixIcon: suffix != null ? IconButton(icon: Icon(suffix),

          onPressed:suffixpressed,) : null,

      ),



    ),
  ),
);




navigateTo(context,widget)=>Navigator.push(context,
  MaterialPageRoute(
    builder:(context)=>widget,),);

navigateAndFinish(context,widget)=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context)=>widget),
        (route) => false);

Widget myDivider({required Color dividerColor}){
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 20),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    ),
  );
}



