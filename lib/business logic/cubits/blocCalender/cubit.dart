// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocCalender/states.dart';

import 'package:table_calendar/table_calendar.dart';

class CalendarCubit extends Cubit<SchoolCalendarStates> {
  CalendarCubit() : super(SchoolCalendarInitState());

  static CalendarCubit get(context) => BlocProvider.of(context);

  //highlight today
  DateTime selectedDate = DateTime.now();

  //mark start, end of registration 
  DateTime? startRegister = DateTime(2023, 7, 3);
  DateTime? endRegister = DateTime(2023, 7, 28);
  List<dynamic> registerEventPred(DateTime day) {
    if (isSameDay(startRegister, day) || isSameDay(endRegister, day)) {
      return ['event'];
    }
    return [];
  }

  //highlight start, end of the Year
  DateTime? startWork = DateTime(2023, 7, 1);
  DateTime? endWork = DateTime(2023, 7, 6);
  bool selectPred(DateTime day) {
    return isSameDay(startWork, day) || isSameDay(endWork, day);
  }

  //highlight exam range
  DateTime? startExam = DateTime(2023, 5, 1);
  DateTime? endExam = DateTime(2023, 5, 6);

  

   //highlight holidays
  List<dynamic> holidays = [];

  List<dynamic> holidaysOfYear = [];
  void getHolidays() {
    holidays = [
      DateTime(2023, 5, 1),
      DateTime(2023, 5, 17),
    ];
    holidaysOfYear = [
      DateTime(2023, 5, 16),
      DateTime(2023, 5, 13),
      DateTime(2023, 6, 14),
      DateTime(2023, 6, 16),
      DateTime(2023, 6, 20),
      DateTime(2023, 6, 22)
    ];
  }

  bool isYearHoliday(DateTime day) {
    return holidaysOfYear.any((element) => (isSameDay(element, day)));
  }

  bool isHoliday(DateTime day) {
    return holidays.any((element) =>
        (isSame(element.day, day.day) && isSame(element.month, day.month)));
  }
  
  //helper
  bool isSame(int a, int b) {
    if (a == b) {
      return true;
    } else
      return false;
  }

 
}
