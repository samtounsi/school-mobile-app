import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocQuizzesStudent/stateQuizzes.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/screens/questionHistoryItem.dart';
import 'package:mobile_schoolapp/presentation/screens/questionItem.dart';
import 'package:mobile_schoolapp/presentation/screens/quizzesHistory.dart';
import 'package:mobile_schoolapp/presentation/screens/score_board.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherTimeTable1.dart';

import '../../business logic/cubits/blocQuizzesStudent/cubitQuizzes.dart';
import '../components and constants/components.dart';

class QuizzesScreenHQ extends StatefulWidget {
  String subject;
   QuizzesScreenHQ({Key? key,required this.subject}) : super(key: key);

  @override
  State<QuizzesScreenHQ> createState() => _QuizzesScreenHQState();
}

class _QuizzesScreenHQState extends State<QuizzesScreenHQ> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(),
      child: BlocConsumer<QuizCubit, QuizState>(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.subject}',
                                style: TextStyle(
                                    fontSize: 25, color: AppColors.darkBlue),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              '${QuizCubit.get(context).counterOfQuestion}'),
                                    ])),
                              ],
                            ),

                            // ProgressTimer(),
                          ),
                          SizedBox(
                            height: 10,
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
                                  questionModel: QuizCubit.get(context)
                                      .questionsList[index],
                                );
                              },
                              itemCount:
                                  QuizCubit.get(context).questionsList.length,
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
                                            .counterOfQuestion) {
                                      _pageController.nextPage(
                                          duration: Duration(milliseconds: 3),
                                          curve: Curves.bounceInOut);
                                      QuizCubit.get(context).counter();
                                    }
                                    else{
                                      showDialog(context: context, builder: (context) => AlertDialog(
                                        actions: [
                                          TextButton(onPressed:(){
                                            navigateTo(context, QuizzesHistory());
                                          }, child: Center(child: Text('Come back',
                                          style: TextStyle(
                                            fontSize: 25
                                          ),)))
                                        ],
                                      ),);
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
              ),
            ),
          );
        },
      ),
    );
  }
}
