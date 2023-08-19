import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocStudent/cubitStudent.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/containerItem.dart';
import 'package:mobile_schoolapp/presentation/screens/choose_subject.dart';
import 'package:mobile_schoolapp/presentation/screens/choose_year_student.dart';
import 'package:mobile_schoolapp/presentation/screens/show_marks_for_student.dart';

import '../../business logic/cubits/blocMark/cubit.dart';
import '../../business logic/cubits/blocParent/cubitParent.dart';

class ChooseMarks extends StatelessWidget {
  String? gradeSection;
  String semester;
  ChooseMarks({super.key, this.gradeSection, required this.semester});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/Wallpaper 2.png'),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.darkBlue,
                        size: 35,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 70,
                right: 40,
                top: 50,
              ),
              child: Column(
                children: [
                  SvgPicture.asset('images/Learning-pana BLUE.svg'),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        if (type == 'teacher') {
                          navigateTo(
                              context,
                              SubjectsScreen(
                                gradeSection: gradeSection,
                                semester: semester,
                                typeOfExam: 'monthly_test',
                              ));
                        }
                        if (type == 'student') {
                          StudentCubit.get(context).getYears(studentId: profileId).then((value)
                          => navigateTo(context, ChooseYear(semester: semester,examType:'monthly_test' ,)));
                        }
                        if (type == 'parent') {
    StudentCubit.get(context).getYears(studentId: ParentCubit.get(context).childProfileId).then((value)
    {
      print(ParentCubit.get(context).childId);
      navigateTo(context, ChooseYear(semester: semester,examType:'monthly_test' ,));
    });
                      }},
                      child: ContainerItem(
                        title: 'Monthly Test Marks',
                        fontSize: 25,
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      if (type == 'taecher') {
                        navigateTo(
                            context,
                            SubjectsScreen(
                              gradeSection: gradeSection,
                              semester: semester,
                              typeOfExam: 'final',
                            ));
                      }
                      if (type == 'student') {
                        print(id);
                        StudentCubit.get(context).getYears(studentId: profileId).then((value)
                        =>
                        navigateTo(context, ChooseYear(semester: semester,examType:'final' ,)));
                      }

                      if (type == 'parent') {
                        StudentCubit.get(context).getYears(studentId:ParentCubit.get(context).childProfileId).then((value)
                        =>
                            navigateTo(context, ChooseYear(semester: semester,examType:'final' ,)));
                      }
                    },
                    child: ContainerItem(
                      title: 'Final Marks',
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
