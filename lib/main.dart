import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/animations/parentMotion.dart';
import 'package:mobile_schoolapp/presentation/animations/studentMotion.dart';
import 'package:mobile_schoolapp/presentation/animations/teacherMotion.dart';

import 'presentation/screens/myClasses.dart';
void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Motion Tab Bar Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TeacherMotion()
    );
  }
}