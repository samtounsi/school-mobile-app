import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import '../components and constants/profiletext.dart';



var bioController=TextEditingController();
var formKey=GlobalKey<FormState>();
List<String>subjects=['Math','English','Philosophy','Music','Physics',];

var scaffoldKey=GlobalKey<ScaffoldState>();
File? imageFile;
final ImagePicker _picker = ImagePicker();
bool isBottomSheetShown=false;

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({Key? key}) : super(key: key);

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: uploadAvatar(context),
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
                                text2: 'fatima',
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
                                text2: '0965373005',
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
                                          color: AppColors.darkBlue
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Row(
                                    children: [
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
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                                        child: IconButton(
                                            onPressed: (){
                                              if(formKey.currentState!.validate()){

                                              }
                                            },
                                            icon: Icon(
                                                Icons.add_circle_outline,
                                              color: AppColors.lightOrange,
                                              size: 30,
                                            )
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
                                    function: (){},
                                    radius: 50.0),
                      ),
                      SizedBox(height: 20,),
                             ],
                           ),
                         ),
                       )
                    ],
                  ),
                )),
          ),
        ),
      );
  }

  Widget uploadAvatar(context)=>Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(blurRadius: 10,
                color: AppColors.shadow,
                spreadRadius: 20)]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            backgroundImage:imageFile == null? AssetImage('images/Icon.png',)
            : FileImage(File(imageFile!.path)) as ImageProvider,
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          if(isBottomSheetShown){
            Navigator.pop(context);
            isBottomSheetShown=false;
          }
          else{
            scaffoldKey.currentState?.showBottomSheet((context)=>Container(
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
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                    TextButton.icon(
                      icon: Icon(Icons.camera,),
                      onPressed: () {
                        pickPhoto(ImageSource.camera);
                      },
                      label: Text("Camera",),
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.image,),
                      onPressed: () {
                        pickPhoto(ImageSource.gallery);
                      },
                      label: Text("Gallery",),
                    ),
                  ])
                ],
              ),
            ));
            isBottomSheetShown=true;
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
              color: Colors.white
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.edit,
                color:AppColors.darkBlue ,
                size: 25,
              ),
            ),
          ),
        ),
      ),
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
