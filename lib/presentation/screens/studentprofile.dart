import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../business logic/cubits/blocStudent/cubitStudent.dart';
import '../../business logic/cubits/blocStudent/stateStudent.dart';
import '../../data/models/student_profile_model.dart';
import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import '../components and constants/profiletext.dart';

var bioController = TextEditingController();
var formKey7 = GlobalKey<FormState>();

var scaffoldKey2 = GlobalKey<ScaffoldState>();
File? imageFile;
final ImagePicker _picker = ImagePicker();
bool isBottomSheetShown = false;
var firstname = TextEditingController();
var lastname = TextEditingController();
var grade = TextEditingController();
var parentAccount = TextEditingController();
dynamic imageUrl;

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentState>(listener: (context, state) {
      if (state is GetStudentProfileSuccessState) {
        firstname.text = state.studentProfileModel.firstName!;
        lastname.text = state.studentProfileModel.lastName!;
        grade.text = state.studentProfileModel.gradeName!;
        parentAccount.text = state.studentProfileModel.fatherName!;
        imageUrl = state.studentProfileModel.photo;
        bioController.text = state.studentProfileModel.bio!;
      }
      if (state is AddStudentPictureSuccessState) {
        imageUrl = state.addProfilePictureResponse.photo;
      }
      if (state is AddStudentBioSuccessState) {
        bioController.text = state.addProfileBioResponse!.bio!;
      }
    }, builder: (context, state) {
      return Scaffold(
        key: scaffoldKey2,
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
              key: formKey7,
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ConditionalBuilder(
                  condition: state is! GetStudentProfileLoadingState &&
                          StudentCubit.get(context).studentProfileModel !=
                              null ||
                      state is AddStudentPictureLoadingState ||
                      state is AddStudentBioLoadingState,
                  builder: (context) {
                    var model = StudentCubit.get(context).studentProfileModel;
                    firstname.text = model!.firstName!;
                    lastname.text = model.lastName!;
                    grade.text = model.gradeName!;
                    parentAccount.text = model.fatherName!;
                    bioController.text = model.bio!;
                    imageUrl = model.photo;
                    if (state is AddStudentPictureSuccessState) {
                      imageUrl = state.addProfilePictureResponse.photo;
                    }
                    if (state is AddStudentBioSuccessState) {
                      bioController.text = state.addProfileBioResponse!.bio!;
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: uploadAvatar(context, state, model),
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
                                  text2: firstname.text + ' ' + lastname.text,
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
                                    text1: 'Parent\'s account',
                                    text2: parentAccount.text +
                                        ' ' +
                                        lastname.text,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(start: 15),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Bio',
                                        style: TextStyle(
                                            fontSize: 27,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.lightOrange),
                                      ),
                                      SizedBox(
                                        height: 17,
                                      ),
                                      Row(
                                        children: [
                                          defaultformfeild(
                                            maxChars: [
                                              new LengthLimitingTextInputFormatter(
                                                  40),
                                            ],
                                            controller: bioController,
                                            type: TextInputType.text,
                                            label: '',
                                            height: 140,
                                            width: 290,
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
                                          ConditionalBuilder(
                                            condition: state
                                                is! AddStudentBioLoadingState,
                                            builder: (context) {
                                              return IconButton(
                                                  onPressed: () {
                                                    if (formKey7.currentState!
                                                        .validate()) {
                                                      StudentCubit.get(context)
                                                          .postBio(
                                                              id: id!,
                                                              bio: bioController
                                                                  .text);
                                                      StudentCubit.get(context)
                                                          .getStudentProfile(
                                                              id: profileId!,
                                                              year: 2023);
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
                                          )
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
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              )),
            ),
          ],
        ),
      );
    });
  }

  Widget uploadAvatar(context, state, StudentProfileModel model) => Stack(
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
                  condition: state is! AddStudentPictureLoadingState,
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
                  StudentCubit.get(context)
                      .postProfilePicture(id: id, profilePhoto: imageFile!);
                  Navigator.pop(context);
                  isBottomSheetShown = false;
                }
                Navigator.pop(context);
                // isBottomSheetShown = false;
              } else {
                scaffoldKey2.currentState
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
                    StudentCubit.get(context)
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
    });
  }
}
