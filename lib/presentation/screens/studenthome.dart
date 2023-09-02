import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/student_time_table/cubit.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/homeItem.dart';
import 'package:mobile_schoolapp/presentation/screens/school_calendar.dart';
import 'package:mobile_schoolapp/presentation/screens/studentHistoryQuizOrNew.dart';
import 'package:mobile_schoolapp/presentation/screens/student_attendance.dart';
import 'package:mobile_schoolapp/presentation/screens/student_time_table.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherMarksSemesteroneOrtwo.dart';

import '../../business logic/cubits/blocStudent/cubitStudent.dart';
import 'exam_schedule_student.dart';

class StudentHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Wallpaper 2.png'), fit: BoxFit.fill)),
        child: Column(
          children: [
            SizedBox(
              height: 110,
            ),
            InkWell(
                onTap: () {
                  StudentTimetableCubit.get(context)
                      .getStudentTimetable()
                      .then((value) => navigateTo(context, StudentTimeTable()));
                },
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
              onTap: () {
                navigateTo(context, StudentAttendance());
              },
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
                onTap: () {
                  navigateTo(context, StudentQuizzesNewOrHistory());
                },
                child: HomeText(
                    numS: 22, text: 'Quizzes', image: 'images/exam.png')),
            SizedBox(
              height: 30,
              child: ColoredBox(
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {
                navigateTo(context, TeacherMarksSemesters());
              },
              child:
                  HomeText(text: 'Marks', numS: 22, image: 'images/grade.png'),
            ),
            SizedBox(
              height: 30,
              child: ColoredBox(
                color: Colors.white,
              ),
            ),
            InkWell(
                onTap: () {
                  navigateTo(context, SchoolCalendarScreen());
                },
                child: HomeText(
                    text: 'Calender',
                    numS: 22,
                    image: 'images/calendar (1).png')),
            SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  navigateTo(
                      context,
                      ExamStudentSchedule(
                          grade: StudentCubit.get(context)
                              .studentProfileModel
                              ?.gradeName));
                },
                child: HomeText(
                    text: 'Exam Schedule',
                    numS: 22,
                    image: 'images/exam2.png')),
            SizedBox(
              height: 30,
            ),
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
