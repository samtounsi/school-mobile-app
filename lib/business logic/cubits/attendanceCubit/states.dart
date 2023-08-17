import '../../../data/models/get_absent_students_model.dart';

abstract class SectionAttendanceStates{}
class SectionAttendanceInitialState extends SectionAttendanceStates{}
class SectionAttendanceOnSelectedDayState extends SectionAttendanceStates{}
class GradeChangeState extends SectionAttendanceStates{}
class GetStudentsAbsenceLoadingState extends SectionAttendanceStates{}
class GetStudentsAbsenceSuccessState extends SectionAttendanceStates
{
  final GetAbsentStudents getAbsentStudents;

  GetStudentsAbsenceSuccessState(this.getAbsentStudents);
}
class GetStudentsAbsenceErrorState extends SectionAttendanceStates
{
  final String error;

  GetStudentsAbsenceErrorState(this.error);

}