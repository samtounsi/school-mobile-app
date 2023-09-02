import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fx_stepper/fx_stepper.dart';
import 'package:mobile_schoolapp/data/models/add_quiz_model.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherAddQuizesOrHistory.dart';

import '../../business logic/cubits/blocAddQuizzes/cubit.dart';
import '../../business logic/cubits/blocAddQuizzes/states.dart';
import '../components and constants/addQuiz.dart';
import '../components and constants/constants.dart';







var formKey3=GlobalKey<FormState>();
int currentIndex=0;
bool isCompleted=false;

class AddQuizQuestions extends StatelessWidget {

  String grade;
  String semester;
  String subject;
  String label;
  int numberOfQuestions;
  String date;
  String startTime;
  String endTime;
  AddQuizQuestions({super.key, required this.grade,required this.semester,
    required this.subject, required this.label,required this.numberOfQuestions,
    required this.date, required this.startTime,required this.endTime});
  @override
  Widget build(BuildContext context) {

    List<List<TextEditingController>> questionList=List.generate(numberOfQuestions, (index) =>List.generate(5, (i) => TextEditingController()) );

    return BlocConsumer<AddQuizCubit,AddQuizStates>(
      listener: (context,state)
      {
       if(state is AddTeacherQuizSuccessState)
       {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           content: Center(
             child: Container(
               decoration: BoxDecoration(
                 color: AppColors.aqua,
                 borderRadius: BorderRadius.circular(17),
               ),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(
                   'added successfully',
                   overflow: TextOverflow.ellipsis,
                   maxLines: 2,
                   style: TextStyle(
                     fontSize: 16,
                     color: Colors.white,
                   ),
                 ),
               ),
             ),
           ),
           behavior: SnackBarBehavior.floating,
           backgroundColor: Colors.transparent,
           elevation: 0,
           width: MediaQuery.of(context).size.width - 10,
         ));
       // navigateTo(context, TeacherQuizzesAddOrHistory());

           AddQuizCubit.get(context).quizPost.removeRange(0, AddQuizCubit.get(context).quizPost.length);


       }
       else if (state is AddTeacherQuizErrorState) {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           content: Center(
             child: Container(
               decoration: BoxDecoration(
                 color: AppColors.lightOrange,
                 borderRadius: BorderRadius.circular(17),
               ),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(
                   state.error.toString(),
                   overflow: TextOverflow.ellipsis,
                   maxLines: 2,
                   style: TextStyle(
                     fontSize: 16,
                     color: Colors.white,
                   ),
                 ),
               ),
             ),
           ),
           behavior: SnackBarBehavior.floating,
           backgroundColor: Colors.transparent,
           elevation: 0,
           width: MediaQuery.of(context).size.width-10,
         ));
       }},
      builder: (context,state)
      {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Wallpaper 2.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading:  Padding(
                  padding: const EdgeInsets.only(top:15.0),
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,
                      size: 35,
                      color: AppColors.darkBlue,),),
                ),
                titleSpacing: 0,
                title: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Text('Add Quiz',
                    style: TextStyle(
                        color:AppColors.darkBlue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

              ),
              body: Form(
                key:formKey3,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(bottom:15,top:20),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        shadowColor: Colors.transparent,
                      appBarTheme: AppBarTheme(color: Colors.transparent,elevation: 0),
                      colorScheme: ColorScheme.light(primary: AppColors.lightOrange),
                        iconTheme: Theme.of(context).iconTheme.copyWith(size: 32.0),
                    ),
                    child: PageView(
                      children: [
                      FxStepper(
                        elevation: 0.0,
                          type: FxStepperType.horizontal,
                          steps: getSteps(context,numberOfQuestions,questionList),
                          currentStep: AddQuizCubit.get(context).currentStep,
                          onStepContinue: ()
                          {
                            final isLastStep=AddQuizCubit.get(context).currentStep==numberOfQuestions-1;

                            if(isLastStep)
                            {
                              print('Completed');
                              if(formKey3.currentState!.validate())
                              {
                                AddQuizCubit.get(context).addQuizQuestions(
                                    nof: numberOfQuestions, quizController: questionList).then(
                                  (value)
                                    {
                                      AddQuizModel model=AddQuizModel
                                        (
                                          grade: grade,
                                          semester: int.parse(semester),
                                          subject: subject,
                                          title: label,
                                          numberOfQuestions: numberOfQuestions,
                                          date: date,
                                          startTime: startTime,
                                          endTime:endTime,
                                          questions: AddQuizCubit.get(context).quizPost
                                      );
                                      print(model.toJson(model).toString());
                                      AddQuizCubit.get(context).postQuiz(data: model);
                                    });

                              }

                            }

                            else{
                              AddQuizCubit.get(context).addToCurrentStep(currentStep: AddQuizCubit.get(context).currentStep);
                            }
                          },
                          onStepTapped: (step)
                          {
                            AddQuizCubit.get(context).saveOnTapped(step: step);
                          },
                          onStepCancel: ()
                          {
                            AddQuizCubit.get(context).currentStep==0 ? null:
                            AddQuizCubit.get(context).subtractFromCurrentStep(currentStep: AddQuizCubit.get(context).currentStep);
                          },

                        controlsBuilder: (context,controls )
                          {
                            final isLastStep=AddQuizCubit.get(context).currentStep==numberOfQuestions-1;
                            return Container
                              (
                                child: Row(
                                  children: [
                                    Expanded(child:ElevatedButton(
                                      onPressed: controls.onStepContinue,
                                      child:Text(isLastStep ? 'Confirm':'Next' ) ,
                                    ) ),
                                    SizedBox(width: 15,),
                                    if(AddQuizCubit.get(context).currentStep!=0)
                                    Expanded(child:ElevatedButton(
                                      onPressed: controls.onStepCancel,
                                      child:Text('Back') ,
                                    ) ),
                                  ],
                                ),
                              );
                          }

                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

  }

 List <FxStep> getSteps(context,numberOfQuestions,questionList)
 {
   return List.generate(numberOfQuestions, (index) =>FxStep(
         state: AddQuizCubit.get(context).currentStep>index? FxStepState.complete: FxStepState.indexed,
         isActive: AddQuizCubit.get(context).currentStep>=index,
         title: Text(''),
         content:  Column(
           children: <Widget>[buildQuestion(questionList[index])],)
     ) );

    /* Step(
       state:  AddQuizCubit.get(context).currentStep>0? StepState.complete: StepState.indexed,
       isActive: AddQuizCubit.get(context).currentStep>=0 ,
         title:  Text(''),
         content:Column(
           children: <Widget>[buildQuestion( questionList[0]),],
         )
     ),
     Step(
         state: AddQuizCubit.get(context).currentStep>1? StepState.complete: StepState.indexed,
         isActive: AddQuizCubit.get(context).currentStep>=1,
         title: Text(''),
         content:  Column(
         children: <Widget>[buildQuestion(questionList[1])],)
         ),
     Step(
       state: AddQuizCubit.get(context).currentStep>2? StepState.complete: StepState.indexed,
       isActive: AddQuizCubit.get(context).currentStep>=2,
       title: Text(''),
       content: Column(
         children:  <Widget>[
           buildQuestion(questionList[2]),
         ],
       ),),
     Step(
       state: AddQuizCubit.get(context).currentStep>3? StepState.complete: StepState.indexed,
       isActive: AddQuizCubit.get(context).currentStep>=3,
       title: Text(''),
       content: Column(
         children:  <Widget>[
           buildQuestion(questionList[3]),
         ],
       ),),
     Step(
       state: AddQuizCubit.get(context).currentStep>4? StepState.complete: StepState.indexed,
       isActive: AddQuizCubit.get(context).currentStep>=4,
       title: Text(''),
       content: Column(
         children: <Widget> [
           buildQuestion(questionList[4]),
         ],
       ),),
     Step(
       state: AddQuizCubit.get(context).currentStep>5? StepState.complete: StepState.indexed,
       isActive: AddQuizCubit.get(context).currentStep>=5,
       title: Text(''),
       content: Column(
         children:  <Widget>[
           buildQuestion(questionList[5]),
         ],
       ),),
     Step(
       state: AddQuizCubit.get(context).currentStep>6? StepState.complete: StepState.indexed,
       isActive: AddQuizCubit.get(context).currentStep>=6,
       title: Text(''),
       content: Column(
         children:  <Widget>[
           buildQuestion(questionList[6]),
         ],
       ),),
     Step(
       state: AddQuizCubit.get(context).currentStep>7? StepState.complete: StepState.indexed,
       isActive: AddQuizCubit.get(context).currentStep>=7,
       title: Text(''),
       content: Column(
         children: <Widget> [
           buildQuestion(questionList[7]),
         ],
       ),),
     Step(
       state: AddQuizCubit.get(context).currentStep>8? StepState.complete: StepState.indexed,
       isActive: AddQuizCubit.get(context).currentStep>=8,
       title: Text(''),
       content: Column(
         children:  <Widget>[
           buildQuestion(questionList[8]),
         ],
       ),),
     Step(
       isActive: AddQuizCubit.get(context).currentStep>=9,
       title: Text(''),
       content: Column(
         children:  <Widget>[
           buildQuestion(questionList[10]),
         ],
       ),),];
*/

 }


 /*
 Stepper(
                          type: StepperType.horizontal,
                          steps: getSteps(context,qn),
                          currentStep: AddQuizCubit.get(context).currentStep,
                          onStepContinue: ()
                          {
                            final isLastStep=AddQuizCubit.get(context).currentStep==getSteps(context,qn).length-1;

                            if(isLastStep)
                            {
                              print('Completed');
                              if(formKey.currentState!.validate())
                              {
                                /* AddQuizCubit.get(context).postQuiz(
                              controllers1: [controller1[0],controller1[1],controller1[2],controller1[3],controller1[4]],
                              controllers2: [controller2[0],controller2[1],controller2[2],controller2[3],controller2[4]],
                              controllers3: [controller3[0],controller3[1],controller3[2],controller3[3],controller3[4]],
                              controllers4: [controller4[0],controller4[1],controller4[2],controller4[3],controller4[4]],
                              controllers5: [controller5[0],controller5[1],controller5[2],controller5[3],controller5[4]],
                              controllers6: [controller6[0],controller6[1],controller6[2],controller6[3],controller6[4]],
                              controllers7: [controller7[0],controller7[1],controller7[2],controller7[3],controller7[4]],
                              controllers8: [controller8[0],controller8[1],controller8[2],controller8[3],controller8[4]],
                              controllers9: [controller9[0],controller9[1],controller9[2],controller9[3],controller9[4]],
                              controllers10:[controller10[0],controller10[1],controller10[2],controller10[3],controller10[4]],
                            );*/
                                AddQuizCubit.get(context).postQuiz(
                                    quizController: questionList

                                );

                              }

                            }

                            else{
                              AddQuizCubit.get(context).addToCurrentStep(currentStep: AddQuizCubit.get(context).currentStep);
                            }
                          },
                          onStepTapped: (step)
                          {
                            AddQuizCubit.get(context).saveOnTapped(step: step);
                          },
                          onStepCancel: ()
                          {
                            AddQuizCubit.get(context).currentStep==0 ? null:
                            AddQuizCubit.get(context).subtractFromCurrentStep(currentStep: AddQuizCubit.get(context).currentStep);
                          },

                        )
*/




}
