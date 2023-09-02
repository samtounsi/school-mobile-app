import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocStudent/cubitStudent.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocStudent/stateStudent.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class StudentMotion extends StatefulWidget {
  const StudentMotion(
      {Key? key, this.title,  this.initial,  this.ind})
      : super(key: key);

  final String? title;
  final String? initial;
  final int? ind;

  @override
  StudentMotionState createState() => StudentMotionState(initial!, ind!);
}

class StudentMotionState extends State<StudentMotion>
    with TickerProviderStateMixin {
  TabController? _tabController;
  String initial;
  int ind;
  StudentMotionState(this.initial, this.ind);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: ind,
      length: 5,
      vsync: this,
    );
    StudentCubit.get(context).currentIndex = ind - 1;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentState>(
      listener: (context, state) {
        if (state is ChangeIndexToProfileState) {
        StudentCubit.get(context).getStudentProfile(
            id: profileId!,
            year: (DateTime.now().month > 6)
                ? DateTime.now().year + 1
                : DateTime.now().year);
      }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: MotionTabBar(
            initialSelectedTab: initial,
            useSafeArea: false,
            // default: true, apply safe area wrapper
            labels: const ["Home", "Event", "Profile", "Chat", "Setting"],
            icons: const [
              Icons.home,
              Icons.event,
              Icons.person,
              Icons.chat,
              Icons.settings
            ],

            // optional badges, length must be same with labels
            // badges: [
            //   // Default Motion Badge Widget
            //   const MotionBadgeWidget(
            //     text: '99+',
            //     textColor: Colors.white, // optional, default to Colors.white
            //     color: Colors.red, // optional, default to Colors.red
            //     size: 18, // optional, default to 18
            //   ),
            //
            //   // custom badge Widget
            //   Container(
            //     color: Colors.black,
            //     padding: const EdgeInsets.all(2),
            //     child: const Text(
            //       '48',
            //       style: TextStyle(
            //         fontSize: 14,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            //
            //   // allow null
            //   null,
            //
            //   // Default Motion Badge Widget with indicator only
            //   const MotionBadgeWidget(
            //     isIndicator: true,
            //     color: Colors.red, // optional, default to Colors.red
            //     size: 5, // optional, default to 5,
            //     show: true, // true / false
            //   ),
            // ],
            tabSize: 50,
            tabBarHeight: 50,
            textStyle: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            tabIconColor: Colors.white,
            tabIconSize: 30,
            tabIconSelectedSize: 50,
            tabSelectedColor: AppColors.darkBlue,
            tabIconSelectedColor: Colors.white,
            tabBarColor: AppColors.darkBlue,
            onTabItemSelected: (int value) {
              StudentCubit.get(context).changeIndex(value);
            },
          ),
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              // swipe navigation handling is not supported
              controller: _tabController,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                for (int i = 0; i < 5; i++)
                  StudentCubit.get(context)
                      .studentScreen[StudentCubit.get(context).currentIndex!],
              ]),
        );
      },
    );
  }
}
