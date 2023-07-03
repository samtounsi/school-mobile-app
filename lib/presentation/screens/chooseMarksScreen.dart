import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/containerItem.dart';
import 'package:mobile_schoolapp/presentation/screens/show_marks_for_student.dart';

class ChooseMarks extends StatelessWidget {
  const ChooseMarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/Wallpaper 2.png'),
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.darkBlue,
                          size: 30,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 70,
                  right: 40,
                  top: 50,
                ),
                child: Column(
                  children: [
                    SvgPicture.asset('images/Learning-pana BLUE.svg'),
                  ],
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          navigateTo(context, ShowStudentMarks());
                        },
                        child: ContainerItem(
                          title: 'Monthly Test Marks',
                          fontSize: 25,
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, ShowStudentMarks());
                      },
                      child: ContainerItem(
                        title: 'Final Marks',
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
