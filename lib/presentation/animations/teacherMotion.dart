import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/cubitTeacher.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/stateTeacher.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';


class TeacherMotion extends StatefulWidget {
  const TeacherMotion({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  TeacherMotionState createState() => TeacherMotionState();
}

class TeacherMotionState extends State<TeacherMotion>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 4,
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
    return BlocProvider(
      create: (context) => TeacherCubit(),
      child: BlocConsumer<TeacherCubit, TeacherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              // floatingActionButton: FloatingActionButton(
              //   backgroundColor: AppColors.aqua,
              //   onPressed: () {
              //     showDialog(context: context, builder: (context) => Padding(
              //       padding: const EdgeInsets.all(.0),
              //       child: AlertDialog(
              //         backgroundColor: AppColors.aqua,
              //         title:Text('Add Event',
              //           style: TextStyle(
              //               color: AppColors.darkBlue,
              //               fontSize: 22
              //           ),),
              //         content: Column(
              //           children: [
              //             SizedBox(height: 15,),
              //             Container(
              //               padding: EdgeInsets.only(left: 10),
              //               width: double.infinity,
              //               height: 50,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(4),
              //                   border: Border.all(color:AppColors.darkBlue),
              //                   color: Colors.white
              //               ),
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                   hintText: 'Title',
              //
              //                 ),
              //               ),
              //             ),
              //             SizedBox(height: 10,),
              //             Container(
              //               height: 50,
              //               width: double.infinity,
              //               padding: EdgeInsets.only(left: 10),
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(4),
              //                   border: Border.all(color: AppColors.darkBlue),
              //                   color: Colors.white
              //               ),
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                     hintText: 'Description'
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 10,
              //             ),
              //             Container(
              //               height: 50,
              //               width: double.infinity,
              //               padding: EdgeInsets.only(left: 10),
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(4),
              //                   border: Border.all(color: AppColors.darkBlue),
              //                   color: Colors.white
              //               ),
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                     hintText: 'Date'
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 10,
              //             ),
              //             Container(
              //               height: 50,
              //               width: double.infinity,
              //               padding: EdgeInsets.only(left: 10),
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(4),
              //                   border: Border.all(color: AppColors.darkBlue),
              //                   color: Colors.white
              //               ),
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                     hintText: 'Time'
              //                 ),
              //               ),
              //             ),
              //             SizedBox(height: 8,),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               children: [
              //                 TextButton(onPressed: (){}, child:Text('Add',
              //                   style: TextStyle(
              //                       fontSize: 22,
              //                       color:AppColors.darkBlue
              //                   ),)),
              //                 TextButton(onPressed: (){
              //                   Navigator.pop(context);
              //                 }, child: Text('cancel', style: TextStyle(
              //                     color: AppColors.darkBlue,
              //                     fontSize: 22
              //                 ),))
              //               ],
              //             )
              //
              //           ],
              //         ),
              //
              //       ),
              //     ),);
              //   },
              //   child: Icon(Icons.add),
              // ),
              backgroundColor: Colors.transparent,
              bottomNavigationBar: MotionTabBar(
                initialSelectedTab: "Home",
                useSafeArea: true,
                // default: true, apply safe area wrapper
                labels: const ["Home", "Event", "Profile", "Chat"],
                icons: const [
                  Icons.home,
                  Icons.event,
                  Icons.person,
                  Icons.chat
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
                  TeacherCubit.get(context).changeIndex(value);
                },
              ),
              body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  // swipe navigation handling is not supported
                  controller: _tabController,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    for (int i = 0; i < 4; i++)
                      TeacherCubit.get(context).teacherScreen[
                     TeacherCubit.get(context).currentIndex!],
                  ]),
            ),
          );
        },
      ),
    );
  }
}
