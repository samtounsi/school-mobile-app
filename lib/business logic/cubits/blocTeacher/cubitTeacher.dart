import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/stateTeacher.dart';
import 'package:mobile_schoolapp/presentation/screens/event.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherhome.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherprofile.dart';


class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(InitialTeacherState());

  static TeacherCubit get(context) => BlocProvider.of(context);
  int? currentIndex = 0;
  List<Widget> teacherScreen = [
    TeacherHome(),

    Event(),
    TeacherProfile(),

    Text('chat'),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexMotionTabBarState());
  }
}
