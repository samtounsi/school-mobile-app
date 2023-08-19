import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocStudent/cubitStudent.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/homeItem.dart';
import 'package:mobile_schoolapp/presentation/screens/feedBack.dart';
import 'package:mobile_schoolapp/presentation/screens/parent_student_time_table.dart';
import 'package:mobile_schoolapp/presentation/screens/school_calendar.dart';
import 'package:mobile_schoolapp/presentation/screens/student_attendance.dart';
import 'package:mobile_schoolapp/presentation/screens/section_time_table.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherMarksSemesteroneOrtwo.dart';

import '../../business logic/cubits/blocParent/cubitParent.dart';
import '../../business logic/cubits/student_time_table/cubit.dart';
import 'chooseMarksScreen.dart';
import 'exam_schedule_student.dart';

class ParentHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Wallpaper 2.png'), fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 7,
              ),
              InkWell(
                  onTap: () {
                    StudentTimetableCubit.get(context)
                        .getParentStudentTimetable(
                            id: ParentCubit.get(context).childId!)
                        .then(
                            (value) => navigateTo(context, ParentTimeTable()));
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
                  StudentCubit.get(context)
                      .getStudentProfile(
                          id: ParentCubit.get(context).childId!, year: 2023)
                      .then(
                          (value) => navigateTo(context, StudentAttendance()));
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
                  navigateTo(context, TeacherMarksSemesters());
                },
                child: HomeText(
                    text: 'Marks', numS: 22, image: 'images/grade.png'),
              ),
              SizedBox(
                height: 30,
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
                  navigateTo(context, FeedBack());
                },
                child: HomeText(
                  text: 'Send a Feedback',
                  numS: 18,
                  image: 'images/feedback2.png',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: (){
                    StudentTimetableCubit.get(context).getParentStudentTimetable(
                        id:ParentCubit.get(context).childId!)
                        .then((value) =>
                        navigateTo(context, ExamStudentSchedule(grade:StudentCubit.get(context).studentProfileModel?.gradeName)));
                  },
                  child: HomeText(
                      text: 'Exam Schedule', numS: 22,image: 'images/exam2.png')),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: SvgPicture.asset(
                    'images/Back to school-pana ORANGE.svg',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
