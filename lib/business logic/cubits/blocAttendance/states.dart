import 'package:mobile_schoolapp/data/models/student_profile_model.dart';

abstract class StudentAttendanceStates {}

class StudentAttendanceInitState extends StudentAttendanceStates {}

class StudentAttendanceLoadingState extends StudentAttendanceStates {}

class StudentAttendanceSuccessState extends StudentAttendanceStates {
  final StudentProfileModel? model;
  StudentAttendanceSuccessState(this.model);
}

class StudentAttendanceErrorState extends StudentAttendanceStates {
  final String error;
  StudentAttendanceErrorState(this.error);
}
