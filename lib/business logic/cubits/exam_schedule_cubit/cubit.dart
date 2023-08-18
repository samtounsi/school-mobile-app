
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/exam_schedule_cubit/states.dart';

import '../../../data/models/exam_model.dart';
import '../../../presentation/components and constants/constants.dart';



class ExamCubit extends Cubit<ExamStates> {
  ExamCubit() : super(ExamInitialState());

  static ExamCubit get(context) => BlocProvider.of(context);

  String? classValue;
  String changeGrade(classvalue)
  {
    this.classValue=classvalue;
    emit(ExamChangeGradeState());
    print(classvalue);
    return classvalue;
  }
  String? semesterValue;
  String changeSemester(value) {
    this.semesterValue = value;
    print(value);
    emit(ExamChangeSemesterState());
    return value;
  }

  ExamScheduleModel? examScheduleModel=ExamScheduleModel(
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
  Future getExamSchedule({String? semester,String? grade})async
  {
    emit(ExamGetExamScheduleLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/get_exam_table'));
    request.fields.addAll({
      'grade': grade!,
      'semester': semester!
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      if(examScheduleModel !=null)
      {
        examScheduleModel=null;
      }
      examScheduleModel=ExamScheduleModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      // print(response.statusCode);
      // print(examScheduleModel?.toJson().toString());
      emit(ExamGetExamScheduleSuccessState(examScheduleModel!));
    }
    if (response.statusCode == 401) {
      examScheduleModel=ExamScheduleModel(
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
      // print(response.statusCode);
      // print(examScheduleModel?.toJson().toString());
      emit(ExamGetExamScheduleSuccessState(examScheduleModel!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      // print(response.statusCode);
      // print(error);
      emit(ExamGetExamScheduleErrorState(error));
    }

  }

}
