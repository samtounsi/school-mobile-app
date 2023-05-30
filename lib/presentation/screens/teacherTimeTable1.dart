import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/classes/dayNameItem.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/timeTableTeacherComponent.dart';
import 'package:mobile_schoolapp/presentation/screens/dayTable.dart';


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
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Wallpaper 2.png'),
              fit: BoxFit.fill,
            )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.lightOrange,
                          size: 40,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                    padding:
                    const EdgeInsets.only(top: 70, left: 30, right: 30),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                navigateTo(
                                    context,
                                    DayTable(
                                      name: list[index],
                                    ));
                              },
                              child: TimeTableTeacherItem(day: day[index]));
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 30,
                        ),
                        itemCount: 5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
