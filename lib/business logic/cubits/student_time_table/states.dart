import 'package:mobile_schoolapp/data/models/section_timetable.dart';

abstract class StudentTimetableStates {}
class StudentTimetableInitialState extends StudentTimetableStates {}
class GetSectionTimetableLoadingState extends StudentTimetableStates {}
class GetSectionTimetableSuccessState extends StudentTimetableStates
{
  final SectionTimetable studentTimetable;

  GetSectionTimetableSuccessState(this.studentTimetable);

}
class GetSectionTimetableEmptyState extends StudentTimetableStates
{
  final SectionTimetable empty;

  GetSectionTimetableEmptyState(this.empty);

}
class GetSectionTimetableErrorState extends StudentTimetableStates
{
  final String error;

  GetSectionTimetableErrorState(this.error);
}


class GetStudentTimetableLoadingState extends StudentTimetableStates {}
class GetStudentTimetableSuccessState extends StudentTimetableStates
{
  final SectionTimetable studentTimetable;

  GetStudentTimetableSuccessState(this.studentTimetable);

}
class GetStudentTimetableEmptyState extends StudentTimetableStates
{
  final SectionTimetable empty;

  GetStudentTimetableEmptyState(this.empty);

}
class GetStudentTimetableErrorState extends StudentTimetableStates
{
  final String error;

  GetStudentTimetableErrorState(this.error);
}


class GetParentStudentTimetableLoadingState extends StudentTimetableStates {}
class GetParentStudentTimetableSuccessState extends StudentTimetableStates
{
  final SectionTimetable studentTimetable;

  GetParentStudentTimetableSuccessState(this.studentTimetable);

}
class GetParentStudentTimetableEmptyState extends StudentTimetableStates
{
  final SectionTimetable empty;

  GetParentStudentTimetableEmptyState(this.empty);

}
class GetParentStudentTimetableErrorState extends StudentTimetableStates
{
  final String error;

  GetParentStudentTimetableErrorState(this.error);
}