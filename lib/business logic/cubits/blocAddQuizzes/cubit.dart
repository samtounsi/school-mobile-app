


import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocAddQuizzes/states.dart';
import 'package:http/http.dart' as http;
import '../../../data/models/add_quiz_model.dart';
import '../../../presentation/classes/question.dart';
import '../../../presentation/components and constants/constants.dart';

class AddQuizCubit extends Cubit<AddQuizStates>
{
  AddQuizCubit():super(AddQuizInitialState());

  static AddQuizCubit get(context) => BlocProvider.of(context);


  String classValue='seventh';
  String changeClass(value) {
    this.classValue = value;
    print(value);
    emit(AddQuizChooseClassState());
    return value;
  }
  String semesterValue='1';
  String changeSemester(value) {
    this.semesterValue = value;
    print(value);
    emit(AddQuizChooseSemesterState());
    return value;
  }



  List<Question> quiz=[];

   List<String>quizPost=[];
   Future addQuizQuestions({required nof, required quizController})async
   {

     for(int i=0;i<nof;i++)
     {
       for(int j=0;j<5;j++)
       {
         //print(quizController[i][j].text.toString());
         quizPost.add(quizController[i][j].text.toString());
       }
     }
     emit(AddQuizQuestionsState());
     return quizPost;
   }

  postQuiz({required AddQuizModel data})async
  {
    emit(AddTeacherQuizLoadingState());
    var request = http.post(
        Uri.parse('https://new-school-management-system.onrender.com/mob/add_quiz')
      ,headers:{
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    },
        body: jsonEncode(data.toJson(data))
    );

    var response = await request;

    if (response.statusCode == 200) {
      print(jsonDecode(await response.body));
      emit(AddTeacherQuizSuccessState());
  }
  else {
    print(jsonDecode(await response.body)['message']);
    emit(AddTeacherQuizErrorState());
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