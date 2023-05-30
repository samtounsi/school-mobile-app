import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/homeItem.dart';
import 'package:mobile_schoolapp/presentation/screens/feedBack.dart';

class myClasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Wallpaper 2.png'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            InkWell(
                onTap: () {},
                child: HomeText(
                    text: 'Time Table',
                    numS: 22,
                    image: 'images/schedule.png')),
            SizedBox(
              height: 30,
              child: ColoredBox(
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {},
              child: HomeText(
                  numS: 18,
                  text: 'Attendance monitoring ',
                  image: 'images/moitor.png'),
            ),
            SizedBox(
              height: 30,
              child: ColoredBox(
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {},
              child:
                  HomeText(text: 'Marks', numS: 22, image: 'images/grade.png'),
            ),
            Center(
              child: Container(
                width: 300,
                height: 300,
                child: SvgPicture.asset(
                  'images/Classroom-bro (2).svg',
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
