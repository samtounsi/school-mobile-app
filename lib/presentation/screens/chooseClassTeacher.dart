import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/cubitTeacher.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/stateTeacher.dart';
import 'package:mobile_schoolapp/presentation/classes/gradeAndSectionClass.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/screens/myClasses.dart';

import '../../business logic/cubits/attendanceCubit/cubit.dart';
import '../../business logic/cubits/blocMark/cubit.dart';

class ChooseClassTeacher extends StatefulWidget {
  ChooseClassTeacher({Key? key}) : super(key: key);

  @override
  State<ChooseClassTeacher> createState() => _ChooseClassTeacherState();
}

class _ChooseClassTeacherState extends State<ChooseClassTeacher> {
  @override
  void initState() {
    TeacherCubit.get(context).getAllSectionForTeacher();
    super.initState();
  }

  String? gradeValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Wallpaper 2.png'), fit: BoxFit.fill)),
      child: BlocConsumer<TeacherCubit, TeacherState>(
        listener: (context, state) {},
        builder: (context, state) {
          var modelTeacher = TeacherCubit.get(context).getSection;
          return ConditionalBuilder(
            condition: state is! GetListSectionTeacherLoadingState &&
                TeacherCubit.get(context).getSection != null,
            builder: (BuildContext context) {
              return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 35),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppColors.darkBlue,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    Text(
                                      "Choose a class",
                                      style: TextStyle(
                                          color: AppColors.darkBlue,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: 45,
                                ),
                                SvgPicture.asset(
                                    "images/Teacher student-rafiki Orange.svg"),
                                SizedBox(
                                  height: 60,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 20),
                                      child: Container(
                                        width: 320,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 2,
                                                color: Color(0x3A75A4FF),
                                                spreadRadius: 5),
                                          ],
                                          border: Border.all(
                                              color: AppColors.borderColor),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 6,
                                              right: 30,
                                              bottom: 6,
                                              left: 10),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: gradeValue,
                                              hint: Text(
                                                'choose a class',
                                                style: TextStyle(
                                                    color: AppColors.darkBlue),
                                              ),
                                              onChanged: (String? newValue) {
                                                TeacherCubit.get(context)
                                                    .gradeChangeItem(newValue!);

                                                gradeValue =
                                                    TeacherCubit.get(context)
                                                        .currentItem;
                                              },
                                              items: modelTeacher!.section.map<
                                                      DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: AppColors.darkBlue),
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: AppColors.darkBlue,
                                              ),
                                              dropdownColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    TeacherCubit.get(context)
                                        .getAllSectionForTeacher();
                                    SectionAttendanceCubit.get(context).changeGrade(gradeValue);
                                    MarksCubit.get(context).getStudentsNames(gradeSection:gradeValue ).then((value) =>
                                        navigateTo(context, myClasses(teacherClass: gradeValue!,)));
                                    print(gradeValue);
                                  },
                                  child: Text(
                                    'submit',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: AppColors.darkBlue),
                                  ),
                                  color: AppColors.aqua,
                                  minWidth: 230,
                                  height: 48,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                  ),
                                )
                              ],
                            ))
                      ]));
            },
            fallback: (BuildContext context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
