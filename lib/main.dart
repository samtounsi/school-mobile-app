// ignore_for_file: prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/SettingsCubit/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocAddQuizzes/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocAttendance/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocCalender/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocChat/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocMark/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocParent/cubitParent.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocStudent/cubitStudent.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/cubitTeacher.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/logincubit/login_cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/student_time_table/cubit.dart';
import 'package:mobile_schoolapp/network/cache_helper.dart';
import 'package:mobile_schoolapp/presentation/animations/parentMotion.dart';
import 'package:mobile_schoolapp/presentation/animations/studentMotion.dart';
import 'package:mobile_schoolapp/presentation/animations/teacherMotion.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';
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
import 'package:mobile_schoolapp/shared/bloc_observer.dart';

import 'business logic/cubits/attendanceCubit/cubit.dart';
import 'presentation/screens/attendance_for_teacher.dart';
import 'presentation/screens/myClasses.dart';

GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getToken().then((value) {
    print('get token : $value');
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('on message opened app : done');
    Navigator.pushNamed(
        key.currentState!.context,
        'push',
        );
  });

  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null) {
      print('on message opened app : yes');
      Navigator.pushNamed(key.currentState!.context, 'push',
          );
    }
  });

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingHandler);
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
  //CacheHelper.removeData(key: 'token');
  //CacheHelper.removeData(key: 'id');
  //CacheHelper.removeData(key: 'profile_id');
  // CacheHelper.removeData(key: 'type');
  if (onBoard != null) {
    if (token != null) {
      type = CacheHelper.getData(key: 'type');
      if (type == 'parent') {
        initWidget = ParentMotion();
      } else if (type == 'teacher') {
        initWidget = TeacherMotion();
      } else if (type == 'student') {
        initWidget = StudentMotion();
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

Future<void> firebaseMessagingHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('firebaseMessagingHandler : true');
}

class MyApp extends StatelessWidget {
  final Widget? start;
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
          BlocProvider(create: (context) => StudentAttendanceCubit()),
          BlocProvider(create: (context) => ChatCubit()),
          // BlocProvider(
          //     create: (context) => StudentAttendanceCubit()
          //       ..getAttendanceStudent(
          //           id: profileId,
          //           year: (DateTime.now().month > 6)
          //               ? DateTime.now().year + 1
          //               : DateTime.now().year)),
          BlocProvider(
              create: (context) =>
                  TeacherCubit()..getTeacherProfile(id: profileId!)),
          BlocProvider(create: (context) => AddQuizCubit()),
          BlocProvider(
              create: (context) => StudentCubit()
                ..getStudentProfile(
                    id: profileId!,
                    year: (DateTime.now().month > 6)
                        ? DateTime.now().year + 1
                        : DateTime.now().year)),
          BlocProvider(
              create: (context) =>
                  ParentCubit()..getParentProfile(id: profileId!)),
          BlocProvider(
            create: (context) => CalendarCubit()
              ..getSchoolCalendarData(
                  year: (DateTime.now().month > 6)
                      ? DateTime.now().year + 1
                      : DateTime.now().year,
                  newyear: DateTime.now().year),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => SettingsCubit(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Motion Tab Bar Sample',
          theme: ThemeData(
            primarySwatch: buildMaterialColor(AppColors.darkBlue),
          ),
          home: start,
          routes: {'push': ((context) => const EventScreen())},
        ));
  }
}
