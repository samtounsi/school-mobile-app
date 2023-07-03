import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

class AddEventTeacher extends StatelessWidget {
   AddEventTeacher({Key? key}) : super(key: key);
  TextEditingController titleController=TextEditingController();
  TextEditingController timeController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
   var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top:120,
              left: 30,
              right: 30,
              bottom: 30),
              child: Form(
                key: formKey,
                child: Column(
                  children:
                  [
                    Container(
                      padding: EdgeInsets.only(left: 14),

                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: AppColors.darkBlue,
                        width: 2),

                ),
                      child: TextFormField(

                        controller:titleController ,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Event Title',
                          hintStyle: TextStyle(
                            color: AppColors.darkBlue,
                            fontSize: 20


                          ),

                        ),

                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 14),

                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: AppColors.darkBlue,
                            width: 2),

                      ),
                      child: TextFormField(

                        controller:timeController ,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Event Time',
                          hintStyle: TextStyle(
                              color: AppColors.darkBlue,
                              fontSize: 20


                          ),

                        ),
                        readOnly: true,
                        //set it true, so that user will not able to edit text
                        onTap: ()  {
                          showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now()).then((value) {
                            timeController.text=value!.format(context);
                            print(value.format(context));
                          });
                        },

                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(left: 14),

                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: AppColors.darkBlue,
                            width: 2),

                      ),
                      child: TextFormField(

                        controller:timeController ,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Event Date',
                          hintStyle: TextStyle(
                              color: AppColors.darkBlue,
                              fontSize: 20


                          ),

                        ),
                        readOnly: true,
                        //set it true, so that user will not able to edit text
                        onTap: ()  {

                        },

                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 200,
                      padding: EdgeInsets.only(left: 14),

                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: AppColors.darkBlue,
                            width: 2),

                      ),
                      child: TextFormField(

                        controller:descriptionController ,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Description',
                          hintStyle: TextStyle(
                              color: AppColors.darkBlue,
                              fontSize: 20


                          ),

                        ),


                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.lightOrange

                      ),
                        child: TextButton(onPressed:(){}, child:Text('Add Event',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white
                        ),)))



                  ],
                ),
              ),
            ),
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
            child: IconButton(onPressed:(){
              Navigator.pop(context);
            }, icon:Icon(Icons.arrow_back,
            color: AppColors.darkBlue,
            size: 30,)),
          )
        ],
      ),
    );
  }
}
