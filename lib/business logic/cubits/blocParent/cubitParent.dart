import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocParent/stateParent.dart';
import 'package:mobile_schoolapp/presentation/screens/event.dart';
import 'package:mobile_schoolapp/presentation/screens/eventS&P.dart';
import 'package:mobile_schoolapp/presentation/screens/parenthome.dart';
import 'package:mobile_schoolapp/presentation/screens/parentprofile.dart';
import 'package:mobile_schoolapp/presentation/screens/setting.dart';

import '../../../presentation/screens/contacts.dart';

class ParentCubit extends Cubit<ParentState> {
  ParentCubit() : super(InitialParentState());

  static ParentCubit get(context) => BlocProvider.of(context);
  int? currentIndex = 0;
  List<Widget>? screens = [
    ParentHome(),
    EventScreen(),
    ParentProfile(),
    ChatContacts(),
    Setting(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexMotionTabBarState());
  }
}
