import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherTimeTable1.dart';
import '../../business logic/cubits/blocChat/cubit.dart';
import '../../business logic/cubits/blocChat/states.dart';
import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import '../components and constants/profiletext.dart';



var bioController=TextEditingController();
var formKey=GlobalKey<FormState>();
List<String>?subjects;
var scaffoldKey=GlobalKey<ScaffoldState>();
File? imageFile;
final ImagePicker _picker = ImagePicker();
var firstname=TextEditingController();
var lastname=TextEditingController();
var phoneNumber=TextEditingController();
bool isBottomSheetShown=false;
dynamic imageUrl;
class TeacherChatProfile extends StatefulWidget {
  const TeacherChatProfile({Key? key}) : super(key: key);

  @override
  State<TeacherChatProfile> createState() => _TeacherChatProfileState();
}

class _TeacherChatProfileState extends State<TeacherChatProfile> {
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<ChatCubit,ChatStates>(
        listener: (context,state)
        {
          if(state is SchoolTeacherProfileSuccessState)
          {
            firstname.text=state.teacherProfileModel.firstName!;
            lastname.text=state.teacherProfileModel.lastName!;
            phoneNumber.text=state.teacherProfileModel.phoneNumber!;
            subjects=state.teacherProfileModel.subjects!;
            imageUrl=state.teacherProfileModel.photo;
            bioController.text=state.teacherProfileModel.bio!;
          }

        },
        builder: (context,state)
        {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Wallpaper.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              key:scaffoldKey,
              backgroundColor: Colors.transparent,
              body: Form(
                key: formKey,
                child: SafeArea(
                    child: ConditionalBuilder(
                      condition: state is ! SchoolTeacherProfileLoadingState&&ChatCubit.get(context).teacherProfileModel!=null,
                      builder: (context)
                      {
                        var model =ChatCubit.get(context).teacherProfileModel;
                        firstname.text=model!.firstName!;
                        lastname.text=model.lastName!;
                        phoneNumber.text=model.phoneNumber!;
                        subjects=model.subjects!;
                        bioController.text=model.bio!;
                        imageUrl=model.photo;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(bottom: 50),
                                  child: IconButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.arrow_back,
                                      size: 40,
                                      color: AppColors.darkBlue,),),
                                ),
                                SizedBox(width: 70,),
                                Center(
                                  child: Container(
                          height:150 ,
                          width: 150,
                          decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [BoxShadow(blurRadius: 10,
                                        color: AppColors.shadow,
                                        spreadRadius: 20)]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: CachedNetworkImage(
                                          imageUrl: imageUrl,
                                          imageBuilder: (context, imageProvider) => Container(
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(60),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ), placeholder: (context, url) => const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => const Icon(Icons.error),
                                        )
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ProfileText(
                                      text1: 'Name',
                                      text2: firstname.text +' '+ lastname.text,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    ProfileText(
                                      text1: 'Subject',
                                      text2: subjects.toString().replaceAll('[', ' ').replaceAll(']', ' '),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    ProfileText(
                                      text1: 'PhoneNumber',
                                      text2: phoneNumber.text,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(start: 10),
                                          child: Text('Bio',
                                            style: TextStyle(
                                                fontSize: 27,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.lightOrange
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 17,
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(start: 15),
                                          child: defaultformfeild(
                                            maxChars: [
                                              new LengthLimitingTextInputFormatter(40),
                                            ],
                                            controller: bioController,
                                            type: TextInputType.text,
                                            label:'' ,
                                            height: 140,
                                            width: 272,
                                            readOnly: true,
                                            validate:(value) {
                                              if (value.toString().isEmpty) {
                                                return 'enter your Bio';
                                              }
                                            },
                                            textStyle: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.darkBlue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            color: Colors.white,

                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Center(
                                      child: defaultTextButton(
                                          text: 'schedule',
                                          function: (){
                                            navigateTo(context, TeacherTimeTable());
                                          },
                                          radius: 50.0),
                                    ),
                                    SizedBox(height: 20,),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      fallback: (context)=>Center(child: CircularProgressIndicator()),
                    )),
              ),
            ),
          );

        },
      );
  }





  }

