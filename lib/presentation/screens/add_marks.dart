
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocMark/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocMark/states.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

import '../components and constants/marks.dart';



List<String>students=['Fatima Alkhlif','Sama Tounsi','Nour Ghanem','Yumna Hashem','Abeer Barakat','Fatima Alkhlif','Sama Tounsi','Nour Ghanem','Yumna Hashem','Abeer Barakat'];

List<TextEditingController> controller = List.generate(students.length, (i) => TextEditingController());

var formKey=GlobalKey<FormState>();

var ctl=TextEditingController();

class AddMarks extends StatelessWidget {
  const AddMarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarksCubit,MarksStates>(
      listener: (context,state){},
      builder: (context,state)
      {
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
                  onPressed: (){},
                  icon: Icon(Icons.arrow_back,
                    weight: 2,
                    size: 35,
                    color: Colors.white,),),
                title: Text('Add Marks',
                  style: TextStyle(
                      color:Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
                actions: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top:10.0),
                  //   child: IconButton(
                  //       onPressed: ()
                  //       {
                  //         MarksCubit.get(context).addStudentsMarks(
                  //             students: students,
                  //             marks: controller);
                  //       },
                  //       icon: Icon(
                  //         Mdi.checkBoxOutline,
                  //         size: 35,
                  //       )),
                  // )
                ],
              ),
              body: Padding(
                padding: const EdgeInsetsDirectional.only(start:15.0,end:15,bottom:15,top:50),
                child: Column(
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
                                          name: students[index],
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
                            itemCount: students.length),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );

      },
    );
  }
}
