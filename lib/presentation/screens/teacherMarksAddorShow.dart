
import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocMark/cubit.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/markItem.dart';
import 'package:mobile_schoolapp/presentation/screens/add_marks.dart';
import 'package:mobile_schoolapp/presentation/screens/show_marks_for_teacher.dart';

import '../components and constants/constants.dart';


class TeacherMarksAddOrShow extends StatelessWidget {
  String gradeSection;
  String semester;
  String type;
  String subject;
   TeacherMarksAddOrShow({super.key,required this.gradeSection,required this.semester
     ,required this.type,required this.subject});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Wallpaper 2.png'),
            fit: BoxFit.fill
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading:  IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back,
                weight: 2,
                size: 35,
                color: Colors.white,),),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 25,
              left: 25,
              right: 25
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text('Select Action',
                    style: TextStyle(
                        color: AppColors.lightOrange,
                        fontSize: 30,
                        fontWeight:FontWeight.w600
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                InkWell(
                    onTap: ()
                    {
                      MarksCubit.get(context).getStudentsMarks(
                          gradeSection: gradeSection!,
                          semester: semester,
                          type: type,
                          subject: subject).then((value) => navigateTo(context, ShowMarks()));
                    },
                    child: MarkItem(text: 'Show Marks', image: 'images/view.png', radius: 35,numS: 25,)),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                    onTap: ()
                    {
                      navigateTo(context, AddMarks(
                        gradeSection: gradeSection!,
                        semester: semester,
                        type:type,
                        subject: subject,
                      ));
                    },
                    child: MarkItem(text: 'Add Marks', image: 'images/plus-solid.png', radius: 35,numS: 25,)),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 60,
                    right: 30
                  ),
                  child: Image.asset('images/exam (1).png',height: 250,width: 250,
                  fit: BoxFit.cover,),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
