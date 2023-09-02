import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/SettingsCubit/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocAddQuizzes/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocCalender/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocChat/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocMark/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocParent/cubitParent.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocStudent/cubitStudent.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/cubitTeacher.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/logincubit/login_cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/score_board_cubit/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/student_time_table/cubit.dart';
import 'package:mobile_schoolapp/network/cache_helper.dart';
import 'package:mobile_schoolapp/presentation/animations/parentMotion.dart';
import 'package:mobile_schoolapp/presentation/animations/studentMotion.dart';
import 'package:mobile_schoolapp/presentation/animations/teacherMotion.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/screens/login.dart';
import 'package:mobile_schoolapp/presentation/screens/onboard.dart';
import 'package:mobile_schoolapp/shared/bloc_observer.dart';
import 'business logic/cubits/attendanceCubit/cubit.dart';
import 'business logic/cubits/blocEvent/cubit.dart';
import 'business logic/cubits/blocHistoryQuizzes/cubit.dart';
import 'business logic/cubits/blocQuizzesStudent/cubitQuizzes.dart';
import 'business logic/cubits/exam_schedule_cubit/cubit.dart';
import 'notifications/firebase.dart';

GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  await CacheHelper.init();
  Widget? initWidget;
  bool? onBoard = CacheHelper.getData(key: 'onBoard');
  token = CacheHelper.getData(key: 'token');
  id = CacheHelper.getData(key: 'id');
  profileId = CacheHelper.getData(key: 'profile_id');
  type = CacheHelper.getData(key: 'type');
  print(token);
  print(id);
  print(profileId);
  print(type);
  //  CacheHelper.removeData(key: 'token');
  //  CacheHelper.removeData(key: 'id');
  //  CacheHelper.removeData(key: 'profile_id');
  //  CacheHelper.removeData(key: 'type');
  //  CacheHelper.removeData(key: 'onBoard');
  if (onBoard != null) {
    if (token != null) {
      type = CacheHelper.getData(key: 'type');
      if (type == 'parent') {
        initWidget = ParentMotion(initial: "Home", ind: 1);
      } else if (type == 'teacher') {
        initWidget = TeacherMotion(initial: "Home", ind: 1);
      } else if (type == 'student') {
        initWidget = StudentMotion(initial: "Home", ind: 1);
      }
    } else {
      initWidget = Login();
    }
  } else {
    initWidget = Onboard();
  }
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(start: initWidget));
}

class MyApp extends StatelessWidget {
  final Widget? start;
  //static const route = 'to-event';
  MyApp({Key? key, this.start}) : super(key: key);

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
          BlocProvider(create: (context) => StudentTimetableCubit()),
          BlocProvider(create: (context) => ChatCubit()..getChatContacts()),
          BlocProvider(create: (context) => ScoreBoardCubit()),
          BlocProvider(create: (context) => TeacherCubit()
            ..getTeacherProfile(id: profileId!)),
          BlocProvider(create: (context) => AddQuizCubit()),
          BlocProvider(create: (context) => StudentCubit()
                ..getStudentProfile(
                    id: profileId!,
                    year: (DateTime.now().month > 6)
                        ? DateTime.now().year + 1
                        : DateTime.now().year)),
          BlocProvider(create: (context) => ParentCubit()..getParentProfile(id: profileId!)),
          BlocProvider(create: (context) => CalendarCubit()
                ..getSchoolCalendarData(
                    year: (DateTime.now().month > 6)
                        ? DateTime.now().year + 1
                        : DateTime.now().year,
                    newyear: DateTime.now().year)),
          BlocProvider(create: (context) => LoginCubit(),),
          BlocProvider(create: (context) => SettingsCubit(),),
          BlocProvider(create: (context) => EventCubit(),),
          BlocProvider(create: (context) => QuizCubit(),),
          BlocProvider(create: (context) => QuizzesHistoryCubit(),),
          BlocProvider(create: (context) => ExamCubit(),),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Motion Tab Bar Sample',
            theme: ThemeData(
              primarySwatch: buildMaterialColor(AppColors.darkBlue),
            ),
            home: start,
            //navigatorKey: key,
          // routes: {
          //   '/to-event': (context) {
          //     if (type == 'teacher') {
          //       return TeacherMotion(initial: 'Event', ind: 2);
          //     }
          //     if (type == 'student') {
          //       return StudentMotion(initial: 'Event', ind: 2);
          //     } else if (type == 'parent') {
          //       return ParentMotion(initial: 'Event', ind: 2);
          //     }
          //     return Login();
          //   },
          // },

            ));
  }
}
