import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocStudent/stateStudent.dart';
import 'package:mobile_schoolapp/presentation/screens/event.dart';
import 'package:mobile_schoolapp/presentation/screens/eventS&P.dart';
import 'package:mobile_schoolapp/presentation/screens/setting.dart';
import 'package:mobile_schoolapp/presentation/screens/studenthome.dart';
import 'package:mobile_schoolapp/presentation/screens/studentprofile.dart';

import '../../../presentation/screens/contacts.dart';


class StudentCubit extends Cubit<StudentState>{
  StudentCubit():super(InitialStudentState());
  static StudentCubit get(context)=>BlocProvider.of(context);
  int? currentIndex=0;
  List<Widget>studentScreen=[
    StudentHome(),
    EventScreen(),
    StudentProfile(),
    ChatContacts(),
    Setting()

  ];
  void changeIndex(int index){
    currentIndex=index;
    emit(ChangeIndexMotionTabBarState());
  }

}