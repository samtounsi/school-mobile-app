import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/presentation/screens/contacts.dart';
import 'package:mobile_schoolapp/presentation/screens/replyCard.dart';

import '../../business logic/cubits/blocChat/cubit.dart';
import '../../business logic/cubits/blocChat/states.dart';
import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import 'onMessageCard.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState()
  {
    super.initState();
    ChatCubit.get(context).toggleFocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit,ChatStates>(
      listener: (context,state)
      {

      },
      builder: (context,state)
      {
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
                 onPressed: (){
                   Navigator.pop(context);
                 },
                 icon: Icon(Icons.arrow_back,
                   size: 30,
                   color: AppColors.darkBlue,),),
             ),
             titleSpacing: 0,
             title: Text('Taylor Swift',
               style: TextStyle(
                   color:AppColors.darkBlue,
                   fontSize: 25,
                   fontWeight: FontWeight.bold
               ),
             ),
           ),
           body:Container(
             height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
             child: WillPopScope(
               onWillPop: ()
               {
                 if(ChatCubit.get(context).showPicker)
                 {
                   ChatCubit.get(context).showPicker=false;
                 }
                 else
                 {
                   Navigator.pop(context);
                 }
                 return Future.value(false);
               },
               child: Stack(
                 children: [
                   Container(
                       height: MediaQuery.of(context).size.height-140,
                       child: ListView(
                         children: [
                           OnMessageCard(),
                           ReplyCard()
                         ],
                       )),
                   Align(
                     alignment: Alignment.bottomCenter,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Row(
                     //crossAxisAlignment: CrossAxisAlignment.end,
                           children: [
                             formFeild(
                               maxlines:5,
                               Width: MediaQuery.of(context).size.width,
                               height: 80,
                               circular: 0,
                               controller: ChatCubit.get(context).messageController,
                               bordercolor: AppColors.lightOrange,
                               bordersidecolor:AppColors.lightOrange,
                               prefix: Icons.emoji_emotions_outlined,
                               prefixColor: AppColors.lightOrange,
                               focusNode: ChatCubit.get(context).focusNode,
                               prefixPressed: ()
                               {
                                 ChatCubit.get(context).focusNode.unfocus();
                                 ChatCubit.get(context).focusNode.canRequestFocus=false;
                             ChatCubit.get(context).showEmojiPicker();
                               },
                               suffixColor: AppColors.lightOrange,
                               type: TextInputType.text,
                               suffix: Icons.arrow_forward_outlined,
                               suffixpressed: (){},
                               label: 'send a message ',
                               labelTextColor: AppColors.lightOrange,
                               validate: (value) {
                                 if (value.toString().isEmpty) {
                                   return 'Message Can\'t be empty';
                                 }
                               },
                             ),
                           ],
                         ),
                       if(ChatCubit.get(context).showPicker)
                         SizedBox(height: 300, child: emojiSelect()),
                       ],
                     ),
                   )
                 ],
               ),
             ),
           ),
         ),
       );
      },
    );
  }


  Widget emojiSelect()
  {
    return EmojiPicker(
    onEmojiSelected: (category, emoji)
    {
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
