import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocAttendance/states.dart';

class StudentAttendanceCubit extends Cubit<StudentAttendanceStates> {
  StudentAttendanceCubit() : super(StudentAttendanceInitState());

  static StudentAttendanceCubit get(context) => BlocProvider.of(context);

  final List<DateTime> dates = [
    DateTime(2020, 12, 1),
    DateTime(2020, 12, 2),
    DateTime(2020, 12, 3),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 5),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    DateTime(2020, 12, 4),
    //DateTime(2020, 12, 5),

  ];
}
