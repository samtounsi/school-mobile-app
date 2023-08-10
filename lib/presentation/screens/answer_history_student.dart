import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';
import '../../business logic/cubits/blocHistoryQuizzes/cubit.dart';
import '../../business logic/cubits/blocHistoryQuizzes/state.dart';
import '../../data/models/quizzes_history_teacher_post_model.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';


class AnswerOptionHistoryStudent extends StatelessWidget {
  List<Icon> icon = [
    Icon(
      Mdi.alphaACircleOutline,
      color: AppColors.lightOrange,
      size: 40,
    ),
    Icon(
      Mdi.alphaBCircleOutline,
      color: AppColors.lightOrange,
      size: 40,
    ),
    Icon(
      Mdi.alphaCCircleOutline,
      color: AppColors.lightOrange,
      size: 40,
    ),
  ];
  int index;
  QuestionHTeacher question;

  AnswerOptionHistoryStudent({Key? key, required this.index, required this.question})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizzesHistoryCubit, QuizzesHistoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(
                width: 280,
                height: 65,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2, color: Color(0x3A75A4FF), spreadRadius: 5),
                  ],
                  border: Border.all(color: Colors.white, width: 3),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          icon[index],
                          SizedBox(
                            width: 15,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: question.choices[index],
                                style: TextStyle(
                                    fontSize: 25, color: AppColors.darkBlue),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
