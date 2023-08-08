import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocAttendance/states.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_schoolapp/data/models/student_profile_model.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

class StudentAttendanceCubit extends Cubit<StudentAttendanceStates> {
  StudentAttendanceCubit() : super(StudentAttendanceInitState());

  static StudentAttendanceCubit get(context) => BlocProvider.of(context);

  final List<DateTime> dates = [
    DateTime(2020, 12, 1),
    DateTime(2020, 12, 2),
    DateTime(2020, 12, 3),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 5),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    //DateTime(2020, 12, 5),
  ];

  StudentProfileModel? studentAttModel;
  void getAttendanceStudent({int? id, int? year}) async {
    emit(StudentAttendanceLoadingState());
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://new-school-management-system.onrender.com/mob/student_profile'));
    request.headers['Authorization'] = 'Bearer $token';
    request.fields.addAll({
      'id': id.toString(),
      'year': year.toString()
    });
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 201) {
      studentAttModel = StudentProfileModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      print(response.statusCode);
      print(studentAttModel?.numberOfAbsenceDays);
      emit(StudentAttendanceSuccessState(studentAttModel!));
    } else {
      String error =
          jsonDecode(await response.stream.bytesToString())['message'];
      print(response.statusCode);
      print(error);
      emit(StudentAttendanceErrorState(error));
    }
  }
}
