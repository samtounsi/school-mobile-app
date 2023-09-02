import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:table_calendar/table_calendar.dart';

Widget calendar(
    {double size = 18,
    bool Function(DateTime)? holidayPredicate,
    DateTime? startRange,
    DateTime? endRange,
    required DateTime focusedDay,
    bool Function(DateTime)? selectedDayPredicate,
    void Function(DateTime, DateTime)? onDaySelected,
    List<dynamic> Function(DateTime)? eventLoader}) {
  return TableCalendar(
    shouldFillViewport: true,
    calendarBuilders: CalendarBuilders(),
    eventLoader: eventLoader,
    focusedDay: focusedDay,
    firstDay: DateTime(1990),
    lastDay: DateTime(2050),
    currentDay: DateTime.now(),
    weekendDays: [DateTime.friday, DateTime.saturday],
    rangeStartDay: startRange,
    rangeEndDay: endRange,
    holidayPredicate: holidayPredicate,
    onDaySelected: onDaySelected,
    selectedDayPredicate: selectedDayPredicate,
    headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontSize: 24,
        ),
        headerMargin: EdgeInsets.all(8.0)),
    daysOfWeekStyle: DaysOfWeekStyle(
      weekdayStyle: TextStyle(
        fontSize: size - 4,
      ),
      weekendStyle: TextStyle(
        fontSize: size - 4,
        color: const Color.fromARGB(255, 129, 157, 172),
      ),
    ),
    calendarStyle: CalendarStyle(
      isTodayHighlighted: true,
      selectedDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 125, 186, 216),
      ),
      selectedTextStyle: TextStyle(
        color: Colors.white,
        fontSize: size,
      ),
      todayDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 41, 101, 184),
      ),
      todayTextStyle: TextStyle(
        color: Colors.white,
        fontSize: size,
      ),
      holidayDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.aqua.withOpacity(0.6),
      ),
      holidayTextStyle: TextStyle(
        color: Colors.white,
        fontSize: size,
      ),
      rangeStartDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lightOrange,
      ),
      rangeStartTextStyle: TextStyle(
        color: Colors.white,
        fontSize: size,
      ),
      rangeEndDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lightOrange,
      ),
      rangeEndTextStyle: TextStyle(
        color: Colors.white,
        fontSize: size,
      ),
      rangeHighlightColor: AppColors.lightOrange.withOpacity(0.6),
      weekendTextStyle: TextStyle(
        fontSize: size,
        color: Colors.blueGrey,
      ),
      withinRangeTextStyle: TextStyle(
        fontSize: size,
      ),
      defaultTextStyle: TextStyle(
        fontSize: size,
      ),
      markerDecoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.darkBlue,
      ),
    ),
  );
}
