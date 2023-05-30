
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/attendanceCubit/states.dart';



class SectionAttendanceCubit extends Cubit<SectionAttendanceStates>
{
  SectionAttendanceCubit():super(SectionAttendanceInitialState());

  static SectionAttendanceCubit get(context)=>BlocProvider.of(context);

  DateTime today=DateTime.now();

   void onDaySelected(DateTime day,DateTime focusedDay)
  {
      today=day;
      print(today);
      emit(SectionAttendanceOnSelectedDayState());

  }

}