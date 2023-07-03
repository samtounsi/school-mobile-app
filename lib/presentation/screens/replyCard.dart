import 'package:flutter/material.dart';

import '../components and constants/constants.dart';


class ReplyCard extends StatelessWidget {
  const ReplyCard({Key? key}) : super(key: key);

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
              child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://media1.popsugar-assets.com/files/thumbor/hnVKqXE-xPM5bi3w8RQLqFCDw_E/475x60:1974x1559/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2019/09/09/023/n/1922398/9f849ffa5d76e13d154137.01128738_/i/Taylor-Swift.jpg',
                  )
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
                        'I\'ll do it july seventh.. Start counting down!!',
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
                      child: Text('20:58',
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