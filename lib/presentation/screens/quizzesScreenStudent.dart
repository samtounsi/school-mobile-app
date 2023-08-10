import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/presentation/screens/submission_screen.dart';
import '../../business logic/cubits/blocQuizzesStudent/stateQuizzes.dart';
import 'package:mobile_schoolapp/presentation/animations/studentMotion.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import '../components and constants/components.dart';
import 'questionItem.dart';
import 'package:mobile_schoolapp/presentation/screens/score_board.dart';
import 'package:mobile_schoolapp/presentation/screens/studentHistoryQuizOrNew.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherTimeTable1.dart';

import '../../business logic/cubits/blocQuizzesStudent/cubitQuizzes.dart';

class QuizzesScreenStudent extends StatefulWidget {
  QuizzesScreenStudent({Key? key}) : super(key: key);

  @override
  State<QuizzesScreenStudent> createState() => _QuizzesScreenStudentState();
}

class _QuizzesScreenStudentState extends State<QuizzesScreenStudent> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/Wallpaper 2.png'),
                  fit: BoxFit.fill)),
          child: WillPopScope(
            onWillPop: () async {
    if (QuizCubit.get(context).quizStudentPostModel!.allow == 1) {

    return false;}
    return true;
            },
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ConditionalBuilder(
                condition: state is! QuizzesLoadingState &&
                    QuizCubit.get(context).quizStudentPostModel != null,
                builder: (BuildContext context) {
                  if (QuizCubit.get(context).quizStudentPostModel!.allow == 1) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 70, left: 18),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                          SafeArea(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${QuizCubit.get(context).quizStudentPostModel!.quiz.subject} Quiz / ${QuizCubit.get(context).quizStudentPostModel!.quiz.grade}',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: AppColors.darkBlue),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: AppColors.aqua),
                                              text: 'Questions',
                                              children: [
                                            TextSpan(
                                              text:
                                                  ' ${QuizCubit.get(context).count}',
                                            ),
                                            TextSpan(text: '/'),
                                            TextSpan(
                                                text:
                                                    '${QuizCubit.get(context).quizStudentPostModel!.quiz.numberOfQuestions}'),
                                          ])),
                                      Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.darkBlue,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: text(
                                            ' ${QuizCubit.get(context).showHours()} ',
                                            color: Colors.white,
                                            size: 26),
                                      ),
                                      text(':',
                                          size: 26, color: AppColors.darkBlue),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.lightOrange,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: text(
                                            ' ${QuizCubit.get(context).showMinutes()} ',
                                            color: Colors.white,
                                            size: 26),
                                      ),
                                      text(':',
                                          size: 26, color: AppColors.darkBlue),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.aqua,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: text(
                                            ' ${QuizCubit.get(context).showSeconds()} ',
                                            color: Colors.white,
                                            size: 26),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),

                                  // ProgressTimer(),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 400,
                                  child: PageView.builder(
                                      onPageChanged: (index) {
                                        setState(() {
                                          currentPage = index;
                                        });
                                      },
                                      controller: _pageController,
                                      scrollDirection: Axis.horizontal,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return QuestionItem(
                                          questions: QuizCubit.get(context)
                                              .quizStudentPostModel!
                                              .quiz
                                              .questions[index],
                                          // questionModel: QuizCubit.get(context).quizStudentPostModel.quiz.questions
                                          // .questionsList[index],
                                        );
                                      },
                                      itemCount: QuizCubit.get(context)
                                          .quizStudentPostModel!
                                          .quiz
                                          .questions
                                          .length
                                      // QuizCubit.get(context).questionsList.length,
                                      ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    defaultTextButton(
                                        width: 150,
                                        radius: 25.0,
                                        text: 'back',
                                        textColor: AppColors.lightOrange,
                                        function: () {
                                          _pageController.previousPage(
                                              duration:
                                                  Duration(milliseconds: 3),
                                              curve: Curves.bounceInOut);
                                          QuizCubit.get(context).minusCounter();
                                        },
                                        isUpperCase: true,
                                        background: AppColors.darkBlue),
                                    defaultTextButton(
                                        width: 150,
                                        radius: 25.0,
                                        text: 'next',
                                        textColor: AppColors.lightOrange,
                                        function: () {
                                          if (QuizCubit.get(context).count !=
                                              QuizCubit.get(context)
                                                  .quizStudentPostModel!.quiz.numberOfQuestions) {
                                            _pageController.nextPage(

                                                duration:Duration(milliseconds: 3),
                                                curve: Curves.bounceInOut);
                                            QuizCubit.get(context).counter();
                                          } else {
                                            navigateTo(context, SubmissionScreen());
                                          }
                                        },
                                        isUpperCase: true,
                                        background: AppColors.darkBlue),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return  Center(
                      child: Text(
                        "The quiz hasn't started yet",
                        style: TextStyle(
                            fontSize: 25, color: AppColors.darkBlue),
                      ),
                    );
                  }
                },
                fallback: (BuildContext context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
