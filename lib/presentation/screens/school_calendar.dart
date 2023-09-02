import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/data/models/schoolCalendar_model.dart';
import 'package:mobile_schoolapp/presentation/screens/Calendar.dart';

import '../../business logic/cubits/blocCalender/cubit.dart';
import '../../business logic/cubits/blocCalender/states.dart';
import '../components and constants/components.dart';
import '../components and constants/constants.dart';

class SchoolCalendarScreen extends StatelessWidget {
  SchoolCalendarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalendarCubit, SchoolCalendarStates>(
      listener: (context, state) {
        if (state is SchoolCalendarErrorState) {
          print(state.error);
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  // text('School Calendar',
                  //     size: 27,
                  //     color: AppColors.darkBlue,
                  //     weight: FontWeight.w400),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.66,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.grey[100],
                    ),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17)),
                      elevation: 0,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: text('Select Year'),
                                content: Container(
                                  height: 300,
                                  width: 300,
                                  child: YearPicker(
                                      firstDate: DateTime(1990),
                                      lastDate: DateTime(2060),
                                      selectedDate: DateTime.now(),
                                      onChanged: (year) {
                                        print(year.year.toString());
                                        CalendarCubit.get(context)
                                            .getSchoolCalendarData(
                                                year: year.year + 1,
                                                newyear: year.year);
                                      }),
                                ),
                              );
                            });
                      },
                      child: Row(
                        children: [
                          Text(
                              '${CalendarCubit.get(context).selectedDate.year} - ${CalendarCubit.get(context).selectedDate.year + 1}'),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Calendar
                  ConditionalBuilder(
                    condition: state is! SchoolCalendarLoadingState,
                    builder: (context) => Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(17)),
                      child: calendar(
                        focusedDay: CalendarCubit.get(context).selectedDate,
                        size: 16,
                        holidayPredicate: (day) {
                          if (CalendarCubit.get(context)
                              .model!
                              .holidays!
                              .isNotEmpty) {
                            return CalendarCubit.get(context).isYearHoliday(day,
                                holidays:
                                    CalendarCubit.get(context).model!.holidays);
                          }
                          return false;
                        },
                        selectedDayPredicate: (day) {
                          if (CalendarCubit.get(context)
                              .model!
                              .work!
                              .isNotEmpty) {
                            return CalendarCubit.get(context).selectPred(day,
                                startWork: CalendarCubit.get(context)
                                    .model!
                                    .work![CalendarCubit.get(context)
                                            .model!
                                            .work!
                                            .length -
                                        1]
                                    .startDate,
                                endWork: CalendarCubit.get(context)
                                    .model!
                                    .work![CalendarCubit.get(context)
                                            .model!
                                            .work!
                                            .length -
                                        1]
                                    .endDate);
                          }
                          return false;
                        },
                        startRange: (CalendarCubit.get(context)
                                .model!
                                .exams!
                                .isNotEmpty)
                            ? CalendarCubit.get(context)
                                .model!
                                .exams![CalendarCubit.get(context)
                                        .model!
                                        .exams!
                                        .length -
                                    1]
                                .startDate
                            : DateTime(1995, 1, 1),
                        endRange: (CalendarCubit.get(context)
                                .model!
                                .exams!
                                .isNotEmpty)
                            ? CalendarCubit.get(context)
                                .model!
                                .exams![CalendarCubit.get(context)
                                        .model!
                                        .exams!
                                        .length -
                                    1]
                                .endDate
                            : DateTime(1995, 1, 2),
                        eventLoader: (day) {
                          if (CalendarCubit.get(context)
                              .model!
                              .registration!
                              .isNotEmpty) {
                            return CalendarCubit.get(context).registerEventPred(
                                day,
                                startRegister: CalendarCubit.get(context)
                                    .model!
                                    .registration![CalendarCubit.get(context)
                                            .model!
                                            .registration!
                                            .length -
                                        1]
                                    .startDate,
                                endRegister: CalendarCubit.get(context)
                                    .model!
                                    .registration![CalendarCubit.get(context)
                                            .model!
                                            .registration!
                                            .length -
                                        1]
                                    .endDate);
                          }
                          return [];
                        },
                      ),
                    ),
                    fallback: (context) => Container(
                        height: 350,
                        width: MediaQuery.of(context).size.width - 30,
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              height: 75,
                              width: 75,
                              child: CircularProgressIndicator(
                                color: AppColors.darkBlue,
                              ),
                            ),
                            Spacer(),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: AppColors.aqua,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      text('Holidays', size: 18, color: AppColors.darkBlue),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: AppColors.lightOrange,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      text('Exam', size: 18, color: AppColors.darkBlue),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 125, 186, 216),
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      text('Start/End of the Year',
                          size: 18, color: AppColors.darkBlue),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 55,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                        ),
                      ),
                      SizedBox(
                        width: 23,
                      ),
                      text('Start/End of School\n Registration',
                          size: 18, color: AppColors.darkBlue),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
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
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.darkBlue,
                          size: 35,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: text('School Calendar',
                        size: 22,
                        color: AppColors.darkBlue,
                        weight: FontWeight.w400),
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
