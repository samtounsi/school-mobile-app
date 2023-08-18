import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/markItem.dart';
import 'package:mobile_schoolapp/presentation/screens/choose_subject.dart';
import 'package:mobile_schoolapp/presentation/screens/show_marks_for_student.dart';

import '../../business logic/cubits/blocMark/cubit.dart';
import '../../business logic/cubits/blocMark/states.dart';
import '../../business logic/cubits/blocParent/cubitParent.dart';
import '../../business logic/cubits/blocStudent/cubitStudent.dart';
import '../../business logic/cubits/blocStudent/stateStudent.dart';
import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import '../components and constants/dropdown.dart';
import 'chooseMarksScreen.dart';

String? yearValue;
class ChooseYear extends StatelessWidget {
  String? examType;
  String? semester;
  ChooseYear({super.key, this.examType,this.semester});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Wallpaper 2.png'), fit: BoxFit.fill)),
      child: BlocConsumer<StudentCubit, StudentState>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = StudentCubit.get(context).getYearsModel;
          return ConditionalBuilder(
            condition: state is ! GetStudentMarksLoadingState,
            builder: (BuildContext context) {
              return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 35),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppColors.darkBlue,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    Text(
                                      "Year of Marks",
                                      style: TextStyle(
                                          color: AppColors.darkBlue,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: 45,
                                ),
                                SvgPicture.asset(
                                    "images/Teacher student-rafiki Orange.svg"),
                                Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, left: 20),
                                        child:  buildDropdown(label: '',
                                            width: 250,
                                            labelColor: AppColors.lightOrange,
                                            list:StudentCubit.get(context).getYearsModel!.years!,
                                            hintText: Text('Select Year',
                                              style: TextStyle(fontSize: 15,color: AppColors.darkBlue),),
                                            onChanged: (value){
                                              StudentCubit.get(context).changeYear(value!);
                                              yearValue =StudentCubit.get(context).yearValue;
                                            },
                                            maxLength: StudentCubit.get(context).getYearsModel!.years!.length ,
                                            value: yearValue
                                        )
                                    ),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                MaterialButton(
                                  onPressed: ()
                                  {
                                    if(type=='student')
                                    {
                                      MarksCubit.get(context).getStudentMarks(
                                          semester: semester!,
                                          type: examType,
                                          year: yearValue,
                                          id: profileId!);
                                      navigateTo(context, ShowStudentMarks());
                                    }
                                    if(type=='parent')
                                    {
                                      MarksCubit.get(context).getStudentMarks(
                                          semester: semester!,
                                          type: examType,
                                          year: yearValue,
                                          id: ParentCubit.get(context).childId!);
                                      navigateTo(context, ShowStudentMarks());
                                    }
                                  },
                                  child: Text(
                                    'submit',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: AppColors.darkBlue),
                                  ),
                                  color: AppColors.aqua,
                                  minWidth: 230,
                                  height: 48,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(13)),
                                  ),
                                )
                              ],
                            ))
                      ]));
            },
            fallback: (BuildContext context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
