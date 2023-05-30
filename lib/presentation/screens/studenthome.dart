import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/homeItem.dart';


class StudentHome extends StatelessWidget {
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
              height: 140,
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
                child: HomeText(numS:22,text: 'Quizzes', image: 'images/exam.png')),
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
              child: ColoredBox(
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: (){},
                child: HomeText(text: 'Calender',numS: 22, image: 'images/calendar (1).png')),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                 height: 200,
                  child: SvgPicture.asset(
                    'images/Kids Studying from Home-pana BLUE.svg',


                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
