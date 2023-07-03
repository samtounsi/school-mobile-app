
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocAddQuizzes/states.dart';
import 'package:mobile_schoolapp/presentation/screens/add_quiz_questions.dart';

import '../../business logic/cubits/blocAddQuizzes/cubit.dart';
import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import '../components and constants/dropdown.dart';
import '../components and constants/marks.dart';


var formKey=GlobalKey<FormState>();
var classController=TextEditingController();
var numOfQuestionsController=TextEditingController();
var labelController=TextEditingController();
var startTimeController=TextEditingController();
var endTimeController=TextEditingController();
String classValue = '7th grade';

class AddQuizScreen extends StatelessWidget {


  const AddQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddQuizCubit,AddQuizStates>(
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
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,
                    size: 28,
                    color: AppColors.darkBlue,),),
                title: Text('Add Quiz',
                  style: TextStyle(
                      color:AppColors.darkBlue,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start:15,end: 15,bottom: 15,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDropdown(
                            label: 'Choose class: ',
                            labelColor: AppColors.lightOrange,
                            list: ['7th grade','8th grade','9th grade'],
                            onChanged: (value){
                                AddQuizCubit.get(context).changeClass(value!);
                                classValue = AddQuizCubit.get(context).classValue;
                              },
                            maxLength: 3,
                            value:classValue ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 10,end:10,bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Label: ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.lightOrange
                                ),
                              ),
                              SizedBox(height: 10,),
                              formfeild(
                                  controller: labelController,
                                  Width: 280,
                                  height: 60,
                                  textStyle: TextStyle(
                                  color: AppColors.darkBlue,
                                  fontSize: 22
                              ),
                                  bordercolor: Colors.grey,
                                  type: TextInputType.text,
                                  label: '',
                                  labelTextColor: AppColors.darkBlue,
                                  validate:(value) {
                                    if (value.toString().isEmpty) {
                                      return 'Add Quiz label please!!';
                                    }
                                  },
                              ),
                              SizedBox(height: 10,),
                              Text('Number of Questins: ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.lightOrange
                                ),
                              ),
                              SizedBox(height: 10,),
                              formfeild(
                                controller: numOfQuestionsController,
                                Width: 280,
                                height: 60,
                                textStyle: TextStyle(
                                    color: AppColors.darkBlue,
                                    fontSize: 22
                                ),
                                bordercolor: Colors.grey,
                                type: TextInputType.numberWithOptions(),
                                label: '',
                                labelTextColor: AppColors.darkBlue,
                                validate:(value) {
                                  if (value.toString().isEmpty) {
                                    return 'Add number of Quiz\'s questions please!!';
                                  }
                                },
                              ),
                              SizedBox(height: 10,),
                              Text('Start time of Quiz: ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.lightOrange
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 280,
                                  height: 60,
                                  child: TextField(
                                    style: TextStyle(
                                      color: AppColors.darkBlue,
                                      fontSize: 22
                                    ),
                                    controller: startTimeController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: '',
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.grey
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: AppColors.darkBlue
                                        ),
                                      ),
                                    ),
                                    readOnly: true,
                                    //set it true, so that user will not able to edit text
                                    onTap: ()  {
                                      showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now()).then((value) {
                                        startTimeController.text=value!.format(context);
                                        print(value.format(context));
                                      });
                                    },
                                  )),

                              SizedBox(height: 10,),
                              Text('End time of Quiz: ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.lightOrange
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 280,
                                  height: 60,
                                  child: TextField(
                                    style: TextStyle(
                                        color: AppColors.darkBlue,
                                        fontSize: 22
                                    ),
                                    controller: endTimeController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: '',
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.grey
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: AppColors.darkBlue
                                        ),
                                      ),
                                    ),
                                    readOnly: true,
                                    //set it true, so that user will not able to edit text
                                    onTap: ()  {
                                      showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now()).then((value) {
                                        endTimeController.text=value!.format(context);
                                        print(value.format(context));
                                      });
                                    },
                                  )),
                              SizedBox(height: 10,),
                              Center(
                                child: Column(
                                   children: [
                                     SvgPicture.asset(
                                      'images/quiz.svg',
                                      width: 150.0,
                                      height: 150.0,
                                ),
                              SizedBox(height: 10,),
                              GestureDetector(
                                  child: buildMarksHeaderItem(
                                      name: 'countinue',
                                      color: AppColors.lightOrange),
                                  onTap: ()
                                  {
                                    if(formKey.currentState!.validate())
                                    {
                                      navigateTo(context, AddQuizQuestions(
                                        grade: classValue,
                                        label: labelController.text,
                                        numberOfQuestions: int.parse(numOfQuestionsController.text),
                                        startTime: startTimeController.text,
                                        endTime: endTimeController.text,

                                      ));
                                    }
                                  })
                                   ],
                                 ),
                              ),
                                ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
