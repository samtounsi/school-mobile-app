
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../business logic/cubits/blocChat/cubit.dart';
import '../../business logic/cubits/blocChat/states.dart';
import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import '../components and constants/profiletext.dart';


var bioController=TextEditingController();
var formKey=GlobalKey<FormState>();

var scaffoldKey=GlobalKey<ScaffoldState>();
File? imageFile;
final ImagePicker _picker = ImagePicker();
bool isBottomSheetShown=false;
var firstname=TextEditingController();
var lastname=TextEditingController();
var grade=TextEditingController();
var parentAccount=TextEditingController();
dynamic imageUrl;
class StudentChatProfile extends StatefulWidget {
  const StudentChatProfile({Key? key}) : super(key: key);

  @override
  State<StudentChatProfile> createState() => _StudentChatProfileState();
}

class _StudentChatProfileState extends State<StudentChatProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit,ChatStates>(
        listener: (context,state)
        {
          if(state is GetStudentProfileSuccessState)
          {

            firstname.text=state.studentProfileModel.firstName!;
            lastname.text=state.studentProfileModel.lastName!;
            grade.text=state.studentProfileModel.gradeName!;
            parentAccount.text=state.studentProfileModel.fatherName!;
            imageUrl=state.studentProfileModel.photo;
            bioController.text=state.studentProfileModel.bio!;
          }

        },
        builder:(context,state)
        {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Wallpaper.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.transparent,
              body: Form(
                key: formKey,
                child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0,left: 20.0),
                      child: ConditionalBuilder(
                        condition:state is ! GetStudentProfileLoadingState&& ChatCubit.get(context).studentProfileModel!=null,

                        builder: (context)
                        {
                          var model=ChatCubit.get(context).studentProfileModel;
                          firstname.text=model!.firstName!;
                          lastname.text=model.lastName!;
                          grade.text=model.gradeName!;
                          parentAccount.text=model.fatherName!;
                          bioController.text=model.bio!;
                          imageUrl=model.photo;

                          return  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(bottom: 60.0,),
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
                                        text1: 'Grade',
                                        text2: grade.text,
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      GestureDetector(
                                        child: ProfileText(
                                          text1: 'Patrent\'s account',
                                          text2: parentAccount.text+' '+ lastname.text,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(start: 15),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Bio',
                                              style: TextStyle(
                                                  fontSize: 27,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.lightOrange
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
                                                  readOnly: true,
                                                  controller: bioController,
                                                  type: TextInputType.text,
                                                  label:'' ,
                                                  height: 140,
                                                  width: 290,
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


                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          );
                        },
                        fallback: (context)=>Center(child: CircularProgressIndicator()),

                      ),
                    )),
              ),
            ),
          );
        }
    );
  }


}
