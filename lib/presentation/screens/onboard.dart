import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/network/cache_helper.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/componentslogin.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

import 'package:mobile_schoolapp/presentation/screens/login.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/OnBoard – 1.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 60, 0, 0),
                child: Text(
                  'Welcome\nTo our School!',
                  style: TextStyle(fontSize: 33, color: AppColors.darkBlue),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Spacer(),
                  SvgPicture.asset('images/Back to school-amico ORANGE.svg'),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Spacer(),
                  defaultButton(
                      text: 'Continue',
                      onPressed: () {
                        CacheHelper.saveData(key: 'onBoard', value: true).then((value){
                          if(value){
                            navigateAndFinish(context, Login());
                          }
                        });
                      }),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
