
abstract class AddQuizStates{}
class AddQuizInitialState extends AddQuizStates{}
class AddQuizChooseClassState extends AddQuizStates{}
class AddQuizTimeState extends AddQuizStates{}
class AddToCurrentStepState extends AddQuizStates{}
class SubtractFromCurrentStepState extends AddQuizStates{}
class SaveOnTappedStepState extends AddQuizStates{}
class AddQuizChooseSemesterState extends AddQuizStates{}
class AddQuizQuestionsState extends AddQuizStates{}
class AddTeacherQuizLoadingState extends AddQuizStates{}
class AddTeacherQuizSuccessState extends AddQuizStates{}
class AddTeacherQuizErrorState extends AddQuizStates
{
  final String error;

  AddTeacherQuizErrorState(this.error);
}
