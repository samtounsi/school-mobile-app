import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/classes/quizzesHistory.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherAddQuizesOrHistory.dart';

class QuizzesHistory extends StatelessWidget {
   QuizzesHistory({Key? key}) : super(key: key);
  List<QuizzesHistoryS>quizzesHistory=[
    QuizzesHistoryS(name:'Math Quiz', date: '16 /6/2024'),
    QuizzesHistoryS(name: 'Arabic Quiz', date: '15/4/2024'),
    QuizzesHistoryS(name: 'English Quiz', date: '16/4/2024'),
    QuizzesHistoryS(name: 'Math Quiz', date: '20/4/2024'),
    QuizzesHistoryS(name: 'French Quiz', date: '15/5/2024'),
    QuizzesHistoryS(name: 'Programming Quiz', date: '1/4/2024'),
    QuizzesHistoryS(name: 'Art Quiz', date: '17/1/2024'),
    QuizzesHistoryS(name: 'Music Quiz', date: '15/4/2024'),
    QuizzesHistoryS(name: 'Physic Quiz', date: '15/4/2024'),
    QuizzesHistoryS(name: ' Chemistry Quiz', date: '15/4/2024'),
    QuizzesHistoryS(name: 'Science Quiz', date: '15/4/2024'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70,bottom:30),
              child: ListView.separated(
                itemCount:quizzesHistory.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30,left: 30,top: 40),
                    child: Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2, color: Color(0x3A75A4FF), spreadRadius: 5),
                        ],
                      ),
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${quizzesHistory[index].name}',
                                style: TextStyle(fontSize: 30,
                                color: AppColors.darkBlue),),

                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,

                              children: [
                                Container(),
                                Text('${quizzesHistory[index].date}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.lightOrange
                                ),)
                              ],
                            ),
                          )
                        ],
                      ) ,
                    ),
                  );

                }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 1,); },
              ),
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
              padding: const EdgeInsets.only(top: 40,right: 60,left:160),
              child: Text('Quizzes History',
              style: TextStyle(
                color: AppColors.lightOrange,
                fontSize: 20
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: IconButton(onPressed:(){
                Navigator.pop(context);

              }, icon: Icon(Icons.arrow_back,
              color: AppColors.darkBlue,
              size: 30,)),
            )
          ],
        ),
      );
  }
}
