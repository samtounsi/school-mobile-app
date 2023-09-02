import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/attendanceCubit/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/attendanceCubit/states.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/stateTeacher.dart';
import 'package:mobile_schoolapp/data/models/get_absent_students_model.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/attendance.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:table_calendar/table_calendar.dart';

var model;

class SectionAttendance extends StatelessWidget {
  const SectionAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SectionAttendanceCubit, SectionAttendanceStates>(
      listener: (context, state) {
        if (state is GetStudentsAbsenceSuccessState) {
          model = state.getAbsentStudents.absenceStudents;
        }
      },
      builder: (context, state) {
        model = SectionAttendanceCubit.get(context).getAbsentStudents?.exist ==
                false
            ? SectionAttendanceCubit.get(context).emptyAbsent
            : SectionAttendanceCubit.get(context)
                .getAbsentStudents
                ?.absenceStudents;
        DateTime today = SectionAttendanceCubit.get(context).today;
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Wallpaper (4).png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 10),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7, right: 10),
                      child: Container(
                        height: 33,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.darkBlue,
                        size: 32,
                      ),
                    ),
                  ],
                ),
                title: Text(
                  'Attendance Monitoring',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 37,
                  ),
                  Text(
                    'Selected Day: ' + today.toString().split(" ")[0],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightOrange,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      child: TableCalendar(
                    locale: "en_US",
                    rowHeight: 50,
                    headerStyle: HeaderStyle(
                        rightChevronIcon: Icon(
                          Icons.chevron_right,
                          color: AppColors.darkBlue,
                        ),
                        leftChevronIcon: Icon(
                          Icons.chevron_left,
                          color: AppColors.darkBlue,
                        ),
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                            color: AppColors.darkBlue,
                            height: 1,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    availableGestures: AvailableGestures.all,
                    focusedDay: SectionAttendanceCubit.get(context).today,
                    firstDay: DateTime.utc(2022, 1, 1),
                    lastDay: DateTime.utc(2050, 1, 1),
                    onDaySelected:
                        SectionAttendanceCubit.get(context).onDaySelected,
                    selectedDayPredicate: (day) => isSameDay(
                        day, SectionAttendanceCubit.get(context).today),
                    weekendDays: [DateTime.saturday, DateTime.friday],
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: TextStyle(
                          height: 1,
                          color: AppColors.lightOrange.withAlpha(99),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      weekdayStyle: TextStyle(
                          height: 1,
                          color: AppColors.lightOrange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: AppColors.lightOrange,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: AppColors.lightOrange.withAlpha(99),
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      weekendTextStyle: TextStyle(
                          color: AppColors.darkBlue.withAlpha(99),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      selectedTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      outsideTextStyle: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      defaultTextStyle: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  ConditionalBuilder(
                    condition: state is! GetStudentsAbsenceLoadingState &&
                        SectionAttendanceCubit.get(context).getAbsentStudents !=
                            null,
                    builder: (context) {
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                top: 5, bottom: 10, start: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildAttendance(
                                    'Present: ',
                                    SectionAttendanceCubit.get(context)
                                        .getAbsentStudents
                                        ?.numberOfAttendences
                                        .toString()),
                                buildAttendance(
                                    'Absent:  ',
                                    SectionAttendanceCubit.get(context)
                                        .getAbsentStudents
                                        ?.numberOfAbsences
                                        .toString()),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      top: 10, bottom: 10, start: 10),
                                  child: Text(
                                    'Absent Students: ',
                                    style: TextStyle(
                                        fontSize: 24,
                                        //fontWeight: FontWeight.bold,
                                        color: AppColors.lightOrange),
                                  ),
                                ),
                                ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: 20),
                                          child: buildAbsentsItem(
                                              model[index], index, context));
                                    },
                                    separatorBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 20, end: 180),
                                        child: myDivider(
                                          dividerColor: AppColors.darkBlue,
                                        ),
                                      );
                                    },
                                    itemCount: model.length)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    fallback: (context) => Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: 100, bottom: 10, start: 10),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildAbsentsItem(AbsenceStudents model, index, context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 3),
      child: Text(
        model.firstName.toString() +
            " " +
            model.fatherName.toString() +
            ' ' +
            model.lastName.toString(),
        style: TextStyle(fontSize: 20, color: AppColors.darkBlue),
      ),
    );
  }
}
