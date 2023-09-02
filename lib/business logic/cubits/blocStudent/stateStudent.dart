import 'package:mobile_schoolapp/data/models/get_absent_students_model.dart';
import 'package:mobile_schoolapp/data/models/student_profile_model.dart';

import '../../../data/models/add_profile_bio_model.dart';
import '../../../data/models/add_profile_picture_model.dart';
import '../../../data/models/get_years_model.dart';

class StudentState {}
class InitialStudentState extends StudentState{}
class ChangeIndexMotionTabBarState extends StudentState{}
class ChangeIndexToProfileState extends StudentState{}
class GetStudentProfileLoadingState extends StudentState{}
class GetStudentProfileSuccessState extends StudentState
{
  final StudentProfileModel studentProfileModel;

  GetStudentProfileSuccessState(this.studentProfileModel);
}
class GetStudentProfileErrorState extends StudentState
{
  final String error;

  GetStudentProfileErrorState(this.error);

}

class   AddStudentPictureLoadingState extends StudentState{}
class AddStudentPictureSuccessState extends StudentState
{
  final AddProfilePictureResponse addProfilePictureResponse;

  AddStudentPictureSuccessState(this.addProfilePictureResponse);
}
class AddStudentPictureErrorState extends StudentState
{
  final String error;

  AddStudentPictureErrorState(this.error);

}
class ChangeYearState extends StudentState{}
class   AddStudentBioLoadingState extends StudentState{}
class AddStudentBioSuccessState extends StudentState
{
  final AddProfileBioResponse? addProfileBioResponse;

  AddStudentBioSuccessState({this.addProfileBioResponse});
}
class AddStudentBioErrorState extends StudentState
{
  final String error;

  AddStudentBioErrorState(this.error);

}

class GetYearsLoadingState extends StudentState {}
class GetYearsSuccessState extends StudentState
{
  final GetYearsModel getYearsModel;

  GetYearsSuccessState(this.getYearsModel);
}
class GetYearsErrorState extends StudentState
{
  final String error;

  GetYearsErrorState(this.error);
}
