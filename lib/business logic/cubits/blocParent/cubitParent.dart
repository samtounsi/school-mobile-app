import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocParent/stateParent.dart';
import 'package:mobile_schoolapp/presentation/screens/event.dart';
import 'package:mobile_schoolapp/presentation/screens/eventS&P.dart';
import 'package:mobile_schoolapp/presentation/screens/parenthome.dart';
import 'package:mobile_schoolapp/presentation/screens/parentprofile.dart';
import 'package:mobile_schoolapp/presentation/screens/setting.dart';

import '../../../data/models/add_profile_bio_model.dart';
import '../../../data/models/add_profile_picture_model.dart';
import '../../../data/models/parent_profile_model.dart';
import '../../../presentation/components and constants/constants.dart';
import '../../../presentation/screens/contacts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ParentCubit extends Cubit<ParentState> {
  ParentCubit() : super(InitialParentState());

  static ParentCubit get(context) => BlocProvider.of(context);
  int? currentIndex = 0;
  List<Widget>? screens = [
    ParentHome(),
    EventScreen(),
    ParentProfile(),
    ChatContacts(),
    Setting(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexMotionTabBarState());
  }

  int childId=1;
  int chooseChild(childId)
  {
    this.childId=childId;
    emit(ChangeChildIdState());
    return childId;
  }


  ParentProfileModel? parentProfileModel;
  Future getParentProfile({required int id})async
  {
    emit(GetParentProfileLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('GET', Uri.parse('https://new-school-management-system.onrender.com/mob/parent_profile/$profileId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      parentProfileModel=ParentProfileModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(response.statusCode);
      print(id);
      print(parentProfileModel?.toJson().toString());
      emit(GetParentProfileSuccessState(parentProfileModel!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(response.statusCode);
      print(error);
      emit(GetParentProfileErrorState(error));
    }}


  AddProfilePictureResponse? addProfilePictureResponse;
  Future postProfilePicture({required id,required File profilePhoto})async
  {
    emit(AddParentPictureLoadingState());
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
      emit(AddParentPictureSuccessState(addProfilePictureResponse!));
    }
    else {
      print(id);
      print(profilePhoto.path);
      print(response.statusCode);
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(error);
      emit(AddParentPictureErrorState(error));
    }
  }

  AddProfileBioResponse? addProfileBioResponse;
  postBio({required int id , required String bio})async
  {
    emit(AddParentBioLoadingState());
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
      emit(AddParentBioSuccessState(addProfileBioResponse!));
    }

    else {
      print(response.statusCode);
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(error);
      emit(AddParentBioErrorState(error));
    }

  }

}
