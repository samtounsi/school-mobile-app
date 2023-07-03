
import 'package:bloc/bloc.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocChat/states.dart';

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

}