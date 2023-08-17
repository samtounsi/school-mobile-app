
import '../../../data/models/exam_model.dart';

abstract class ExamStates{}
class ExamInitialState extends ExamStates{}
class ExamChangeSemesterState extends ExamStates{}
class ExamChangeGradeState extends ExamStates{}
class ExamGetExamScheduleLoadingState extends ExamStates{}
class ExamGetExamScheduleSuccessState extends ExamStates
{
  final ExamScheduleModel examScheduleModel;

  ExamGetExamScheduleSuccessState(this.examScheduleModel);
}
class ExamGetExamScheduleErrorState extends ExamStates
{
  final String error;

  ExamGetExamScheduleErrorState(this.error);
}