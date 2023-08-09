import 'package:mobile_schoolapp/data/models/schoolCalendar_model.dart';

abstract class SchoolCalendarStates {}

class SchoolCalendarInitState extends SchoolCalendarStates {}

class SchoolCalendarLoadingState extends SchoolCalendarStates {}

class SchoolCalendarSuccessState extends SchoolCalendarStates {
  final SchoolCalendarModel? model;
  SchoolCalendarSuccessState(this.model);
}

class SchoolCalendarErrorState extends SchoolCalendarStates {
  final String error;
  SchoolCalendarErrorState(this.error);
}
