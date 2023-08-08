// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocStudent/cubitStudent.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocStudent/stateStudent.dart';
//import 'package:mobile_schoolapp/business%20logic/cubits/blocStudent/cubitStudent.dart';
//import 'package:mobile_schoolapp/business%20logic/cubits/blocStudent/stateStudent.dart';
import 'package:mobile_schoolapp/data/models/student_profile_model.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';
//import 'package:mobile_schoolapp/presentation/screens/attendance_for_teacher.dart';

import '../../business logic/cubits/blocAttendance/cubit.dart';
import '../../business logic/cubits/blocAttendance/states.dart';
import '../components and constants/constants.dart';

class StudentAttendance extends StatelessWidget {
  StudentAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentState>(
      listener: (context, state) {
        if (state is GetStudentProfileErrorState) {
          print(state.error.toString());
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                ),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: 20,
                //     ),
                //     Text(
                //       'Present:',
                //       style: TextStyle(
                //           fontSize: 25,
                //           color: AppColors.lightOrange,
                //           fontWeight: FontWeight.bold),
                //     ),
                //     SizedBox(
                //       width: 30,
                //     ),
                //     //present days show
                //     Container(
                //       width: 90,
                //       height: 33,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(5),
                //         color: Colors.white,
                //         border: Border.all(
                //           color: AppColors.darkBlue,
                //           width: 2,
                //         ),
                //       ),
                //       child: Center(
                //         child: ConditionalBuilder(
                //           condition: state is! StudentAttendanceLoadingState,
                //           builder: (context) => Text(
                //             (presentDays! >= 0)?
                //             '${presentDays.toString()}' : '!!',
                //             style: TextStyle(
                //             fontSize: 22, color: AppColors.darkBlue),
                //           ),
                //           fallback: (context) => Container(width: 25, height: 25, child: CircularProgressIndicator()),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 20,
                //     ),
                //     Text(
                //       'days.',
                //       style: TextStyle(fontSize: 19, color: AppColors.darkBlue),
                //     ),
                //   ],
                // ),

                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Absence:',
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColors.lightOrange,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //Absent days show
                    Container(
                      width: 90,
                      height: 33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.darkBlue,
                          width: 2,
                        ),
                      ),
                      child: Center(
                          child: ConditionalBuilder(
                        condition: state is! StudentAttendanceLoadingState,
                        builder: (context) => Text(
                          '${StudentCubit.get(context).studentProfileModel!.numberOfAbsenceDays}',
                          style: TextStyle(
                              fontSize: 22, color: AppColors.darkBlue),
                        ),
                        fallback: (context) => Container(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator()),
                      )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'days.',
                      style: TextStyle(fontSize: 19, color: AppColors.darkBlue),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.all(20),
                  child: Text(
                    'Dates of Absence:',
                    style: TextStyle(
                        color: AppColors.lightOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                //list of absent days
                Container(
                  //alignment: Alignment.topCenter,
                  //height: 400,
                  child: Expanded(
                    child: ConditionalBuilder(
                      condition: state is! StudentAttendanceLoadingState,
                      builder: (context) => ConditionalBuilder(
                        condition: StudentCubit.get(context)
                            .studentProfileModel!
                            .absences
                            .isNotEmpty,
                        builder: (context) => ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => buildItem(
                              StudentCubit.get(context)
                                  .studentProfileModel!
                                  .absences[index]),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ),
                          itemCount: StudentCubit.get(context)
                              .studentProfileModel!
                              .numberOfAbsenceDays,
                        ),
                        fallback: (context) => text('No Absent Days',
                            color: AppColors.darkBlue, size: 22),
                      ),
                      fallback: (context) => Center(
                          child: Container(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator())),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/head.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 45.0,
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.darkBlue,
                        size: 30,
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Attendance',
                    style: TextStyle(fontSize: 24, color: AppColors.darkBlue),
                  ),
                  Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(DateTime date) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 50.0),
      child: Row(
        children: [
          Container(
            width: 300,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              border: Border.all(color: AppColors.darkBlue, width: 2),
            ),
            child: Center(
                child: Text(
              '${date.day} / ${date.month} / ${date.year}',
              style: TextStyle(fontSize: 22, color: AppColors.darkBlue),
            )),
          ),
        ],
      ),
    );
  }
}
