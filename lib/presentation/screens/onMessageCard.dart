
import 'package:flutter/material.dart';

import '../components and constants/constants.dart';


class OnMessageCard extends StatelessWidget {
  const OnMessageCard({Key? key}) : super(key: key);

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
                          'Hey, When are you going to release speak now Taylor\'s version??',
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
                            Text('20:58',
                              style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Icon(Icons.done,size: 20,),
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
              child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://image.gala.de/21817264/t/Uh/v9/w960/r0.6667/-/teaser-harry-styles.jpg',
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
