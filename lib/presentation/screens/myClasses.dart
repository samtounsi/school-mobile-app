import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/attendanceCubit/cubit.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/homeItem.dart';
import 'package:mobile_schoolapp/presentation/screens/attendance_for_teacher.dart';
import 'package:mobile_schoolapp/presentation/screens/feedBack.dart';
import 'package:mobile_schoolapp/presentation/screens/show_marks_for_teacher.dart';
import 'package:mobile_schoolapp/presentation/screens/student_attendance.dart';
import 'package:mobile_schoolapp/presentation/screens/section_time_table.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherMarksAddorShow.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherMarksSemesteroneOrtwo.dart';

import '../../business logic/cubits/student_time_table/cubit.dart';

class myClasses extends StatelessWidget {
  String teacherClass;
  myClasses({super.key, required this.teacherClass});
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7, top: 35),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.darkBlue,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45,
            ),
            Column(
              children: [
                InkWell(
                    onTap: () {
                      StudentTimetableCubit.get(context)
                          .getSectionTimetable(gradeSection: teacherClass)
                          .then((value) =>
                              navigateTo(context, SectionTimeTable()));
                    },
                    child: HomeText(
                        text: 'Time Table',
                        numS: 22,
                        image: 'images/schedule.png')),
                SizedBox(
                  height: 20,
                  child: ColoredBox(
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    SectionAttendanceCubit.get(context)
                        .getAbsentStudent(
                            grade: teacherClass,
                            date: SectionAttendanceCubit.get(context).today)
                        .then((value) =>
                            navigateTo(context, SectionAttendance()));
                  },
                  child: HomeText(
                      numS: 22, text: 'Attendance', image: 'images/moitor.png'),
                ),
                SizedBox(
                  height: 20,
                  child: ColoredBox(
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigateTo(
                        context,
                        TeacherMarksSemesters(
                          gradeSection: teacherClass,
                        ));
                  },
                  child: HomeText(
                      text: 'Marks', numS: 22, image: 'images/grade.png'),
                ),
                Center(
                  child: Container(
                    width: 270,
                    height: 270,
                    child: SvgPicture.asset(
                      'images/Classroom-bro (2).svg',
                    ),
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
