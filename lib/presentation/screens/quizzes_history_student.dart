import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocHistoryQuizzes/state.dart';
import 'package:mobile_schoolapp/presentation/classes/quizzesHistory.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/screens/quizzesHistoryQuestion.dart';
import '../../business logic/cubits/blocHistoryQuizzes/cubit.dart';
import 'quizzes_history_question_student.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherAddQuizesOrHistory.dart';


class QuizzesHistoryStudent extends StatefulWidget {
  QuizzesHistoryStudent({Key? key}) : super(key: key);

  @override
  State<QuizzesHistoryStudent> createState() => _QuizzesHistoryStudentState();
}

class _QuizzesHistoryStudentState extends State<QuizzesHistoryStudent> {


  @override
  void initState() {
    QuizzesHistoryCubit.get(context).getListQuizzesHistoryStudent();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BlocConsumer<QuizzesHistoryCubit, QuizzesHistoryState>(
            listener: (context, state) {},
            builder: (context, state) {
              var modelSQHL = QuizzesHistoryCubit
                  .get(context)
                  .quizzesHistoryS;
              return ConditionalBuilder(
                condition: state is! QuizzesHistoryGetListStudentLoadingState,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 70, bottom: 30),
                    child: ListView.separated(
                      itemCount: modelSQHL!.length,
                      itemBuilder: (context, index) {
                        DateTime date = DateTime.parse(modelSQHL[index].date);
                        String formattedDate =
                            "${date.day.toString().padLeft(2, '0')}/${date.month
                            .toString().padLeft(2, '0')}/${date.year}";

                        return InkWell(
                          onTap: () {
                            QuizzesHistoryCubit.get(context)
                                .postStudentQuizzesHistoryQuestion(
                                modelSQHL[index].id);
                            navigateTo(context, QuizzesScreenHQStudent(quizId:modelSQHL[index].id));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 30, left: 30, top: 40),
                            child: Container(
                              height: 110,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      color: Color(0x3A75A4FF),
                                      spreadRadius: 5),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${modelSQHL[index].title} ',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: AppColors.darkBlue),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${formattedDate}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.lightOrange),
                                        ),
                                        Text(
                                          '${modelSQHL[index].subject}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.lightOrange),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 1,
                        );
                      },
                    ),
                  );
                },
                fallback: (BuildContext context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          ),
          Container(
            height: 150,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Image.asset(
              'images/head.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 60, left: 160),
            child: Text(
              'Quizzes History',
              style: TextStyle(color: AppColors.lightOrange, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
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
