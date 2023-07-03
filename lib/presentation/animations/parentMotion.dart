import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import '../../business logic/cubits/blocParent/cubitParent.dart';
import '../../business logic/cubits/blocParent/stateParent.dart';

class ParentMotion extends StatefulWidget {
  const ParentMotion({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  ParentMotionState createState() => ParentMotionState();
}

class ParentMotionState extends State<ParentMotion>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParentCubit, ParentState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: MotionTabBar(
              initialSelectedTab: "Home",
              useSafeArea: true,
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
                ParentCubit.get(context).changeIndex(value);
              },
            ),
            body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                // swipe navigation handling is not supported
                controller: _tabController,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  for (int i = 0; i < 5; i++)
                    ParentCubit.get(context)
                        .screens![ParentCubit.get(context).currentIndex!]
                ]),
          ),
        );
      },
    );
  }
}
