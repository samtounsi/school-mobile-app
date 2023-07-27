import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/stateTeacher.dart';
import 'package:mobile_schoolapp/data/models/teacher_profile_model.dart';
import 'package:mobile_schoolapp/presentation/classes/gradeAndSectionClass.dart';
import 'package:mobile_schoolapp/presentation/screens/event.dart';
import 'package:mobile_schoolapp/presentation/screens/setting.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherhome.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherprofile.dart';
import '../../../data/models/add_profile_bio_model.dart';
import '../../../data/models/add_profile_picture_model.dart';
import '../../../presentation/components and constants/constants.dart';
import '../../../presentation/screens/contacts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(InitialTeacherState());

  static TeacherCubit get(context) => BlocProvider.of(context);
  int? currentIndex = 0;
  List<Widget> teacherScreen = [
    TeacherHome(),

    TeacherEvent(),
    TeacherProfile(),
    ChatContacts(),
   Setting(),
  ];
  GradeTeacher? currentItem;
  void gradeChangeItem(GradeTeacher value)
  {
    currentItem=value;
    emit(ChangeDropDownItem());
    print(currentItem);


  }


  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexMotionTabBarState());
  }

  String? dropDown2;

  void changeSection(String value) {
    dropDown2 = value;
    emit(ChangeSectionTeacherState());
  }

  TeacherProfileModel? teacherProfileModel;
  Future getTeacherProfile({required int id})async
  {
    emit(SchoolTeacherProfileLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('GET', Uri.parse('https://new-school-management-system.onrender.com/mob/teacher_profile/$profileId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      teacherProfileModel=TeacherProfileModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(response.statusCode);
      print(id);
      print(teacherProfileModel?.toJson().toString());
      emit(SchoolTeacherProfileSuccessState(teacherProfileModel!));
  }
  else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(response.statusCode);
      print(error);
      emit(SchoolTeacherProfileErrorState(error:error));
  }}


  AddProfilePictureResponse? addProfilePictureResponse;
  postProfilePicture({required id,required File profilePhoto})async
  {
      emit(SchoolTeacherAddProfilePictureLoadingState());
      var headers = {
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
        'Content-type': 'multipart/form-data'
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/mob/edit_profile_photo'));
      request.fields['id']=id.toString();
      request.files.add(
      await http.MultipartFile.fromPath(
      'photo',
      profilePhoto.path,
      filename: profilePhoto.path.split('/').last,
      contentType: MediaType('image', 'jpeg')
      )
      );

     request.headers.addAll(headers);
     var response = await request.send();

      if (response.statusCode == 200||response.statusCode == 201) {
        print(response.statusCode);
        print(profilePhoto.path);
        addProfilePictureResponse=AddProfilePictureResponse.fromJson(jsonDecode(await response.stream.bytesToString()));
        emit(SchoolTeacherAddProfilePictureSuccessState(addProfilePictureResponse!));
      }
      else {
          print(id);
          print(profilePhoto.path);
          print(response.statusCode);
          String error=jsonDecode(await response.stream.bytesToString())['message'];
          print(error);
        emit(SchoolTeacherAddProfilePictureErrorState(error));
    }
    }

  AddProfileBioResponse? addProfileBioResponse;
  postBio({required int id , required String bio})async
  {
    emit(SchoolTeacherAddBioLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/mob/edit_profile_bio'));
    request.fields.addAll({
      'id': id.toString(),
      'bio': bio
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 201) {
      print(response.statusCode);
      print(bio);
      addProfileBioResponse=AddProfileBioResponse.fromJson(jsonDecode(await response.stream.bytesToString()));
      emit(SchoolTeacherAddBioSuccessState(addProfileBioResponse!));
  }
  else {
  print(response.statusCode);
  String error=jsonDecode(await response.stream.bytesToString())['message'];
  print(error);
  emit(SchoolTeacherAddBioErrorState(error));
  }

  }


}