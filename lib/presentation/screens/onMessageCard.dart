import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/data/models/chat_contacts_model.dart';
import '../components and constants/constants.dart';


class OnMessageCard extends StatelessWidget {
  final String message;
  final String time;
  final  model;
  const OnMessageCard({super.key, required this.message, required this.model, required this.time});

  @override
  Widget build(BuildContext context) {
    final radius=Radius.circular(12);
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width-100,
                ),
                child: Container(
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 5,vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(radius).subtract(BorderRadius.only(bottomRight: radius)),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 30,end: 10,top: 5,bottom: 20),
                        child: Text(
                          message,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              color: AppColors.darkBlue
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 10,
                        child: Row(
                          children: [
                            Text(time,
                              style: TextStyle(fontSize: 13,color: AppColors.aqua,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 5,),
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 5.0),
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

          ],
        ),
      ),
    );
  }
}
