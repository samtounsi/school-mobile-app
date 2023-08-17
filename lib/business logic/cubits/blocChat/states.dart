import 'package:mobile_schoolapp/data/models/messages_history_model.dart';

import '../../../data/models/chat_contacts_model.dart';
import '../../../data/models/parent_profile_model.dart';
import '../../../data/models/student_profile_model.dart';
import '../../../data/models/teacher_profile_model.dart';

abstract class ChatStates {}
class ChatInitialState extends ChatStates{}
class ChatShowEmojiPickerState extends ChatStates{}
class ChattoggleFocusNodeState extends ChatStates{}
class ChatEmojiSelectControllerState extends ChatStates{}
class ChatContactsLoadingState extends ChatStates{}
class ChatContactsSuccessState extends ChatStates
{
  final ChatContactsModel chatContactsModel;
  ChatContactsSuccessState(this.chatContactsModel);
}
class ChatContactsErrorState extends ChatStates
{
  final String error;

  ChatContactsErrorState(this.error);
}

class ChatMessagesLoadingState extends ChatStates{}
class ChatMessagesSuccessState extends ChatStates
{
  final MessagesHistoryModel messagesHistoryModel;
  ChatMessagesSuccessState(this.messagesHistoryModel);
}
class ChatMessagesErrorState extends ChatStates
{
  final String error;

  ChatMessagesErrorState(this.error);
}

class SchoolTeacherProfileLoadingState extends ChatStates{}

class SchoolTeacherProfileSuccessState extends ChatStates{
  final TeacherProfileModel teacherProfileModel;
  SchoolTeacherProfileSuccessState(this.teacherProfileModel);
}

class SchoolTeacherProfileErrorState extends ChatStates{
  final String error;
  SchoolTeacherProfileErrorState({required this.error});
}

class GetStudentProfileLoadingState extends ChatStates{}
class GetStudentProfileSuccessState extends ChatStates
{
  final StudentProfileModel studentProfileModel;

  GetStudentProfileSuccessState(this.studentProfileModel);
}
class GetStudentProfileErrorState extends ChatStates
{
  final String error;

  GetStudentProfileErrorState(this.error);

}

class GetParentProfileLoadingState extends ChatStates {}
class GetParentProfileSuccessState extends ChatStates
{
  final ParentProfileModel parentProfileModel;

  GetParentProfileSuccessState(this.parentProfileModel);
}
class GetParentProfileErrorState extends ChatStates
{
  final String error;

  GetParentProfileErrorState(this.error);
}
