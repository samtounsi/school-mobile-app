import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocHistoryQuizzes/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocHistoryQuizzes/state.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import '../components and constants/components.dart';
import 'questionHistoryItem.dart';

class QuizzesScreenHQStudent extends StatefulWidget {
  QuizzesScreenHQStudent({
    Key? key,
  }) : super(key: key);

  @override
  State<QuizzesScreenHQStudent> createState() => _QuizzesScreenHQStudentState();
}

class _QuizzesScreenHQStudentState extends State<QuizzesScreenHQStudent> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizzesHistoryCubit, QuizzesHistoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/Wallpaper 2.png'),
                  fit: BoxFit.fill)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
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
                    child: ConditionalBuilder(
                      condition:
                      state is! StudentQuizzesHistoryQuizzesLoadingState,
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  QuizzesHistoryCubit.get(context)
                                      .quizzesHistoryStudentQuestionPM!
                                      .questions
                                      .title,
                                  style: const TextStyle(
                                      fontSize: 30, color: AppColors.darkBlue),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    QuizzesHistoryCubit.get(context)
                                        .quizzesHistoryStudentQuestionPM!
                                        .questions
                                        .startTime,
                                    style: const TextStyle(
                                        fontSize: 20, color: AppColors.aqua),
                                  ),
                                ),
                              ],
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 10),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       RichText(
                            //           text: TextSpan(
                            //               style: TextStyle(
                            //                   fontSize: 25,
                            //                   color: AppColors.aqua),
                            //               text: 'Questions',
                            //               children: [
                            //                 TextSpan(
                            //                   text:
                            //                   ' ${QuizCubit.get(context).count}',
                            //                 ),
                            //                 TextSpan(text: '/'),
                            //                 TextSpan(
                            //                     text:
                            //                     '${QuizCubit.get(context).counterOfQuestion}'),
                            //               ])),
                            //     ],
                            //   ),
                            //
                            //   // ProgressTimer(),
                            // ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              height: 450,
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
                                  return QuestionHistoryItem(
                                      questionModel: QuizzesHistoryCubit.get(
                                          context)
                                          .quizzesHistoryStudentQuestionPM!
                                          .questions
                                          .questions[index]);
                                },
                                itemCount: QuizzesHistoryCubit.get(context)
                                    .quizzesHistoryStudentQuestionPM!
                                    .questions
                                    .questions
                                    .length,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                defaultTextButton(
                                    width: 150,
                                    radius: 25.0,
                                    text: 'back',
                                    textColor: AppColors.lightOrange,
                                    function: () {
                                      _pageController.previousPage(
                                          duration: Duration(milliseconds: 3),
                                          curve: Curves.bounceInOut);
                                      QuizzesHistoryCubit.get(context)
                                          .minusCounterStudent();
                                    },
                                    isUpperCase: true,
                                    background: AppColors.darkBlue),
                                defaultTextButton(
                                    width: 150,
                                    radius: 25.0,
                                    text: 'next',
                                    textColor: AppColors.lightOrange,
                                    function: () {
                                      if (QuizzesHistoryCubit.get(context)
                                          .counter !=
                                          QuizzesHistoryCubit.get(context)
                                              .quizzesHistoryStudentQuestionPM!
                                              .questions
                                              .questions
                                              .length) {
                                        _pageController.nextPage(
                                            duration: Duration(milliseconds: 3),
                                            curve: Curves.bounceInOut);
                                        QuizzesHistoryCubit.get(context)
                                            .countStudent();
                                      }
                                      // } else {
                                      //   showDialog(
                                      //     context: context,
                                      //     builder: (context) => AlertDialog(
                                      //       actions: [
                                      //         TextButton(
                                      //             onPressed: () {
                                      //               navigateTo(context,
                                      //                   QuizzesHistory());
                                      //             },
                                      //             child: Center(
                                      //                 child: Text(
                                      //               'Come back',
                                      //               style:
                                      //                   TextStyle(fontSize: 25),
                                      //             )))
                                      //       ],
                                      //     ),
                                      //   );
                                      // }
                                    },
                                    isUpperCase: true,
                                    background: AppColors.darkBlue),
                              ],
                            )
                          ],
                        );
                      },
                      fallback: (BuildContext context) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
