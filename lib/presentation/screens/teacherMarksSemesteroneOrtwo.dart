import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/markItem.dart';
import 'package:mobile_schoolapp/presentation/screens/choose_subject.dart';

import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import 'chooseMarksScreen.dart';

class TeacherMarksSemesters extends StatelessWidget {
  String? gradeSection;
  TeacherMarksSemesters({super.key, this.gradeSection});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Wallpaper 2.png'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      weight: 2,
                      size: 35,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text(
                      'Select Semester',
                      style: TextStyle(
                          color: AppColors.lightOrange,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      onTap: () {
                        navigateTo(
                            context,
                            ChooseMarks(
                              gradeSection: gradeSection,
                              semester: 'first',
                            ));
                      },
                      child: MarkItem(
                        text: 'First Semester',
                        image: 'images/one.png',
                        radius: 35,
                        numS: 25,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      onTap: () {
                        navigateTo(
                            context,
                            ChooseMarks(
                                gradeSection: gradeSection,
                                semester: 'second'));
                      },
                      child: MarkItem(
                        text: 'Second Semester',
                        image: 'images/two.png',
                        radius: 35,
                        numS: 25,
                      )),
                  Spacer(),
                  SvgPicture.asset(
                    'images/Toggle-rafiki (1).svg',
                    height: 350,
                    width: 400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
