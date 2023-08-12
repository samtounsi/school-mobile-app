import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/cubitTeacher.dart';
import 'package:mobile_schoolapp/presentation/classes/dayNameItem.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/timeTableTeacherComponent.dart';
import 'dayTable.dart';

class TeacherTimeTable extends StatelessWidget {
  List<Items> list = [
    Items(dayTable: 'Sunday Table'),
    Items(dayTable: 'Monday Table'),
    Items(dayTable: 'Tuesday Table'),
    Items(dayTable: 'Wednesday Table'),
    Items(dayTable: 'Thursday Table'),
  ];
  List<String> day = ['SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY'];

  TeacherTimeTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 30, right: 30),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  TeacherCubit.get(context)
                                      .postDayForGetTimeTable(day[index]);
                                  navigateTo(
                                      context,
                                      DayTable(
                                        name: list[index],
                                      ));
                                },
                                child: TimeTableTeacherItem(day: day[index]));
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 30,
                              ),
                          itemCount: 5)),
                ),
              ],
            ),
          ),
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/head.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.darkBlue,
                  size: 35,
                )),
          ),
        ],
      ),
    );
  }
}
