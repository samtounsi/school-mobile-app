import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/classes/dayNameItem.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';


class DayTable extends StatelessWidget {
  Items name;

  DayTable({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Wallpaper 2.png'),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.lightOrange,
                        size: 35,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${name.dayTable}',
                      style: TextStyle(
                          color: AppColors.lightOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 8, right: 20, left: 20, bottom: 10),
                        child: Container(
                          width: 290,
                          height: 135,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    color: Color(0x3A75A4FF),
                                    spreadRadius: 5)
                              ],
                              border: Border.all(color: AppColors.borderColor),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 26, top: 21),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'class:',
                                      style: TextStyle(
                                          color: AppColors.darkBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('seventh grade/1st',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color:
                                                      AppColors.lightOrange)),
                                          SizedBox(height: 0),
                                          Divider(
                                            color: AppColors.darkBlue,
                                            endIndent: 30,
                                            height: 5,
                                            thickness: 1,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'start time:',
                                      style: TextStyle(
                                          color: AppColors.darkBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('11:00   AM',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color:
                                                      AppColors.lightOrange)),
                                          SizedBox(height: 0),
                                          Divider(
                                            color: AppColors.darkBlue,
                                            endIndent: 30,
                                            height: 5,
                                            thickness: 1,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'end time:',
                                      style: TextStyle(
                                          color: AppColors.darkBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('12:00    PM',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color:
                                                      AppColors.lightOrange)),
                                          SizedBox(height: 0),
                                          Divider(
                                            color: AppColors.darkBlue,
                                            endIndent: 30,
                                            height: 5,
                                            thickness: 1,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
