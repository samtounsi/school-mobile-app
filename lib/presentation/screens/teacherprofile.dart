
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/profiletext.dart';




var bioController=TextEditingController();
var formKey=GlobalKey<FormState>();

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Wallpaper.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Form(
                key: formKey,
                child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40,right: 20, bottom: 20,left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                Container(
                      decoration: BoxDecoration(
                      color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(blurRadius: 10,
                            color: AppColors.shadow,
                            spreadRadius: 20)]),
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundColor: Colors.white,
                                    child: Image.asset('images/Icon.png',
                                    fit: BoxFit.cover,
                                    scale: 0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                           SizedBox(
                            height: 10,
                          ),
                          ProfileText(
                            text1: 'Name',
                            text2: 'fatima',
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          ProfileText(
                            text1: 'Subject',
                            text2: 'Math',
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          ProfileText(
                            text1: 'PhoneNumber',
                            text2: '0965373005',
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Bio',
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.darkBlue
                                ),
                              ),
                              SizedBox(
                                height: 17,
                              ),
                              Row(
                                children: [
                                  defaultformfeild(
                                    maxChars: [
                                      new LengthLimitingTextInputFormatter(40),
                                    ],
                                      controller: bioController,
                                      type: TextInputType.text,
                                      label:'' ,
                                      height: 140,
                                      width: 272,
                                      validate:(value) {
                                        if (value.toString().isEmpty) {
                                          return 'enter your Bio';
                                        }
                                      },
                                      textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      color: Colors.white,

                                  ),
                                  IconButton(
                                      onPressed: (){
                                        if(formKey.currentState!.validate()){

                                        }
                                      },
                                      icon: Icon(
                                          Icons.add_circle_outline,
                                        color: AppColors.lightOrange,
                                        size: 30,
                                      )
                                  )

                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Center(
                            child: defaultTextButton(
                                text: 'schedule',
                                function: (){},
                                radius: 50.0),
                          ),
                          SizedBox(height: 20,)
                        ],
                      ),
                    )),
              ),


        ),
      );
  }
}
