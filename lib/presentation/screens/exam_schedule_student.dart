
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/exam_schedule_cubit/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/exam_schedule_cubit/states.dart';

import '../../shared/utils.dart';
import '../../data/models/exam_model.dart';
import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import '../components and constants/dropdown.dart';

final columns = ['Subject', 'Date', 'Period'];
String? semesterValue;
var model;



class ExamStudentSchedule extends StatelessWidget {
  String? grade;
   ExamStudentSchedule({this.grade});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamCubit,ExamStates>(
      listener: (context,state)
      {
        if(state is ExamGetExamScheduleSuccessState)
        {
          model=state.examScheduleModel;
        }
      },
      builder: (context,state)
      {
        if(state is ExamGetExamScheduleSuccessState)
        {
          model=state.examScheduleModel;
        }
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
                        width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Wallpaper (5).png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Scaffold(
              appBar:AppBar(
                backgroundColor: Colors.transparent,
                   elevation: 0,
                   leading: IconButton(
                      onPressed: () {
                        ExamCubit.get(context).examScheduleModel=ExamScheduleModel(
                            exist: 0,
                            examsList: [
                              ExamsList(subject: '',date: '                   ',period: ''),
                              ExamsList(subject: '',date: '                   ',period: ''),
                              ExamsList(subject: '',date: '                   ',period: ''),
                              ExamsList(subject: '',date: '                   ',period: ''),
                              ExamsList(subject: '',date: '                   ',period: ''),
                              ExamsList(subject: '',date: '                   ',period: ''),
                              ExamsList(subject: '',date: '                   ',period: ''),
                              ExamsList(subject: '',date: '                   ',period: ''),
                              ExamsList(subject: '',date: '                   ',period: ''),
                              ExamsList(subject: '',date: '                   ',period: ''),
                              ExamsList(subject: '',date: '                   ',period: ''),
                              ExamsList(subject: '',date: '                   ',period: ''),
                            ],
                            message: "exam table has not been added yet"
                        );
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.darkBlue,
                      ),
                    ),
                   titleSpacing: 0,
                   title: Text(
                      'Exam Schedule',
                      style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                   actions: [ ConditionalBuilder(
                     condition:state is ! ExamGetExamScheduleLoadingState,
                     builder:(context)
                     {
                       return  IconButton(
                         onPressed: ()
                         {
                           ExamCubit.get(context).getExamSchedule(grade: grade,semester: semesterValue);
                         },
                         icon:  Icon(
                           Mdi.checkBoxOutline,
                           color:AppColors.aqua,
                           size: 30,
                         ),
                       );
                     }
                     ,
                     fallback: (context)=>Center(child: CircularProgressIndicator()),
                   ),],
                ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                      child: Row(
                        children: [
                          buildDropdown(label: 'Semester',
                              labelColor: AppColors.lightOrange,
                              list: ['1','2'],
                              hintText: Text('Select Semester',
                                style: TextStyle(fontSize: 15,color: AppColors.darkBlue),),
                              onChanged: (value){
                                ExamCubit.get(context).changeSemester(value!);
                                semesterValue = ExamCubit.get(context).semesterValue;
                              },
                              maxLength:  2,
                              value: semesterValue
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                      SizedBox(
                            height: 20,
                          ),
                     Center(
                          child: DataTable(
                            columns: getColumns(columns),
                            rows: getRows(ExamCubit.get(context).examScheduleModel!.examsList!,context),
                            border: TableBorder.all(width: 1, color: AppColors.darkBlue),
                            columnSpacing:ExamCubit.get(context).examScheduleModel!.examsList?.length !=0? 45:150,
                            headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => AppColors.lightOrange),
                            // dataRowColor: MaterialStateColor.resolveWith((states) => AppColors.lightOrange),
                          ),
                        )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
          label: Text(
            column,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.darkBlue),
          ));
    }).toList();
  }

  List<DataRow> getRows(List<ExamsList> exams,context) {
    return exams.map((ExamsList exam) {
      final cells = [
        exam.subject,
        exam.date.toString().substring(0,10)
        ,
        exam.period,
      ];
      return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            return DataCell(Text(
              '$cell',
              style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ));
          }));
    }).toList();
  }
}


