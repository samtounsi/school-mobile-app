
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocParent/cubitParent.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocParent/stateParent.dart';
import 'package:mobile_schoolapp/data/models/parent_profile_model.dart';
import 'package:mobile_schoolapp/presentation/screens/studentprofile.dart';

import '../components and constants/constants.dart';
import '../components and constants/profiletext.dart';

List<Childrens>?children;
var scaffoldKey=GlobalKey<ScaffoldState>();
File? imageFile;
final ImagePicker _picker = ImagePicker();
bool isBottomSheetShown=false;
var firstname=TextEditingController();
var lastname=TextEditingController();
var phoneNumber=TextEditingController();
dynamic imageUrl;
class ParentProfile extends StatefulWidget {
  const ParentProfile({Key? key}) : super(key: key);

  @override
  State<ParentProfile> createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParentCubit,ParentState>(
      listener: (context,state)
    {
      if(state is GetParentProfileSuccessState)
      {
        firstname.text=state.parentProfileModel.name!;
        lastname.text=state.parentProfileModel.childrens![0].lastName!;
       phoneNumber.text=state.parentProfileModel.phoneNumber!;
        children=state.parentProfileModel.childrens;
        imageUrl=state.parentProfileModel.photo;
      }
      if(state is AddParentPictureSuccessState)
      {
        imageUrl=state.addProfilePictureResponse.photo;
      }
      if(state is AddParentBioSuccessState)
      {
        bioController.text=state.addProfileBioResponse.bio!;
      }
    },
      builder: (context,state)
      {

        return ConditionalBuilder(

          condition: state is ! GetParentProfileLoadingState&&ParentCubit.get(context).parentProfileModel!=null||
              state is AddParentPictureLoadingState,
         builder:(context)
         {
           var model=ParentCubit.get(context).parentProfileModel;
           firstname.text=model!.name!;
           lastname.text=model.childrens![0].lastName!;
            phoneNumber.text=model.phoneNumber!;
           children=model.childrens;
           imageUrl=model.photo;
           if(state is AddParentPictureSuccessState)
           {
             imageUrl=state.addProfilePictureResponse.photo;
           }
           if(state is AddParentBioSuccessState)
           {
             bioController.text=state.addProfileBioResponse.bio!;
           }
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
               body: SafeArea(
                   child: Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Center(
                           child: uploadAvatar(context,state,model),
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
                                   text2: firstname.text +' '+ lastname.text,
                                 ),
                                 SizedBox(
                                   height: 25,
                                 ),
                                 ProfileText(
                                   text1: 'Phone Number',
                                   text2: phoneNumber.text,
                                 ),
                                 SizedBox(
                                   height: 25,
                                 ),
                                 Text('Children\'s Accounts ',
                                   style: TextStyle(
                                       fontSize: 27,
                                       fontWeight: FontWeight.w700,
                                       color: AppColors.lightOrange
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
                                       return buildChildItem(children![index], index,context);
                                     },
                                     separatorBuilder:(context,index)
                                     {
                                       return SizedBox(height: 15);
                                     } ,
                                     itemCount: children!.length),
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
         },
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

Widget buildChildItem( Childrens childAccount, index,context){
    return InkWell(
      onTap: ()
      {
        ParentCubit.get(context).chooseChild(childAccount.id);
      },
      child: Container(
        width: 340,
        height: 85,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border:  Border.all(color: AppColors.borderColor),
          boxShadow: [BoxShadow(blurRadius: 10,
              color: AppColors.shadow,
              spreadRadius: 15)],
          color:
          childAccount.id== ParentCubit.get(context).childId?
          AppColors.lightOrange: Colors.white,
          borderRadius: BorderRadius.circular(10),

        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            childAccount.firstName.toString() +' '+ childAccount.lastName.toString(),
            style: const TextStyle(
              fontSize: 22,
              color: AppColors.darkBlue,
              fontWeight: FontWeight.w500,

            ),
          ),
        ),
      ),
    );
}

  Widget uploadAvatar(context,state,model)=>Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: [
      Container(
        height:150 ,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(blurRadius: 10,
                color: AppColors.shadow,
                spreadRadius: 20)]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:  CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => ConditionalBuilder(
              condition: state is! AddParentPictureLoadingState,
              builder: (context)=>Container(
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
              fallback:(context)=> CircularProgressIndicator(),
            ), placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          if(isBottomSheetShown){
            if(imageFile!=null) {
              print(imageFile);
              ParentCubit.get(context).postProfilePicture(
                  id: id, profilePhoto: imageFile!);
              Navigator.pop(context);
              isBottomSheetShown = false;
            }
            Navigator.pop(context);
            // isBottomSheetShown = false;
          }
          else{
            scaffoldKey.currentState?.showBottomSheet(
                    (context)=>Container(
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
                )
            ).closed.then((value)
            {
              if(imageFile!=null){
                print(imageFile);
                ParentCubit.get(context).postProfilePicture(
                    id: id, profilePhoto: imageFile!);
                isBottomSheetShown=false;
              }
              else{
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
