import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/stateTeacher.dart';
import 'package:mobile_schoolapp/presentation/classes/gradeAndSectionClass.dart';
import 'package:mobile_schoolapp/presentation/screens/event.dart';
import 'package:mobile_schoolapp/presentation/screens/setting.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherhome.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherprofile.dart';

import '../../../presentation/screens/contacts.dart';


class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(InitialTeacherState());

  static TeacherCubit get(context) => BlocProvider.of(context);
  int? currentIndex = 0;
  List<Widget> teacherScreen = [
    TeacherHome(),

    TeacherEvent(),
    TeacherProfile(),
    ChatContacts(),
   Setting(),
  ];
  GradeTeacher? currentItem;
  void gradeChangeItem(GradeTeacher value)
  {
    currentItem=value;
    emit(ChangeDropDownItem());


  }


  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexMotionTabBarState());
  }

  String? dropDown2;

  void changeSection(String value) {
    dropDown2 = value;
    emit(ChangeSectionTeacherState());
  }
}