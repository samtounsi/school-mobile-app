import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocParent/cubitParent.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/cubitTeacher.dart';
import 'package:mobile_schoolapp/data/models/chat_contacts_model.dart';
import 'package:mobile_schoolapp/presentation/screens/parent_chat_profile.dart';
import 'package:mobile_schoolapp/presentation/screens/replyCard.dart';
import 'package:mobile_schoolapp/presentation/screens/student_chat_profile.dart';
import 'package:mobile_schoolapp/presentation/screens/teacher_chat_profile.dart';
import '../../business logic/cubits/blocChat/cubit.dart';
import '../../business logic/cubits/blocChat/states.dart';
import '../../business logic/cubits/blocStudent/cubitStudent.dart';
import '../../data/models/message_model.dart';
import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import 'onMessageCard.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

var model;

class ChatScreen extends StatefulWidget {
  Contacts chatModel;
  ChatScreen({super.key, required this.chatModel});

  @override
  State<ChatScreen> createState() =>
      _ChatScreenState(chatModel: this.chatModel);
}

class _ChatScreenState extends State<ChatScreen> {
  Contacts chatModel;
  _ChatScreenState({required this.chatModel});
  late IO.Socket socket;
  bool sendButton = false;
  List<MessageModel?> messages = [];
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    connect();
    ChatCubit.get(context).toggleFocusNode();
  }

  void connect() {
    socket = IO.io(
        'https://new-school-management-system.onrender.com', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket.connect();
    socket.emit('login', id);
    socket.onConnect((data) {
      print('connected');
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"]);
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
      print(socket.connected);
    });
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
    print(socket.id);
    print(message);
    print(sourceId);
    print(targetId);
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
        type, message, DateTime.now().toString().substring(10, 16));
    setState(() {
      setState(() {
        messages.add(messageModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatStates>(
      listener: (context, state) {
        if (state is ChatMessagesSuccessState) {
          model = state.messagesHistoryModel.messages;
        }
      },
      builder: (context, state) {
        if (state is ChatMessagesSuccessState) {
          model = state.messagesHistoryModel.messages;
        }
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Message.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: EdgeInsetsDirectional.only(start: 5.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
              titleSpacing: 0,
              title: InkWell(
                onTap: () {
                  if (chatModel.type == 'teacher') {
                    print(chatModel.id);
                    ChatCubit.get(context).getTeacherProfile(id: chatModel.id!);
                    navigateTo(context, TeacherChatProfile());
                  }
                  if (chatModel.type == 'student') {
                    print(chatModel.id);
                    ChatCubit.get(context).getStudentProfile(
                        id: chatModel.id!,
                        year: (DateTime.now().month > 6)
                            ? DateTime.now().year + 1
                            : DateTime.now().year);
                    navigateTo(context, StudentChatProfile());
                  }
                  if (chatModel.type == 'parent') {
                    print(chatModel.id);
                    ChatCubit.get(context).getParentProfile(id: chatModel.id!);
                    navigateTo(context, ParentChatProfile());
                  }
                },
                child: Text(
                  chatModel.fullName.toString(),
                  style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WillPopScope(
                onWillPop: () {
                  if (ChatCubit.get(context).showPicker) {
                    ChatCubit.get(context).showPicker = false;
                  } else {
                    Navigator.pop(context);
                  }
                  return Future.value(false);
                },
                child: ConditionalBuilder(
                  condition: state is! ChatMessagesLoadingState &&
                      ChatCubit.get(context).messagesHistoryModel != null,
                  builder: (context) {
                    model =
                        ChatCubit.get(context).messagesHistoryModel?.messages;
                    return Column(
                      children: [
                        Expanded(
                          //height: MediaQuery.of(context).size.height-140,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: [
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: model.length,
                                    itemBuilder: (context, index) {
                                      if (model.length != 0) {
                                        if (model[index].type == 'sent') {
                                          if (type == 'teacher') {
                                            return OnMessageCard(
                                                message: model[index]!.message,
                                                model: TeacherCubit.get(context)
                                                    .teacherProfileModel,
                                                time: model[index]!
                                                    .time
                                                    .toString()
                                                    .substring(11, 16));
                                          }
                                          if (type == 'student') {
                                            return OnMessageCard(
                                                message: model[index]!.message,
                                                model: StudentCubit.get(context)
                                                    .studentProfileModel,
                                                time: model[index]!
                                                    .time
                                                    .toString()
                                                    .substring(11, 16));
                                          }
                                          if (type == 'parent') {
                                            return OnMessageCard(
                                                message: model[index]!.message,
                                                model: ParentCubit.get(context)
                                                    .parentProfileModel,
                                                time: model[index]!
                                                    .time
                                                    .toString()
                                                    .substring(11, 16));
                                          }
                                        }

                                        if (model[index].type == 'received') {
                                          return ReplyCard(
                                              message: model[index]!.message,
                                              model: chatModel,
                                              time: model[index]!
                                                  .time
                                                  .toString()
                                                  .substring(11, 16));
                                        }
                                      }
                                    }),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: messages.length + 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (index == messages.length) {
                                      return Container(
                                        height: 100,
                                      );
                                    }
                                    if (messages[index]?.type == "source") {
                                      if (type == 'teacher') {
                                        return OnMessageCard(
                                            message: messages[index]!.message,
                                            model: TeacherCubit.get(context)
                                                .teacherProfileModel,
                                            time: messages[index]!.time);
                                      }
                                      if (type == 'student') {
                                        return OnMessageCard(
                                            message: messages[index]!.message,
                                            model: StudentCubit.get(context)
                                                .studentProfileModel,
                                            time: messages[index]!.time);
                                      }
                                      if (type == 'parent') {
                                        return OnMessageCard(
                                            message: messages[index]!.message,
                                            model: ParentCubit.get(context)
                                                .parentProfileModel,
                                            time: messages[index]!.time);
                                      }
                                    } else {
                                      return ReplyCard(
                                          message: messages[index]!.message,
                                          model: chatModel,
                                          time: messages[index]!.time);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxHeight: 400),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 10,
                                color: Colors.white,
                              ),
                              formFeild(
                                onChange: (value) {
                                  if (value.length > 0) {
                                    setState(() {
                                      sendButton = true;
                                    });
                                  } else {
                                    setState(() {
                                      sendButton = false;
                                    });
                                  }
                                },
                                maxlines: 5,
                                Width: MediaQuery.of(context).size.width,
                                height: 90,
                                circular: 0,
                                controller:
                                    ChatCubit.get(context).messageController,
                                bordercolor: AppColors.lightOrange,
                                bordersidecolor: AppColors.lightOrange,
                                prefix: Icons.emoji_emotions_outlined,
                                prefixColor: AppColors.lightOrange,
                                focusNode: ChatCubit.get(context).focusNode,
                                prefixPressed: () {
                                  ChatCubit.get(context).focusNode.unfocus();
                                  ChatCubit.get(context)
                                      .focusNode
                                      .canRequestFocus = false;
                                  ChatCubit.get(context).showEmojiPicker();
                                },
                                suffixColor: AppColors.lightOrange,
                                type: TextInputType.text,
                                suffix: Icons.arrow_forward_outlined,
                                suffixpressed: () {
                                  if (sendButton) {
                                    scrollController.animateTo(
                                        scrollController
                                            .position.maxScrollExtent,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeOut);
                                    sendMessage(
                                        ChatCubit.get(context)
                                            .messageController
                                            .text,
                                        id!,
                                        chatModel.userId!);
                                    ChatCubit.get(context)
                                        .messageController
                                        .clear();
                                  }
                                },
                                label: 'send a message ',
                                labelTextColor: AppColors.lightOrange,
                                validate: (value) {
                                  if (value.toString().isEmpty) {
                                    return 'Message Can\'t be empty';
                                  }
                                },
                              ),
                              if (ChatCubit.get(context).showPicker)
                                SizedBox(height: 300, child: emojiSelect()),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  fallback: (conetxt) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        print(emoji);
        ChatCubit.get(context).emojiSelectController(emoji);
      },
      config: Config(
        columns: 7,
        emojiSizeMax: 32,
        //initCategory: Category.RECENT,
      ),
    );
  }
}
