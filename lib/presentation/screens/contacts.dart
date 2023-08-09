
import 'package:flutter/material.dart';

import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import 'chat_screen.dart';


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
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text('My Contacts ',
                    style: TextStyle(
                        color:AppColors.darkBlue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder:(context,index)=>buildContactItem(context,index)
                      , separatorBuilder:(context ,index)=>SizedBox(height: 32.0),
                      itemCount:15),
              ],
            ),
          ),
        ),
      ),
    );

  }

  buildContactItem(context,index)
  {
    return GestureDetector(
      onTap: ()
      {
        navigateTo(context, ChatScreen());
      },
      child: Container(
        width: 340,
        height: 120,
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
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                'https://media1.popsugar-assets.com/files/thumbor/hnVKqXE-xPM5bi3w8RQLqFCDw_E/475x60:1974x1559/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2019/09/09/023/n/1922398/9f849ffa5d76e13d154137.01128738_/i/Taylor-Swift.jpg',
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Taylor Swift',
                    style:TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlue
                    ) ,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text('You\'re on your own kid,you always have been',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: Container(
                          width: 7.0,
                          height: 7.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                      Text('02:00 PM ')
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
