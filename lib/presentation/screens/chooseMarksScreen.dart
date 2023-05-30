
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/containerItem.dart';

class ChooseMarks extends StatelessWidget {
  const ChooseMarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Wallpaper 2.png'),
            fit: BoxFit.fill,
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
              children: [
               Padding(
          padding: const EdgeInsets.only(
            left: 70,
            right: 40,
            top: 80,

          ),

                 child: Column(
                   children: [
                     SvgPicture.asset('images/Learning-pana BLUE.svg'),
                   ],
                 ),
               ),
                SizedBox(height: 45,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    children: [
                      ContainerItem(title: 'Monthly Test Marks',fontSize: 25,),
                      SizedBox(height: 40,),
                      ContainerItem(title: 'Final Marks',fontSize: 25,),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),

    );
  }
}
