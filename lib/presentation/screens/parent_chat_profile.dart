
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mobile_schoolapp/data/models/parent_profile_model.dart';
import 'package:mobile_schoolapp/presentation/screens/studentprofile.dart';

import '../../business logic/cubits/blocChat/cubit.dart';
import '../../business logic/cubits/blocChat/states.dart';
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
class ParentChatProfile extends StatefulWidget {
  const ParentChatProfile({Key? key}) : super(key: key);

  @override
  State<ParentChatProfile> createState() => _ParentChatProfileState();
}

class _ParentChatProfileState extends State<ParentChatProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit,ChatStates>(
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

      },
      builder: (context,state)
      {

        return ConditionalBuilder(

          condition: state is ! GetParentProfileLoadingState&&ChatCubit.get(context).parentProfileModel!=null,
          builder:(context)
          {
            var model=ChatCubit.get(context).parentProfileModel;
            firstname.text=model!.name!;
            lastname.text=model.childrens![0].lastName!;
            phoneNumber.text=model.phoneNumber!;
            children=model.childrens;
            imageUrl=model.photo;

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
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(bottom: 120,end:10),
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
    return Container(
      width: 340,
      height: 85,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border:  Border.all(color: AppColors.borderColor),
        boxShadow: [BoxShadow(blurRadius: 10,
            color: AppColors.shadow,
            spreadRadius: 15)],
        color:  Colors.white,
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
    );
  }


}
