import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocEvent/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocEvent/state.dart';
import '../../business logic/cubits/blocQuizzesStudent/cubitQuizzes.dart';
import '../../business logic/cubits/blocQuizzesStudent/stateQuizzes.dart';
import '../../data/models/send_add_event_teacher.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

class SubmissionScreen extends StatelessWidget {
  SubmissionScreen({Key? key}) : super(key: key);
  TextEditingController numberOfQuestionController = TextEditingController();
  TextEditingController timerController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    numberOfQuestionController.text=QuizCubit.get(context).countOfCorrectAnswers.toString();
    return Scaffold(
      body: Stack(
        children: [
          BlocConsumer<QuizCubit, QuizState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView
                (
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
                            readOnly:true,
                            controller: numberOfQuestionController,
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
                            readOnly:true,
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
                          condition: state is !  AddEventLoadingState,
                          builder: (BuildContext context) {
                            return Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.lightOrange),
                                child: TextButton(
                                    onPressed: () {


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
