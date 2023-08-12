import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocTeacher/cubitTeacher.dart';
import 'package:mobile_schoolapp/presentation/screens/teacherTimeTable1.dart';

import '../../business logic/cubits/blocTeacher/stateTeacher.dart';
import '../../data/models/teacher_profile_model.dart';
import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import '../components and constants/profiletext.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

var bioController = TextEditingController();
var formKey9 = GlobalKey<FormState>();
List<String>? subjects;
var scaffoldKey3 = GlobalKey<ScaffoldState>();
File? imageFile;
final ImagePicker _picker = ImagePicker();
var firstname = TextEditingController();
var lastname = TextEditingController();
var phoneNumber = TextEditingController();
bool isBottomSheetShown = false;
dynamic imageUrl;

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({Key? key}) : super(key: key);

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeacherCubit, TeacherState>(
      listener: (context, state) {
        if (state is SchoolTeacherProfileSuccessState) {
          firstname.text = state.teacherProfileModel.firstName!;
          lastname.text = state.teacherProfileModel.lastName!;
          phoneNumber.text = state.teacherProfileModel.phoneNumber!;
          subjects = state.teacherProfileModel.subjects!;
          imageUrl = state.teacherProfileModel.photo;
          bioController.text = state.teacherProfileModel.bio!;
        }
        if (state is SchoolTeacherAddProfilePictureSuccessState) {
          imageUrl = state.addProfilePictureResponse.photo;
        }
        if (state is SchoolTeacherAddBioSuccessState) {
          bioController.text = state.addBioResponse.bio!;
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey3,
          // backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                child: Image.asset(
                  'images/head.png',
                  fit: BoxFit.fill,
                ),
              ),
              Form(
                key: formKey9,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ConditionalBuilder(
                    condition: state is! SchoolTeacherProfileLoadingState &&
                            TeacherCubit.get(context).teacherProfileModel !=
                                null ||
                        state is SchoolTeacherAddProfilePictureLoadingState ||
                        state is SchoolTeacherAddBioLoadingState,
                    builder: (context) {
                      var model = TeacherCubit.get(context).teacherProfileModel;
                      firstname.text = model!.firstName!;
                      lastname.text = model.lastName!;
                      phoneNumber.text = model.phoneNumber!;
                      subjects = model.subjects!;
                      bioController.text = model.bio!;
                      imageUrl = model.photo;
                      if (state is SchoolTeacherAddProfilePictureSuccessState) {
                        imageUrl = state.addProfilePictureResponse.photo;
                      }
                      if (state is SchoolTeacherAddBioSuccessState) {
                        bioController.text = state.addBioResponse.bio!;
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: uploadAvatar(context, state, model),
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
                                    text2: firstname.text + ' ' + lastname.text,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  ProfileText(
                                    text1: 'Subject',
                                    text2: subjects
                                        .toString()
                                        .replaceAll('[', ' ')
                                        .replaceAll(']', ' '),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 10),
                                        child: Text(
                                          'Bio',
                                          style: TextStyle(
                                              fontSize: 27,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.lightOrange),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 17,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 15),
                                            child: defaultformfeild(
                                              maxChars: [
                                                new LengthLimitingTextInputFormatter(
                                                    40),
                                              ],
                                              controller: bioController,
                                              type: TextInputType.text,
                                              label: '',
                                              height: 140,
                                              width: 272,
                                              validate: (value) {
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.symmetric(
                                                    horizontal: 10),
                                            child: ConditionalBuilder(
                                              condition: state
                                                  is! SchoolTeacherAddBioLoadingState,
                                              builder: (context) {
                                                return IconButton(
                                                    onPressed: () {
                                                      if (formKey9.currentState!
                                                          .validate()) {
                                                        TeacherCubit.get(
                                                                context)
                                                            .postBio(
                                                                id: id!,
                                                                bio:
                                                                    bioController
                                                                        .text);
                                                        TeacherCubit.get(
                                                                context)
                                                            .getTeacherProfile(
                                                                id: profileId!);
                                                      }
                                                    },
                                                    icon: Icon(
                                                      Icons.add_circle_outline,
                                                      color:
                                                          AppColors.lightOrange,
                                                      size: 30,
                                                    ));
                                              },
                                              fallback: (context) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            ),
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
                                        function: () {
                                          navigateTo(
                                              context, TeacherTimeTable());
                                        },
                                        radius: 50.0),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget uploadAvatar(context, state, TeacherProfileModel model) => Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: AppColors.shadow, spreadRadius: 20)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) => ConditionalBuilder(
                  condition:
                      state is! SchoolTeacherAddProfilePictureLoadingState,
                  builder: (context) => Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  fallback: (context) => CircularProgressIndicator(),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (isBottomSheetShown) {
                if (imageFile != null) {
                  print(imageFile);
                  TeacherCubit.get(context)
                      .postProfilePicture(id: id, profilePhoto: imageFile!);
                  Navigator.pop(context);
                  isBottomSheetShown = false;
                }
                Navigator.pop(context);
                // isBottomSheetShown = false;
              } else {
                scaffoldKey3.currentState
                    ?.showBottomSheet((context) => Container(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.lightOrange.withAlpha(99),
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "Choose Profile Photo",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: AppColors.darkBlue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TextButton.icon(
                                      icon: Icon(
                                        Icons.camera,
                                      ),
                                      onPressed: () {
                                        pickPhoto(ImageSource.camera);
                                      },
                                      label: Text(
                                        "Camera",
                                      ),
                                    ),
                                    TextButton.icon(
                                      icon: Icon(
                                        Icons.image,
                                      ),
                                      onPressed: () {
                                        pickPhoto(ImageSource.gallery);
                                      },
                                      label: Text(
                                        "Gallery",
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ))
                    .closed
                    .then((value) {
                  if (imageFile != null) {
                    print(imageFile);
                    TeacherCubit.get(context)
                        .postProfilePicture(id: id, profilePhoto: imageFile!);
                    isBottomSheetShown = false;
                  } else {
                    Navigator.pop(context);
                    return;
                  }
                });
                //isBottomSheetShown=true;
              }
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 0,
                end: 2,
              ),
              child: Container(
                margin: EdgeInsetsDirectional.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.darkBlue),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.edit,
                    color: AppColors.darkBlue,
                    size: 25,
                  ),
                ),
              ),
            ),
          )
        ],
      );

  Future pickPhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
      print(imageFile?.path);
    });
  }
}
