import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/data/models/chat_contacts_model.dart';

import '../components and constants/constants.dart';


class ReplyCard extends StatelessWidget {
  final String message;
  final String time;
  final Contacts model;
  const ReplyCard({super.key, required this.message, required this.model, required this.time});

  @override
  Widget build(BuildContext context) {
    final radius=Radius.circular(12);
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 10.0),
              child:  CachedNetworkImage(
                imageUrl: model.photo.toString(),
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
            ),
            SizedBox(width: 5,),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width-100,
              ),
              child: Container(
                margin: EdgeInsetsDirectional.symmetric(horizontal: 15,vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadius.all(radius).subtract(BorderRadius.only(bottomLeft: radius)),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 30,end: 10,top: 5,bottom: 20),
                      child: Text(
                        message,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: Colors.white
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 10,
                      child: Text(time,
                        style: TextStyle(fontSize: 13,color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}