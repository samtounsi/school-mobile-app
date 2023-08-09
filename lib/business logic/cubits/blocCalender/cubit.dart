// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocCalender/states.dart';
//import 'package:mobile_schoolapp/data/models/schoolCalendarModel.dart';
import 'package:mobile_schoolapp/data/models/schoolCalendar_model.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class CalendarCubit extends Cubit<SchoolCalendarStates> {
  CalendarCubit() : super(SchoolCalendarInitState());

  static CalendarCubit get(context) => BlocProvider.of(context);

  //highlight today
  DateTime selectedDate = DateTime.now();
  //get home data
  SchoolCalendarModel? model;
  void getSchoolCalendarData({required int year,required int newyear}) async {
    emit(SchoolCalendarLoadingState());
    print(token);
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://new-school-management-system.onrender.com/mob/get_calander'));
    request.fields.addAll({'year': year.toString()});
    request.headers['Authorization'] = 'Bearer $token';
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 201) {
      print(year);
      print(token);
      model =
          SchoolCalendarModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      emit(SchoolCalendarSuccessState(model!));
      print(model!.toJson().toString());
      //print(model!.work![0].type);
    } else {
      emit(SchoolCalendarErrorState(
          jsonDecode(await response.stream.bytesToString())['message']
              .toString()));
      print('Error');
    }
    selectedDate = DateTime(newyear, DateTime.now().month, DateTime.now().day);
  }

  //mark start\end of the registeration
  List<dynamic> registerEventPred(DateTime day,
      {DateTime? startRegister, DateTime? endRegister}) {
    if (isSameDay(startRegister, day) || isSameDay(endRegister, day)) {
      return ['event'];
    }
    return [];
  }

  //highlight the start\end of the Year
  bool selectPred(DateTime day, {DateTime? startWork, DateTime? endWork}) {
    return isSameDay(startWork, day) || isSameDay(endWork, day);
  }

  //highlight holidays
  bool isYearHoliday(DateTime day, {List<HolidayModel>? holidays}) {
    return holidays!.any((element) => (isSameDay(element.startDate, day)));
  }

  //helper
  bool isSame(int a, int b) {
    if (a == b)
      return true;
    else
      return false;
  }
}