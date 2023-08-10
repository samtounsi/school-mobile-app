import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/markItem.dart';
import 'package:mobile_schoolapp/presentation/screens/add_quiz.dart';
import '../components and constants/constants.dart';
import 'quizzesHistory.dart';
import 'quizzesScreenStudent.dart';
import 'quizzes_history_question_student.dart';
import 'quizzes_history_student.dart';
import 'package:mobile_schoolapp/presentation/screens/unsolved_quizzes_list_screen.dart';


class StudentQuizzesNewOrHistory extends StatelessWidget {
  const StudentQuizzesNewOrHistory({Key? key}) : super(key: key);

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
            leading:  Padding(
              padding: const EdgeInsets.only(left: 0,top: 25),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);

                },
                icon: Icon(Icons.arrow_back,
                  size: 28,
                  color: AppColors.darkBlue,),),
            ),
            titleSpacing: 10,


          ),

          body: Padding(
            padding: const EdgeInsets.only(top: 100, left: 25, right: 25),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    navigateTo(context, UnSolvedQuizzesListScreen());

                  },
                  child: MarkItem(
                    text: 'New Quizzes',
                    image: 'images/exam (1).png',
                    radius: 35,
                    numS: 25,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    navigateTo(context, QuizzesHistoryStudent());

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
