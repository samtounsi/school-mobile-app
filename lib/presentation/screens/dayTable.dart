import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/cubitTeacher.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/stateTeacher.dart';
import 'package:mobile_schoolapp/presentation/classes/dayNameItem.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

class DayTable extends StatefulWidget {
  Items name;


  DayTable({required this.name, Key? key}) : super(key: key);

  @override
  State<DayTable> createState() => _DayTableState();
}

class _DayTableState extends State<DayTable> {
  @override
  void initState() {
    // print(widget.day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Wallpaper 2.png'), fit: BoxFit.fill),
        ),
        child: BlocConsumer<TeacherCubit, TeacherState>(
          builder: (BuildContext context, state) {
            if(state is TeacherTimeTableErrorState)
              {
                return Scaffold(body:Center(child: Text("Not Exist"
                    "",style: TextStyle(
                  fontSize: 30,
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w700
                ),
                )));
              }
            return ConditionalBuilder(
              condition: state is! TeacherTimeTableLoadingState&&TeacherCubit.get(context).teacherTimeT!=null,
              builder: (BuildContext context) {
                var modelTeacherTime = TeacherCubit.get(context).teacherTimeT;
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
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
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.name.dayTable}',
                              style: TextStyle(
                                  color: AppColors.lightOrange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                          ),
                          child: ListView.separated(
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                            itemCount: modelTeacherTime!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, right: 20, left: 20, bottom: 10),
                                child: Container(
                                  width: 290,
                                  height: 165,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color: Color(0x3A75A4FF),
                                            spreadRadius: 5)
                                      ],
                                      border: Border.all(
                                          color: AppColors.borderColor),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 26, top: 21),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'class:',
                                              style: TextStyle(
                                                  color: AppColors.darkBlue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      '${modelTeacherTime[index].grade} / ${modelTeacherTime[index].section}',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: AppColors
                                                              .lightOrange)),
                                                  SizedBox(height: 0),
                                                  Divider(
                                                    color: AppColors.darkBlue,
                                                    endIndent: 30,
                                                    height: 5,
                                                    thickness: 1,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'start time:',
                                              style: TextStyle(
                                                  color: AppColors.darkBlue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      modelTeacherTime[index]
                                                          .startTime,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: AppColors
                                                              .lightOrange)),
                                                  SizedBox(height: 0),
                                                  Divider(
                                                    color: AppColors.darkBlue,
                                                    endIndent: 30,
                                                    height: 5,
                                                    thickness: 1,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'end time:',
                                              style: TextStyle(
                                                  color: AppColors.darkBlue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      modelTeacherTime[index]
                                                          .endTime,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: AppColors
                                                              .lightOrange)),
                                                  SizedBox(height: 0),
                                                  Divider(
                                                    color: AppColors.darkBlue,
                                                    endIndent: 30,
                                                    height: 5,
                                                    thickness: 1,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'subject:',
                                              style: TextStyle(
                                                  color: AppColors.darkBlue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      modelTeacherTime[index]
                                                       .subject,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: AppColors
                                                              .lightOrange)),
                                                  SizedBox(height: 0),
                                                  Divider(
                                                    color: AppColors.darkBlue,
                                                    endIndent: 30,
                                                    height: 5,
                                                    thickness: 1,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              fallback: (BuildContext context) => Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          listener: (BuildContext context, state) {},
        ),
      ),
    );
  }
}
