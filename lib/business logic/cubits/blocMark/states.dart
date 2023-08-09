import 'package:mobile_schoolapp/data/models/add_marks_model.dart';
import 'package:mobile_schoolapp/data/models/get_students_marks_model.dart';

import '../../../data/models/get_students_model.dart';
import '../../../data/models/show_student_marks_model.dart';

abstract class MarksStates{}
class MarksInitialState extends MarksStates{}

class GetMarksLoadingState extends MarksStates{}
class GetMarksSuccessState extends MarksStates
{
  final GetStudentsMarksModel getStudentsMarksModel;

  GetMarksSuccessState(this.getStudentsMarksModel);
}
class GetMarksErrorState extends MarksStates
{
  final String error;

  GetMarksErrorState(this.error);

}

class GetStudentMarksLoadingState extends MarksStates{}
class GetStudentMarksSuccessState extends MarksStates
{
final StudentMarks studentMarks;

  GetStudentMarksSuccessState(this.studentMarks);
}
class GetStudentMarksErrorState extends MarksStates
{
  final String error;

  GetStudentMarksErrorState(this.error);

}

class GetStudentsLoadingState extends MarksStates{}
class GetStudentsSuccessState extends MarksStates
{
  final GetStudentsModel getStudentsModel;

  GetStudentsSuccessState(this.getStudentsModel);

}
class GetStudentsErrorState extends MarksStates
{
  final String error;

  GetStudentsErrorState(this.error);

}

class AddStudentMarksLoadingState extends MarksStates{}
class AddStudentMarksSuccessState extends MarksStates {}
class AddStudentMarksErrorState extends MarksStates{
  final String error;

  AddStudentMarksErrorState(this.error);
}