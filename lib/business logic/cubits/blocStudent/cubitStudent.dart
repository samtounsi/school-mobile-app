import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocStudent/stateStudent.dart';
import 'package:mobile_schoolapp/data/models/get_absent_students_model.dart';
import 'package:mobile_schoolapp/data/models/student_profile_model.dart';
import 'package:mobile_schoolapp/presentation/screens/event.dart';
import 'package:mobile_schoolapp/presentation/screens/eventS&P.dart';
import 'package:mobile_schoolapp/presentation/screens/setting.dart';
import 'package:mobile_schoolapp/presentation/screens/studenthome.dart';
import 'package:mobile_schoolapp/presentation/screens/studentprofile.dart';
import '../../../data/models/add_profile_bio_model.dart';
import '../../../data/models/add_profile_picture_model.dart';
import '../../../presentation/components and constants/constants.dart';
import '../../../presentation/screens/contacts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
class StudentCubit extends Cubit<StudentState>{
  StudentCubit():super(InitialStudentState());
  static StudentCubit get(context)=>BlocProvider.of(context);
  int? currentIndex=0;
  List<Widget>studentScreen=[
    StudentHome(),
    EventScreen(),
    StudentProfile(),
    ChatContacts(),
    Setting()

  ];
  void changeIndex(int index){
    currentIndex=index;
    emit(ChangeIndexMotionTabBarState());
  }

  StudentProfileModel? studentProfileModel;
  getStudentProfile({required int id})async
  {
    emit(GetStudentProfileLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse('https://new-school-management-system.onrender.com/mob/student_profile/$profileId'));

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 201) {
      studentProfileModel=StudentProfileModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(response.statusCode);
      print(studentProfileModel?.toJson().toString());
      emit(GetStudentProfileSuccessState(studentProfileModel!));
    }
  else {
      String error = jsonDecode(
          await response.stream.bytesToString())['message'];
      print(response.statusCode);
      print(error);
      emit(GetStudentProfileErrorState(error));
    }
  }

  AddProfilePictureResponse? addProfilePictureResponse;
  postProfilePicture({required id,required File profilePhoto})async
  {
    emit(AddStudentPictureLoadingState());
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
      emit(AddStudentPictureSuccessState(addProfilePictureResponse!));
    }
    else {
      print(id);
      print(profilePhoto.path);
      print(response.statusCode);
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(error);
      emit(AddStudentPictureErrorState(error));
    }

  }

  AddProfileBioResponse? addProfileBioResponse;
  postBio({required int id , required String bio})async
  {
    emit(AddStudentBioLoadingState());
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
      print(addProfileBioResponse?.toJson().toString());
      emit(AddStudentBioSuccessState(addProfileBioResponse: addProfileBioResponse));
    }
    else {
      print(response.statusCode);
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(error);
      emit(AddStudentBioErrorState(error));
    }

  }


}