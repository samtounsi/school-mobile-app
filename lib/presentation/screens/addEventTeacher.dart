import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocEvent/cubit.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

import '../../business logic/cubits/blocEvent/state.dart';
import '../../data/models/send_add_event_teacher.dart';

class AddEventTeacher extends StatelessWidget {
  AddEventTeacher({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var formKey4 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocConsumer<EventCubit, EventState>(
            listener: (context, state) {
              if (state is AddEventSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.aqua,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "added event success",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  width: MediaQuery.of(context).size.width - 10,
                ));
              }
              if (state is NotiSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.darkBlue,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.mes,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  width: MediaQuery.of(context).size.width - 10,
                ));
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 120, left: 30, right: 30, bottom: 30),
                  child: Form(
                    key: formKey4,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border:
                                Border.all(color: AppColors.darkBlue, width: 2),
                          ),
                          child: TextFormField(
                            controller: titleController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Event Title',
                              hintStyle: TextStyle(
                                  color: AppColors.darkBlue, fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border:
                                Border.all(color: AppColors.darkBlue, width: 2),
                          ),
                          child: TextFormField(
                            controller: timeController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Event Time',
                              hintStyle: TextStyle(
                                  color: AppColors.darkBlue, fontSize: 20),
                            ),
                            readOnly: true,
                            //set it true, so that user will not able to edit text
                            onTap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((value) {
                                timeController.text = value!.format(context);
                                print(value.format(context));
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border:
                                Border.all(color: AppColors.darkBlue, width: 2),
                          ),
                          child: TextFormField(
                            controller: dateController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Event Date',
                              hintStyle: TextStyle(
                                color: AppColors.darkBlue,
                                fontSize: 20,
                              ),
                            ),
                            readOnly: true,
                            //set it true, so that user will not able to edit text
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050))
                                  .then((value) {
                                print(DateFormat('yyyy/MM/dd').format(value!));
                                dateController.text =
                                    DateFormat('yyyy/MM/dd').format(value);
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border:
                                Border.all(color: AppColors.darkBlue, width: 2),
                          ),
                          child: TextFormField(
                            maxLines: null,
                            minLines: null,
                            expands: true,
                            textAlignVertical: TextAlignVertical.top,
                            controller: descriptionController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Description',
                              hintStyle: TextStyle(
                                  color: AppColors.darkBlue, fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ConditionalBuilder(
                          condition: state is! AddEventLoadingState,
                          builder: (BuildContext context) {
                            return Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.lightOrange),
                                child: TextButton(
                                    onPressed: () {
                                      AddEventTeacherModel add =
                                          AddEventTeacherModel(
                                              title: titleController.text,
                                              description:
                                                  descriptionController.text,
                                              eventDate: dateController.text,
                                              eventTime: timeController.text,
                                              userId: id!);
                                      EventCubit.get(context)
                                          .addEventTeacher(add);
                                      if (titleController.text
                                          .startsWith('Seventh')) {
                                        EventCubit.get(context)
                                            .sendNotification(
                                                titleController.text,
                                                descriptionController.text,
                                                'seventh');
                                      } else if (titleController.text
                                          .startsWith('Eighth')) {
                                        EventCubit.get(context)
                                            .sendNotification(
                                                titleController.text,
                                                descriptionController.text,
                                                'eighth');
                                      } else if (titleController.text
                                          .startsWith('Ninth')) {
                                        EventCubit.get(context)
                                            .sendNotification(
                                                titleController.text,
                                                descriptionController.text,
                                                'ninth');
                                      } else {
                                        EventCubit.get(context)
                                            .sendNotification(
                                                titleController.text,
                                                descriptionController.text,
                                                'all');
                                      }
                                    },
                                    child: Text(
                                      'Add Event',
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    )));
                          },
                          fallback: (BuildContext context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/head.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.darkBlue,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}
