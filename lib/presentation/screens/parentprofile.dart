
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../components and constants/constants.dart';
import '../components and constants/profiletext.dart';




List<String> children=[
  'Taylor Swift',
  'Austin Swift',
];

var scaffoldKey=GlobalKey<ScaffoldState>();
File? imageFile;
final ImagePicker _picker = ImagePicker();
bool isBottomSheetShown=false;

class ParentProfile extends StatefulWidget {
  const ParentProfile({Key? key}) : super(key: key);

  @override
  State<ParentProfile> createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/Wallpaper.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          ProfileText(
                            text1: 'Name',
                            text2: 'Andrea Swift',
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text('Children\'s accounts ',
                            style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkBlue
                            ),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          ListView.separated(
                            scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context,index)
                              {
                                return buildChildItem(children[index], index,context);
                              },
                              separatorBuilder:(context,index)
                              {
                                return SizedBox(height: 15);
                              } ,
                              itemCount: 2),
                          SizedBox(height: 10,),
                          Center(
                            child: SvgPicture.asset(
                              'images/Back to school-rafiki ORANGE.svg',
                              width: 350.0,
                              height: 350.0,
                            ),
                          ),
                          SizedBox(height: 15,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

Widget buildChildItem( childAccount, index,context){
    return Container(
      width: 340,
      height: 85,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border:  Border.all(color: AppColors.borderColor),
        boxShadow: [BoxShadow(blurRadius: 10,
            color: AppColors.shadow,
            spreadRadius: 15)],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),

      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          childAccount,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,

          ),
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
