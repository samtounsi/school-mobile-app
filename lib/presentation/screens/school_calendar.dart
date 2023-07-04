import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  text('School Calendar',
                      size: 27, color: AppColors.darkBlue, weight: FontWeight.w400),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
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
                                      }),
                                ),
                              );
                            });
                      },
                      child: Row(
                        children: [
                          Text('Choose Year'),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(17)),
                    child: calendar(
                      focusedDay: CalendarCubit.get(context).selectedDate,
                      size: 16,
                      holidayPredicate: (day) {
                        return CalendarCubit.get(context).isHoliday(day) ||
                            CalendarCubit.get(context).isYearHoliday(day);
                      },
                      selectedDayPredicate:
                          CalendarCubit.get(context).selectPred,
                      startRange: CalendarCubit.get(context).startExam,
                      endRange: CalendarCubit.get(context).endExam,
                      eventLoader:
                          CalendarCubit.get(context).registerEventPred,
                    ),
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
                      text('Start/End of School Registration',
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
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
