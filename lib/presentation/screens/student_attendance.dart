import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business logic/cubits/blocAttendance/cubit.dart';
import '../../business logic/cubits/blocAttendance/states.dart';
import '../components and constants/constants.dart';


class StudentAttendance extends StatelessWidget {
  StudentAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentAttendanceCubit,StudentAttendanceStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text('Present:',
                       style: TextStyle( fontSize: 25, color: AppColors.lightOrange, fontWeight: FontWeight.bold),),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 90,
                      height: 33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(
                          color:  AppColors.darkBlue,
                          width: 2,
                        ),
                      ),
                      child: Center(child: Text('2', style: TextStyle(fontSize: 22, color: AppColors.darkBlue),)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('days.', style: TextStyle(fontSize: 19, color:  AppColors.darkBlue),),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text('Absence:',
                        style: TextStyle(fontSize: 25, color:  AppColors.lightOrange, fontWeight: FontWeight.bold),),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 90,
                      height: 33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(
                          color:  AppColors.darkBlue,
                          width: 2,
                        ),
                      ),
                      child: Center(child: Text('2', style: TextStyle(fontSize: 22, color: AppColors.darkBlue),)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('days.',style: TextStyle( fontSize: 19, color:  AppColors.darkBlue),),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.all( 20),
                  child: Text('Dates of Absence:',
                     style: TextStyle( color: AppColors.lightOrange, fontWeight: FontWeight.bold, fontSize: 25),),
                ),
                Container(
                  child: Expanded(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildItem(StudentAttendanceCubit.get(context).dates[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                      itemCount: StudentAttendanceCubit.get(context).dates.length,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 190,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/head.png',
                fit: BoxFit.fill,
              ),
            ),

            Padding(
              padding:  EdgeInsetsDirectional.only(top:10.0,),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color:  AppColors.darkBlue,
                        size: 30,
                      )),
                  SizedBox(width: 15,),
                  Text('Attendance', style: TextStyle(fontSize: 25, color: Colors.white),),
                Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(DateTime date) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 50.0),
      child: Row(
        children: [
          Container(
            width: 300,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              border: Border.all(color:  AppColors.darkBlue, width: 2),
            ),
            child: Center(
                child: Text('${date.day} / ${date.month} / ${date.year}',
                    style: TextStyle(fontSize: 22, color:  AppColors.darkBlue),)),
          ),
        ],
      ),
    );
  }

  
}
