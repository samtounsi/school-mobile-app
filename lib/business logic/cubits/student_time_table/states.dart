import 'package:mobile_schoolapp/data/models/student_time_table.dart';

abstract class StudentTimetableStates {}
class StudentTimetableInitialState extends StudentTimetableStates {}
class GetStudentTimetableLoadingState extends StudentTimetableStates {}
class GetStudentTimetableSuccessState extends StudentTimetableStates
{
  final StudentTimetable studentTimetable;

  GetStudentTimetableSuccessState(this.studentTimetable);

}
class GetStudentTimetableEmptyState extends StudentTimetableStates
{
  final StudentTimetable empty;

  GetStudentTimetableEmptyState(this.empty);

}
class GetStudentTimetableErrorState extends StudentTimetableStates
{
  final String error;

  GetStudentTimetableErrorState(this.error);
}