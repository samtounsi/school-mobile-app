import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/homeItem.dart';
import 'package:mobile_schoolapp/presentation/screens/feedBack.dart';


class ParentHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Wallpaper 2.png'),
                fit: BoxFit.fill)),
        child: Column(

          children: [
            SizedBox(
              height:120,
            ),
            InkWell(
                onTap: (){},
                child: HomeText(
                    text: 'Time Table',numS: 22, image: 'images/schedule.png')),
            SizedBox(
              height: 30,
              child: ColoredBox(
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: (){},
              child: HomeText(
                  numS: 18,
                  text: 'Attendance monitoring ', image: 'images/moitor.png'),
            ),
            SizedBox(
              height: 30,
              child: ColoredBox(
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: (){},
              child: HomeText(
                  text: 'Marks',numS: 22, image: 'images/grade.png'),
            ),
            SizedBox(
              height: 30,

            ),
            InkWell(
                onTap: (){},
                child: HomeText(text: 'Calender',numS: 22, image: 'images/calendar (1).png')),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                navigateTo(context, FeedBack());
              },
              child: HomeText(text: 'Send a Feedback',numS: 18,image: 'images/feedback2.png',),
            ),
            SizedBox(height: 40,),

            Center(
              child: Container(
                width: 200,
                height: 200,
                child: SvgPicture.asset(
                  'images/Back to school-pana ORANGE.svg',


                ),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
