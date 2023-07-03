import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';
Widget text(
    String data, {
      double size = 16,
      Color color = Colors.black,
      FontWeight? weight,
    }) {
  return Text(
    data,
    style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight
    ),
  );
}

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
  int max=3,
  double width=340,
  double height=100,
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
    borderRadius: BorderRadius.circular(10),
  ),
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      maxLines: max,

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

Widget myDivider(
{
  Color dividerColor=Colors.grey
}
    ){
  return Padding(
    padding: EdgeInsetsDirectional.symmetric(vertical: 10,),
    child: Container(
      width: double.infinity,
      height: 2.0,
      color: dividerColor,
    ),
  );
}



Widget formFeild({
  double Width =250,
  double height=60,
  double circular=10,
  FocusNode? focusNode,
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  VoidCallback? onTap,
  bool isClickable=true,
  bool ispassword=false,
  VoidCallback? suffixpressed,
  VoidCallback? prefixPressed,
  required String label,
  IconData? prefix,
  required FormFieldValidator validate,
  IconData? suffix,
  int maxlines=2,
  TextStyle? textStyle,
  Color color=Colors.white70,
  Color bordercolor= AppColors.borderColor,
  Color prefixColor=AppColors.aqua,
  bordersidecolor=Colors.white,
  Color labelTextColor=AppColors.aqua,
  Color suffixColor=AppColors.aqua,
  //Color focusColor=Colors.grey,
  double verticalPadding=30,
  double horizontalPadding=0,
  bool isShadow=false
})=>Container(
  width: Width,
  height: height,
  decoration: BoxDecoration(
    border:  Border.all(color: AppColors.shadow),
    boxShadow:  [BoxShadow(blurRadius: 4,
        color: AppColors.shadow,
        spreadRadius: 7)] ,
    color: color,
    borderRadius: BorderRadius.circular(circular),
  ),
  child:TextFormField(
    focusNode: focusNode,
    textDirection: TextDirection.ltr,
    style: textStyle,
    maxLines: maxlines,
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    onTap: onTap,
    enabled: isClickable,
    obscureText: ispassword,
    validator:validate,
    decoration: InputDecoration(
      contentPadding:  EdgeInsets.symmetric(vertical:verticalPadding , horizontal:horizontalPadding ),
      filled: true,
      fillColor: color,
      labelText: label,
      labelStyle: TextStyle(
          color: labelTextColor,
          fontSize: 22
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(circular),
          borderSide: BorderSide(
              color: bordersidecolor,
            //width: 2
          )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(circular),
        borderSide: BorderSide(
            color: bordercolor
        ),
      ),
      prefixIcon: IconButton(
        icon: Icon(prefix,color: prefixColor,size: 30,),
        onPressed: prefixPressed,

      ),
      suffixIcon: suffix != null ? IconButton(icon: Icon(suffix,color: suffixColor,size: 30,),
        onPressed:suffixpressed,) : null,

    ),

  ),
);




Widget formfeild({
  double Width =250,
  double height=60,
  bool readonly=false,
  double circular=10,
  required TextEditingController controller,
  required TextInputType type,
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
  Color color=Colors.white70,
  Color bordercolor= AppColors.borderColor,
  Color prefixColor=AppColors.aqua,
  Color labelTextColor=AppColors.aqua,
  Color suffixColor=AppColors.aqua,
  //Color focusColor=Colors.grey,
  double verticalPadding=30,
  double horizontalPadding=0,
})=>Container(
  width: Width,
  height: height,
  decoration: BoxDecoration(
    border:  Border.all(color: AppColors.shadow),
    color: color,
    borderRadius: BorderRadius.circular(10),
  ),
  child:TextFormField(
    readOnly: readonly,
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
      contentPadding:  EdgeInsets.symmetric(vertical:verticalPadding , horizontal:horizontalPadding ),
      filled: true,
      fillColor: color,
      labelText: label,
      labelStyle: TextStyle(
          color: labelTextColor,
          fontSize: 22
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(circular),
          borderSide: BorderSide(
              color: Colors.grey
          )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(circular),
        borderSide: BorderSide(
            color: bordercolor
        ),
      ),
      prefixIcon: Icon(
        prefix,
        color: prefixColor,
      ),
      suffixIcon: suffix != null ? IconButton(icon: Icon(suffix,color: suffixColor,),
        onPressed:suffixpressed,) : null,

    ),

  ),
);