
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocChat/states.dart';
import 'package:mobile_schoolapp/data/models/messages_history_model.dart';

import '../../../data/models/chat_contacts_model.dart';
import '../../../data/models/parent_profile_model.dart';
import '../../../data/models/student_profile_model.dart';
import '../../../data/models/teacher_profile_model.dart';
import '../../../presentation/components and constants/constants.dart';
import '../../../presentation/components and constants/constants.dart';
import 'package:http/http.dart' as http;

class ChatCubit extends Cubit<ChatStates>
{
  ChatCubit(): super(ChatInitialState());
  static ChatCubit get(context)=>BlocProvider.of(context);

  bool showPicker=false;
  showEmojiPicker()
  {
    showPicker=!showPicker;
    emit(ChatShowEmojiPickerState());
  }
  FocusNode focusNode=FocusNode();

  bool toggleFocusNode()
  {
    focusNode.addListener(()
    {
      if(focusNode.hasFocus)
      {
        showPicker=false;
      }
    });
    emit(ChattoggleFocusNodeState());
    return showPicker;
  }

  var messageController=TextEditingController();
  emojiSelectController(Emoji emoji)
  {
    messageController.text=messageController.text+emoji.emoji;
    emit(ChatEmojiSelectControllerState());
  }




  ChatContactsModel? chatContactsModel;
  Future getChatContacts()async
  {
    if(chatContactsModel!=null)
    {
      chatContactsModel=null;
    }
    emit(ChatContactsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse('https://new-school-management-system.onrender.com/mob/get_contacts'));

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      chatContactsModel=ChatContactsModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(chatContactsModel?.toJson().toString());
      emit(ChatContactsSuccessState(chatContactsModel!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(error);
      emit(ChatContactsErrorState(error));
    }

  }

  MessagesHistoryModel? messagesHistoryModel;
  Future getMessages({required int id})async
  {
    if(messagesHistoryModel!=null)
    {
      messagesHistoryModel=null;
    }
    emit(ChatMessagesLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse('https://new-school-management-system.onrender.com/mob/get_messages/$id'));

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      messagesHistoryModel=MessagesHistoryModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(messagesHistoryModel?.toJson().toString());
      emit(ChatMessagesSuccessState(messagesHistoryModel!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(error);
      emit(ChatMessagesErrorState(error));
    }

  }


  TeacherProfileModel? teacherProfileModel;
  Future getTeacherProfile({required int id})async
  {
    if(teacherProfileModel!=null)
    {
      teacherProfileModel=null;
    }
    emit(SchoolTeacherProfileLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('GET', Uri.parse('https://new-school-management-system.onrender.com/mob/teacher_profile/$id'));

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

  StudentProfileModel? studentProfileModel;
  Future getStudentProfile({required id, required int year}) async {
    emit(GetStudentProfileLoadingState());
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://new-school-management-system.onrender.com/mob/student_profile'));

    request.headers.addAll(headers);
    request.fields.addAll({
      'id':id.toString(),
      'year': year.toString(),
    });
    var response = await request.send();

    if (response.statusCode == 201) {
      studentProfileModel = StudentProfileModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      print(response.statusCode);
      print(studentProfileModel?.toJson().toString());
      emit(GetStudentProfileSuccessState(studentProfileModel!));
    } else {
      String error =
      jsonDecode(await response.stream.bytesToString())['message'];
      print(response.statusCode);
      print(error);
      emit(GetStudentProfileErrorState(error));
    }
  }

  ParentProfileModel? parentProfileModel;
  Future getParentProfile({required int id})async
  {
    emit(GetParentProfileLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('GET', Uri.parse('https://new-school-management-system.onrender.com/mob/parent_profile/$id'));

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
}