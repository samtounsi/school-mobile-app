
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocChat/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocChat/states.dart';

import '../../data/models/chat_contacts_model.dart';
import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import 'chat_screen.dart';

var model;
class ChatContacts extends StatelessWidget {
  const ChatContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.all(15),
            child: BlocConsumer<ChatCubit,ChatStates>(
              listener: (context,state)
              {
                if(state is ChatContactsSuccessState)
                {
                  model=ChatCubit.get(context).chatContactsModel?.contacts;
                }
              },
              builder: (context,state)
              {
                return ConditionalBuilder(
                  condition: state is ! ChatContactsLoadingState
                      &&ChatCubit.get(context).chatContactsModel!=null,
                  builder: (context)
                  {
                    model=ChatCubit.get(context).chatContactsModel?.contacts;
                    return Column(
                      children: [
                        AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          title: Text('My Contacts ',
                            style: TextStyle(
                                color:AppColors.lightOrange,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder:(context,index)=>buildContactItem(context,index,model)
                            , separatorBuilder:(context ,index)=>SizedBox(height: 32.0),
                            itemCount:15),
                      ],
                    );
                  },
                  fallback: (context)=>Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ),
        ),
      ),
    );

  }

  buildContactItem(context,index,List<Contacts>contacts)
  {
    return GestureDetector(
      onTap: ()
      {
        navigateTo(context, ChatScreen(chatModel: contacts[index]));
        ChatCubit.get(context).getMessages(id:contacts[index].userId! );
      },
      child: Container(
        width: 340,
        height: 85,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border:  Border.all(color: AppColors.shadow),
          boxShadow: [BoxShadow(blurRadius: 10,
              color: AppColors.shadow,
              spreadRadius: 5)],
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 10.0,
            ),
            CachedNetworkImage(
              imageUrl: contacts[index].photo.toString(),
              imageBuilder: (context, imageProvider) => Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ), placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text( contacts[index].fullName.toString(),
                        style:TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkBlue
                        ) ,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,),
                      Spacer(),
                      Text( contacts[index].type.toString(),
                        style:TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightOrange
                        ) ,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
