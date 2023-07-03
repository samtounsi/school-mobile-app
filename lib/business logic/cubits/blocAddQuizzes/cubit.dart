


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocAddQuizzes/states.dart';

import '../../../presentation/classes/question.dart';

class AddQuizCubit extends Cubit<AddQuizStates>
{
  AddQuizCubit():super(AddQuizInitialState());

  static AddQuizCubit get(context) => BlocProvider.of(context);


  String classValue='7th';
  String changeClass(value) {
    this.classValue = value;
    print(value);
    emit(AddQuizChooseClassState());
    return value;
  }




  List<Question> quiz=[];

 /* postQuiz({
    required List controllers1,
    required List controllers2,
    required List  controllers3,
    required List  controllers4,
    required List  controllers5,
    required List  controllers6,
    required List   controllers7,
    required List  controllers8,
    required List  controllers9,
    required List  controllers10,}
      )
  {
    for(int i=0;i<5;i++)
    {
      print(controllers1);
      print(controllers2);
      print(controllers3);
      print(controllers4);
      print(controllers5);
      print(controllers6);
      print(controllers7);
      print(controllers8);
      print(controllers9);
      print(controllers10);
    }

  }*/
  postQuiz({required grade,
    required label,
    required nof,
    required st,
    required et,
    required quizController})
  {
    print(grade);
    print(label);
    print(nof);
    print(st);
    print(et);
    for(int i=0;i<nof;i++)
    {
      for(int j=0;j<5;j++)
      {
        print(quizController[i][j].text.toString());
      }
    }
  }


  int currentStep=0;
  addToCurrentStep({required currentStep})
  {
    this.currentStep+=1;
    emit(AddToCurrentStepState());
    print(currentStep.toString());
  }
  subtractFromCurrentStep({required currentStep})
  {
    this.currentStep-=1;
    emit(SubtractFromCurrentStepState());
    print(currentStep.toString());
  }
  saveOnTapped({required step})
  {
    this.currentStep=step;
    emit(SaveOnTappedStepState());
    print(currentStep.toString());
  }

}