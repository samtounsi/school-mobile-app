import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/homeItem.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherTimeTable1.dart';


class TeacherHome extends StatelessWidget {
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
              height: 100,
            ),
            InkWell(
              onTap: (){
                navigateTo(context, TeacherTimeTable());
              },
                child: HomeText(
                    text: 'Time Table', numS: 22,image: 'images/schedule.png')),
            SizedBox(
              height: 30,

            ),
            InkWell(
              onTap: (){},
              child: HomeText(
                  text: 'My Classes',  numS: 22,image: 'images/presentation.png'),
            ),
            SizedBox(
              height: 30,
              child: ColoredBox(
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: (){},
                child: HomeText(text: 'Quizzes', numS: 22, image: 'images/exam.png')),
            SizedBox(
              height: 30,

            ),
            InkWell(
              onTap: (){},
              child: HomeText(numS: 18,

                  text: 'Attendance monitoring  ', image: 'images/moitor.png'),
            ),
            SizedBox(
              height: 30,

            ),
            InkWell(
                onTap: (){},
                child: HomeText(text: 'Calender',numS: 22, image: 'images/calendar (1).png')),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SvgPicture.asset(
                'images/Professor-pana.svg',
                width: 200,
                height: 198,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
