import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocHistoryQuizzes/state.dart';
import 'package:mobile_schoolapp/presentation/classes/quizzesHistory.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import '../../business logic/cubits/blocHistoryQuizzes/cubit.dart';
import 'quizzesHistoryQuestion.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherAddQuizesOrHistory.dart';

class QuizzesHistory extends StatefulWidget {
  QuizzesHistory({Key? key}) : super(key: key);

  @override
  State<QuizzesHistory> createState() => _QuizzesHistoryState();
}

class _QuizzesHistoryState extends State<QuizzesHistory> {
  @override
  void initState() {
    QuizzesHistoryCubit.get(context).getListQuizzesHistoryForTeacher();
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
              var modelTQHL = QuizzesHistoryCubit.get(context)
                  .quizzesHistoryTeacherGetModel;
              return ConditionalBuilder(
                condition: state is! QuizzesHistoryGetListTeacherLoadingState,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 70, bottom: 30),
                    child: ListView.separated(
                      itemCount: modelTQHL!.length,
                      itemBuilder: (context, index) {
                        DateTime date = DateTime.parse(modelTQHL[index].date);
                        String formattedDate =
                            "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";

                        return InkWell(
                          onTap: () {
                            QuizzesHistoryCubit.get(context)
                                .postTeacherQuizzesHistoryQuestion(
                                    modelTQHL[index].id);
                            navigateTo(
                                context,
                                QuizzesScreenHQ(
                                  quizId: modelTQHL[index].id,
                                ));
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
                                          '${modelTQHL[index].title} ',
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
                                          '${modelTQHL[index].subject}',
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
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/head.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 10),
            child: Row(
              children: [
                Spacer(),
                Text(
                  'Quizzes History',
                  style: TextStyle(color: AppColors.lightOrange, fontSize: 20),
                ),
              ],
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
                  size: 35,
                )),
          )
        ],
      ),
    );
  }
}
