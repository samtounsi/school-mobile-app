import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business logic/cubits/blocAttendance/cubit.dart';
import '../../business logic/cubits/blocStudent/cubitStudent.dart';
import '../../business logic/cubits/blocStudent/stateStudent.dart';
import '../components and constants/constants.dart';

var model;
class StudentAttendance extends StatelessWidget {
  StudentAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit,StudentState>(
      listener: (context, state)
      {
        if(state is GetStudentProfileSuccessState)
        {
          model=state.studentProfileModel;
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ConditionalBuilder(
              condition: StudentCubit.get(context).studentProfileModel!=null,
              builder: (context)
              {
                model=StudentCubit.get(context).studentProfileModel;
                return Column(
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
                          child: Center(child: Text(model.numberOfAbsenceDays.toString(), style: TextStyle(fontSize: 22, color: AppColors.darkBlue),)),
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
                          itemBuilder: (context, index) => buildItem(model.absences[index]),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ),
                          itemCount: model.absences.length,
                        ),
                      ),
                    )
                  ],
                );
              },
              fallback: (context)=>Center(child: CircularProgressIndicator()),
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
