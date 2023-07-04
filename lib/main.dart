import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocAddQuizzes/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocAttendance/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocCalender/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocChat/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocMark/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocParent/cubitParent.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocStudent/cubitStudent.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/cubitTeacher.dart';
import 'package:mobile_schoolapp/presentation/animations/parentMotion.dart';
import 'package:mobile_schoolapp/presentation/animations/studentMotion.dart';
import 'package:mobile_schoolapp/presentation/animations/teacherMotion.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/screens/addEventTeacher.dart';
import 'package:mobile_schoolapp/presentation/screens/add_marks.dart';
import 'package:mobile_schoolapp/presentation/screens/add_quiz.dart';
import 'package:mobile_schoolapp/presentation/screens/chat_screen.dart';
import 'package:mobile_schoolapp/presentation/screens/chooseClassTeacher.dart';
import 'package:mobile_schoolapp/presentation/screens/choose_subject.dart';
import 'package:mobile_schoolapp/presentation/screens/contacts.dart';
import 'package:mobile_schoolapp/presentation/screens/eventS&P.dart';
import 'package:mobile_schoolapp/presentation/screens/login.dart';
import 'package:mobile_schoolapp/presentation/screens/onboard.dart';
import 'package:mobile_schoolapp/presentation/screens/quizzesHistory.dart';
import 'package:mobile_schoolapp/presentation/screens/quizzesHistoryQuestion.dart';
import 'package:mobile_schoolapp/presentation/screens/quizzesScreenStudent.dart';
import 'package:mobile_schoolapp/presentation/screens/score_board.dart';
import 'package:mobile_schoolapp/presentation/screens/show_marks_for_student.dart';
import 'package:mobile_schoolapp/presentation/screens/student_attendance.dart';

import 'business logic/cubits/attendanceCubit/cubit.dart';
import 'presentation/screens/attendance_for_teacher.dart';
import 'presentation/screens/myClasses.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MarksCubit(),
          ),
          BlocProvider(
            create: (context) => SectionAttendanceCubit(),
          ),
          BlocProvider(create: (context) => StudentAttendanceCubit()),
          BlocProvider(create: (context) => ChatCubit()),
          BlocProvider(create: (context) => StudentAttendanceCubit()),
          BlocProvider(create: (context) => TeacherCubit()),
          BlocProvider(create: (context) => AddQuizCubit()),
          BlocProvider(create: (context) => StudentCubit()),
          BlocProvider(create: (context) => ParentCubit()),
          BlocProvider(create: (context) => CalendarCubit()..getHolidays()),

        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Motion Tab Bar Sample',
            theme: ThemeData(
              primarySwatch: buildMaterialColor(AppColors.darkBlue),
            ),
            home: StudentMotion()));
  }
}
