
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


var formKey3=GlobalKey<FormState>();
var classController=TextEditingController();
var numOfQuestionsController=TextEditingController();
var labelController=TextEditingController();
var subjectController=TextEditingController();
var dateController=TextEditingController();
var startTimeController=TextEditingController();
var endTimeController=TextEditingController();
String classValue = 'seventh';
String semesterValue='1';

class AddQuizScreen extends StatelessWidget {


  const AddQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddQuizCubit,AddQuizStates>(
      listener: (context,state)
      {
        if(state is AddTeacherQuizSuccessState)
        {
          numOfQuestionsController.clear();
          labelController.clear();
          subjectController.clear();
          dateController.clear();
          startTimeController.clear();
          endTimeController.clear();
          //Navigator.pop(context);
        }
      },
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
                leading:  Padding(
                  padding: const EdgeInsets.only(top:15.0),
                  child: IconButton(
                    onPressed: (){
                      numOfQuestionsController.clear();
                      labelController.clear();
                      subjectController.clear();
                      dateController.clear();
                      startTimeController.clear();
                      endTimeController.clear();
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,
                      size: 28,
                      color: AppColors.darkBlue,),),
                ),
                titleSpacing: 0,
                title: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Text('Add Quiz',
                    style: TextStyle(
                        color:AppColors.darkBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              body: Form(
                key: formKey3,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start:15,end: 15,bottom: 15,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDropdown(
                            label: 'Choose class: ',
                            labelColor: AppColors.lightOrange,
                            list: ['seventh','eighth','ninth'],
                            onChanged: (value){
                                AddQuizCubit.get(context).changeClass(value!);
                                classValue = AddQuizCubit.get(context).classValue;
                              },
                            maxLength: 3,
                            value:classValue ),
                        buildDropdown(
                            label: 'Choose Semester ',
                            labelColor: AppColors.lightOrange,
                            list: ['1','2'],
                            onChanged: (value){
                              AddQuizCubit.get(context).changeSemester(value!);
                              semesterValue = AddQuizCubit.get(context).semesterValue;
                            },
                            maxLength: 3,
                            value:semesterValue ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 10,end:10,bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Subject: ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.lightOrange
                                ),
                              ),
                              SizedBox(height: 10,),
                              formfeild(
                                controller: subjectController,
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
                              Text('Date of Quiz: ',
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
                                    controller: dateController,
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
                                      showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2050))
                                          .then((value) {
                                        print(DateFormat.yMMMd()
                                            .format(value!));
                                        DateFormat('yyyy/MM/dd').format(value);
                                        dateController.text=DateFormat('yyyy/MM/dd').format(value);
                                      });
                                    },
                                  )),

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
                                          initialTime: TimeOfDay.now())
                                          .then((value) {
                                        print(
                                            '${value!.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}');
                                        startTimeController.text =
                                        '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
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
                                          initialTime: TimeOfDay.now())
                                          .then((value) {
                                        print(
                                            '${value!.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}');
                                        endTimeController.text =
                                        '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
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
                                    if(formKey3.currentState!.validate())
                                    {
                                      navigateTo(context, AddQuizQuestions(
                                        grade: classValue,
                                        semester: semesterValue,
                                        subject: subjectController.text,
                                        label: labelController.text,
                                        numberOfQuestions: int.parse(numOfQuestionsController.text),
                                       date: dateController.text,
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
