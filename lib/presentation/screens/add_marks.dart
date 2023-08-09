
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocMark/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocMark/states.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

import '../../data/models/add_marks_model.dart';
import '../components and constants/marks.dart';





var formKey=GlobalKey<FormState>();
var model;
var ctl=TextEditingController();

class AddMarks extends StatelessWidget {
  String gradeSection;
  String semester;
  String type;
  String subject;
   AddMarks({required this.gradeSection,required this.semester,
     required this.type,required this.subject});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarksCubit,MarksStates>(
      listener: (context,state)
      {
        if(state is GetStudentsSuccessState)
        {
         model=state.getStudentsModel;
        }
      },
      builder: (context,state)
      {
        model=MarksCubit.get(context).getStudentsModel;
        List<TextEditingController> controller = List.generate(MarksCubit.get(context)
        .getStudentsModel!.students!.length, (i) => TextEditingController());
         return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Wallpaper 2.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading:  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back,
                        weight: 2,
                        size: 35,
                        color: AppColors.lightOrange,),),
                    title: Text('Add Marks',
                      style: TextStyle(
                          color:AppColors.lightOrange,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    actions: [
                       Padding(
                         padding: const EdgeInsets.only(top:10.0),
                         child: IconButton(
                             onPressed: ()
                             {
                               MarksCubit.get(context).addStudentsMarks(
                                   students: model.students,
                                   marks: controller).then(
                                 (value)
                                   {
                                     AddMarksModel data= AddMarksModel(
                                       grade: 'seventh',
                                       section: 1,
                                       semester: semester,
                                       subject: subject,
                                       type:type,
                                       marks: MarksCubit.get(context).m
                                     );
                                     print(data.toJson(model: data).toString());
                                     MarksCubit.get(context).postStudentsMarks(data: data);
                                   });
                             },
                             icon: Icon(
                               Mdi.checkBoxOutline,
                               color: AppColors.lightOrange,
                               size: 35,
                             )),
                       )
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsetsDirectional.only(start:15.0,end:15,top:15),
                    child: ConditionalBuilder(
                      condition: state is ! GetStudentsLoadingState&&model!=null ,
                      builder:(context){
                        model=MarksCubit.get(context).getStudentsModel;
                  return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Padding(
                        padding: EdgeInsetsDirectional.only(start: 5,bottom: 15),
                        child: Row(
                        children: [
                        buildMarksHeaderItem(
                        name: 'Student\'s name',
                        color: AppColors.lightOrange
                        ),
                        SizedBox(width: 25,),
                        buildMarksHeaderItem(
                        width: 120,
                        name: 'Mark',
                        color: AppColors.lightOrange
                        ),
                        ],
                        ),
                        ),
                        Form(
                        key: formKey,
                        child: Expanded(
                        child: ListView.separated(
                  scrollDirection:Axis.vertical ,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)
                  {
                  return Padding(
                  padding: EdgeInsetsDirectional.only(start: 10,end:10,top: 20),
                  child: Container(
                  width:350,
                  height:60,
                  child: Row(
                  children: [
                  buildMarksHeaderItem(
                  name: model.students[index],
                  color: Colors.white
                  ),
                  SizedBox(width: 20,),
                  formFeild(
                  controller: controller[index],
                  type: TextInputType.number,
                  height: 60,
                  verticalPadding: 15,
                  label:'' ,
                  labelTextColor: AppColors.lightOrange,
                  Width: 120,

                  validate:(value) {
                  if (value.toString().isEmpty) {
                  return 'enter student\'s mark';
                  }
                  return null;
                  },
                  textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue
                  ),
                  color: Colors.white,

                  ),
                  ],
                  ),
                  ),
                  );

                  },
                  separatorBuilder: (context,index)
                  {
                  return SizedBox(height: 10,);
                  },
                  itemCount: model.students.length),
                  ),
                  )
                  ],
                  );
                  },
                      fallback: (context)=>Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              ),
            );

      },
    );
  }
}
