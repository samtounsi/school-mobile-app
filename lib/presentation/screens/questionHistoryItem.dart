import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocQuizzesStudent/cubitQuizzes.dart';
import 'package:mobile_schoolapp/presentation/classes/quizzesStudent.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/screens/answerHistory.dart';
import 'package:mobile_schoolapp/presentation/screens/quizzesAnswer.dart';

import '../../business logic/cubits/blocQuizzesStudent/stateQuizzes.dart';



class QuestionHistoryItem extends StatelessWidget {
  final QModel questionModel;

  QuestionHistoryItem({Key? key, required this.questionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
              height: 450,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 450,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          // boxShadow: [
                          //   BoxShadow(blurRadius: 2, color: Color(0x3A75A4FF), spreadRadius: 5),
                          // ],
                          border: Border.all(color: AppColors.borderColor),
                          color: AppColors.lightOrange,

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left:30,top: 10,right: 20),
                          child: Text(
                            questionModel.question,
                            style:TextStyle(
                                color:AppColors.darkBlue,
                                fontSize: 27
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Text('True answer:',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.darkBlue
                          ),),
                          if(questionModel.answer==1)
                            Icon(
                              Mdi.alphaACircleOutline,
                              color: AppColors.lightOrange,
                              size: 40,
                            ),
                          if(questionModel.answer==2)
                            Icon(
                              Mdi.alphaBCircleOutline,
                              color: AppColors.lightOrange,
                              size: 40,
                            ),
                          if(questionModel.answer==3)
                            Icon(
                              Mdi.alphaCCircleOutline,
                              color: AppColors.lightOrange,
                              size: 40,
                            ),

                        ],
                      ),
                      SizedBox(height:15,),
                      ...List.generate(
                          questionModel.options.length,
                              (index)=>Column(
                            children: [
                              AnswerOptionHistory(
                                  question:  questionModel,
                                  index: QuizCubit.get(context).answerIndex(index),
                                  onPressed: () => QuizCubit.get(context)
                                      .checkAnswer(questionModel,
                                      index,true)),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          )),
                      const Spacer(
                        flex: 1,
                      ),
                    ]
                ),
              )),
        );
      },

    );
  }
}
