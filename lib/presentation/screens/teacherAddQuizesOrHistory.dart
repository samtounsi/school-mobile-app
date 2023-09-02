import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/score_board_cubit/cubit.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/markItem.dart';
import 'package:mobile_schoolapp/presentation/screens/add_quiz.dart';
import 'package:mobile_schoolapp/presentation/screens/quizzesHistory.dart';
import 'package:mobile_schoolapp/presentation/screens/score_board.dart';

import '../components and constants/constants.dart';

class TeacherQuizzesAddOrHistory extends StatelessWidget {
  const TeacherQuizzesAddOrHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Wallpaper 2.png'), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(left: 0, top: 25),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 35,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
            titleSpacing: 10,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 100, left: 25, right: 25),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    navigateTo(context, AddQuizScreen());
                  },
                  child: MarkItem(
                    text: 'Add Quizzes',
                    image: 'images/plus-solid.png',
                    radius: 35,
                    numS: 25,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    navigateTo(context, QuizzesHistory());
                  },
                  child: MarkItem(
                    text: 'Quizzes History',
                    image: 'images/view.png',
                    radius: 35,
                    numS: 25,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 30),
                  child: Image.asset(
                    'images/exam.png',
                    height: 225,
                    width: 225,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
