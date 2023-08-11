import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/screens/addEventTeacher.dart';

class TeacherEvent extends StatelessWidget {
  const TeacherEvent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/Wallpaper 2.png',
              ),
              fit: BoxFit.fill)),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 70),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: 340,
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColor),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                color: Color(0x3A75A4FF),
                                spreadRadius: 5)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10), //10
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: AppColors.lightOrange,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'School Music Festival',
                                        style: TextStyle(
                                            color: AppColors.darkBlue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Description',
                                      style: TextStyle(
                                          color: AppColors.darkBlue,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date:16/6/2011',
                                      style: TextStyle(
                                          color: AppColors.darkBlue,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      '9:00 am',
                                      style: TextStyle(
                                          color: AppColors.darkBlue,
                                          fontSize: 14),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: 10)),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 10),
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: AppColors.aqua),
                child: IconButton(
                  onPressed: () {
                    navigateTo(context, AddEventTeacher());
                  },
                  icon: Icon(
                    Icons.add,
                    color: AppColors.darkBlue,
                    size: 30,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
