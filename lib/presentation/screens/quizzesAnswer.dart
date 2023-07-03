import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

import '../../business logic/cubits/blocQuizzesStudent/cubitQuizzes.dart';
import '../../business logic/cubits/blocQuizzesStudent/stateQuizzes.dart';
import '../classes/quizzesStudent.dart';


class AnswerOption extends StatelessWidget {
  List<Icon>icon=[
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
  VoidCallback onPressed;
  QModel question;
  AnswerOption({
    Key? key,
    required this.index,
    required this.onPressed,
    required this.question
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
            onTap:question.isSelected?null:onPressed,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(width: 280,
                height: 65,),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(blurRadius: 2, color: Color(0x3A75A4FF), spreadRadius: 5),
                  ],
                  border: Border.all(color:QuizCubit.get(context).getColor(question,index+1),
                  width: 3),
                  color:question.options[index].isClicked?AppColors.lightOrange:Colors.white

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
                          SizedBox(width: 15,),
                          RichText(

                            text: TextSpan(
                                // text: '${index + 1}. ',
                                children: [
                                  TextSpan(
                                    text: question.options[index].text,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: AppColors.darkBlue
                                    ),
                                  ),
                                ]),
                          ),
                       ],
                     ),
                      // if (QuizCubit.get(context).checkIsQuestionAnswered(questionId) &&
                      if (question.isSelected)
                        Container(
                            width: 30,
                            height: 30,
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: QuizCubit.get(context).getColor(question,index+1),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                                shape: BoxShape.circle),
                            child: Icon(
                              QuizCubit.get(context).getIcon(question,index+1),
                              color: Colors.white,
                            ))
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
