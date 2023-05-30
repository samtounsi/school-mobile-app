
import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/markItem.dart';


class TeacherMarksAddOrShow extends StatelessWidget {
  const TeacherMarksAddOrShow({Key? key}) : super(key: key);

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
          body: Padding(
            padding: const EdgeInsets.only(
              top: 100,
              left: 25,
              right: 25
            ),
            child: Column(
              children: [
                InkWell(child: MarkItem(text: 'Show Marks', image: 'images/view.png', radius: 35,numS: 25,)),
                SizedBox(
                  height: 40,
                ),
                InkWell(child: MarkItem(text: 'Add Marks', image: 'images/plus-solid.png', radius: 35,numS: 25,)),
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
