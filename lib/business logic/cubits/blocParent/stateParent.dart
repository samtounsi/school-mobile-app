import 'package:mobile_schoolapp/data/models/add_profile_picture_model.dart';
import 'package:mobile_schoolapp/data/models/parent_profile_model.dart';

import '../../../data/models/add_profile_bio_model.dart';

class ParentState{}
class InitialParentState extends ParentState{}
class ChangeIndexMotionTabBarState extends ParentState{}

class GetParentProfileLoadingState extends ParentState{}
class GetParentProfileSuccessState extends ParentState
{
  final ParentProfileModel parentProfileModel;

  GetParentProfileSuccessState(this.parentProfileModel);
}
class GetParentProfileErrorState extends ParentState
{
  final String error;

  GetParentProfileErrorState(this.error);
}

class AddParentPictureLoadingState extends ParentState{}
class AddParentPictureSuccessState extends ParentState
{
  final AddProfilePictureResponse addProfilePictureResponse;

  AddParentPictureSuccessState(this.addProfilePictureResponse);

}
class AddParentPictureErrorState extends ParentState
{
  final String error;

  AddParentPictureErrorState(this.error);
}

class AddParentBioLoadingState extends ParentState{}
class AddParentBioSuccessState extends ParentState
{
  final AddProfileBioResponse addProfileBioResponse;

  AddParentBioSuccessState(this.addProfileBioResponse);
}
class AddParentBioErrorState extends ParentState
{
  final String error;

  AddParentBioErrorState(this.error);
}