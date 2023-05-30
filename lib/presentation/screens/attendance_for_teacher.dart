
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/attendanceCubit/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/attendanceCubit/states.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/attendance.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:table_calendar/table_calendar.dart';





List<String> absents=['Fatima Alkhlif','Sama Tunsi','Nour Ghanem','Yumna Hashem','Abeer Barakat'];

class SectionAttendance extends StatelessWidget {
  const SectionAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>SectionAttendanceCubit(),
      child: BlocConsumer<SectionAttendanceCubit,SectionAttendanceStates>(
        listener: (context,state){},
        builder: (context,state)
        {
       DateTime today= SectionAttendanceCubit.get(context).today;
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Wallpaper.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 10,end:10,bottom: 10),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(

                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: CircleAvatar
                  (
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.arrow_back,
                      color: AppColors.darkBlue,),),
                ),
                title: Text('Attendance Monitoring',
                  style: TextStyle(
                      color:Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Text(
                    'Selected Day: '+today.toString().split(" ")[0],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightOrange,
                      fontSize: 22
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                      child: TableCalendar(
                        locale: "en_US",
                        rowHeight: 50,
                        headerStyle: HeaderStyle(
                          rightChevronIcon: Icon(
                            Icons.chevron_right,
                            color: AppColors.darkBlue,),
                            leftChevronIcon: Icon(
                              Icons.chevron_left,
                              color: AppColors.darkBlue,),
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                            color: AppColors.darkBlue,
                            height: 1,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        availableGestures: AvailableGestures.all,
                        focusedDay: SectionAttendanceCubit.get(context).today,
                        firstDay: DateTime.utc(2022,1,1),
                        lastDay: DateTime.utc(2050,1,1),
                        onDaySelected: SectionAttendanceCubit.get(context).onDaySelected,
                        selectedDayPredicate: (day)=>isSameDay(day,SectionAttendanceCubit.get(context).today),
                        weekendDays: [DateTime.saturday, DateTime.friday],
                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekendStyle:TextStyle(
                            height: 1,
                              color: AppColors.lightOrange.withAlpha(99),
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                          weekdayStyle : TextStyle(
                               height: 1,
                              color:AppColors.lightOrange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        calendarStyle: CalendarStyle(
                          selectedDecoration : BoxDecoration(
                            color: AppColors.lightOrange,
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: BoxDecoration(
                            color: AppColors.lightOrange.withAlpha(99),
                            shape: BoxShape.circle,
                          ),
                          todayTextStyle:TextStyle(
                              color: AppColors.darkBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                          weekendTextStyle:TextStyle(
                              color: AppColors.darkBlue.withAlpha(99),
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                          selectedTextStyle:TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                          outsideTextStyle:TextStyle(
                              color: AppColors.darkBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                          defaultTextStyle:TextStyle(
                              color: AppColors.darkBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(top: 20,bottom: 10,start:10 ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildAttendance('Present: ', '25'),
                            buildAttendance('Absent:  ', '5'),
                            Padding(
                              padding: EdgeInsetsDirectional.only(top: 10,bottom: 10,start: 10),
                              child: Text('Absent Students: ',
                                style: TextStyle(
                                    fontSize: 28,
                                    //fontWeight: FontWeight.bold,
                                    color: AppColors.lightOrange
                                ),
                              ),
                            ),
                            ListView.separated(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                               physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index)
                                {
                                  return Padding(
                                      padding: EdgeInsetsDirectional.only(start: 20),
                                      child: buildAbsentsItem(absents[index], index, context));
                                },
                                separatorBuilder:(context,index)
                                {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.only(start : 20,end: 180),
                                    child: myDivider(
                                      dividerColor: AppColors.darkBlue,
                                    ),
                                  );
                                } ,
                                itemCount: absents.length),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );

        },
      ),
    );
  }

  Widget buildAbsentsItem(name,index,context)
  {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 3),
      child: Text(name,
      style: TextStyle(
        fontSize: 20,
        color: AppColors.darkBlue
      ),
      ),
    );
  }

}
