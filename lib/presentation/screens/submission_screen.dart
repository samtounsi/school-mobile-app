import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/data/models/submission_model.dart';
import 'package:mobile_schoolapp/presentation/animations/studentMotion.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';
import '../../business logic/cubits/blocQuizzesStudent/cubitQuizzes.dart';
import '../../business logic/cubits/blocQuizzesStudent/stateQuizzes.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

class SubmissionScreen extends StatelessWidget {
  int quizzesId;
  SubmissionScreen({Key? key,required this.quizzesId}) : super(key: key);
  TextEditingController numOfQuestionsCorrectController = TextEditingController();
  TextEditingController timerController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    numOfQuestionsCorrectController.text =
        QuizCubit.get(context).countOfCorrectAnswers.toString();
    return Scaffold(
      body: Stack(
        children: [
          BlocConsumer<QuizCubit, QuizState>(
            listener: (context, state) {
              if(state is SubmissionQuizzesSuccessState)
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
                            "submit success",
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

                }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 200, left: 30, right: 30, bottom: 30),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border:
                                Border.all(color: AppColors.darkBlue, width: 2),
                          ),
                          child: TextFormField(
                            readOnly: true,
                            controller: numOfQuestionsCorrectController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'NumberOfQuestion',
                              hintStyle: TextStyle(
                                  color: AppColors.darkBlue, fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border:
                                Border.all(color: AppColors.darkBlue, width: 2),
                          ),
                          child: TextFormField(
                            readOnly: true,
                            controller: timerController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Timer',
                              hintStyle: TextStyle(
                                  color: AppColors.darkBlue, fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        ConditionalBuilder(
                          condition: state is! SubmissionQuizzesLoadingState,
                          builder: (BuildContext context) {
                            return Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.lightOrange),
                                child: TextButton(
                                    onPressed: () {
                                      SubmissionModel s = SubmissionModel(
                                          quizId: quizzesId,
                                          numberOfCorrectAnswer:numOfQuestionsCorrectController.text,
                                          submitDuration: '10',
                                          duration: QuizCubit.get(context).quizStudentPostModel!.quiz.duration.toString());
                                      QuizCubit.get(context)
                                          .submissionResult(s);
                                      navigateTo(context, StudentMotion());
                                    },
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    )));
                          },
                          fallback: (BuildContext context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/head.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.darkBlue,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}
