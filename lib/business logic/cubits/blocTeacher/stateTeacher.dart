import '../../../data/models/add_profile_bio_model.dart';
import '../../../data/models/add_profile_picture_model.dart';
import '../../../data/models/get_absent_students_model.dart';
import '../../../data/models/get_list_section_teacher_model.dart';
import '../../../data/models/teacher_profile_model.dart';
import '../../../data/models/time_table_teacher_model.dart';

class TeacherState{}
class InitialTeacherState extends TeacherState{}
class ChangeIndexMotionTabBarState extends TeacherState{}
class ChangeSectionTeacherState extends TeacherState{}
class ChangeDropDownItem extends TeacherState{}
class SchoolTeacherProfileLoadingState extends TeacherState{}

class SchoolTeacherProfileSuccessState extends TeacherState{
  final TeacherProfileModel teacherProfileModel;
  SchoolTeacherProfileSuccessState(this.teacherProfileModel);
}

class SchoolTeacherProfileErrorState extends TeacherState{
  final String error;
  SchoolTeacherProfileErrorState({required this.error});
}

class SchoolTeacherAddProfilePictureLoadingState extends TeacherState{}

class SchoolTeacherAddProfilePictureSuccessState extends TeacherState{
  final AddProfilePictureResponse addProfilePictureResponse;
  SchoolTeacherAddProfilePictureSuccessState(this.addProfilePictureResponse);
}

class SchoolTeacherAddProfilePictureErrorState extends TeacherState{
  final String error;
  SchoolTeacherAddProfilePictureErrorState(this.error);
}

class SchoolTeacherAddBioLoadingState extends TeacherState{}

class SchoolTeacherAddBioSuccessState extends TeacherState{
  final AddProfileBioResponse addBioResponse;
  SchoolTeacherAddBioSuccessState(this.addBioResponse);
}

class SchoolTeacherAddBioErrorState extends TeacherState{
  final String error;
  SchoolTeacherAddBioErrorState(this.error);
}
class TeacherTimeTableSuccessState extends TeacherState {
  List<TimeTableTeacherModel>timeTable;
  TeacherTimeTableSuccessState(this.timeTable);

}
class TeacherTimeTableLoadingState extends TeacherState {

}
class TeacherTimeTableErrorState extends TeacherState {
  final String errorTimeTable;

  TeacherTimeTableErrorState(this.errorTimeTable);
}
class GetListSectionTeacherSuccessState extends TeacherState {
  GetSectionTeacherModel getSectionTeacherModel;

  GetListSectionTeacherSuccessState(this.getSectionTeacherModel);
}

class GetListSectionTeacherLoadingState extends TeacherState {}

class GetListSectionTeacherErrorState extends TeacherState {
  final String error;

  GetListSectionTeacherErrorState(this.error);
}
