import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocParent/cubitParent.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocParent/stateParent.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

class FeedBack extends StatelessWidget {
  FeedBack({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  var formKey5 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Wallpaper.png'), fit: BoxFit.fill)),
      child: BlocConsumer<ParentCubit, ParentState>(
        listener: (context, state) {
          if (state is FeedbackSuccessState) {
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
                      "send feedback success",
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
          return Scaffold(
              backgroundColor: Colors.transparent,
              body: Form(
                key: formKey5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: AppColors.darkBlue,
                                size: 35,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Feedback',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, top: 180, right: 30),
                            child: Container(
                              width: 300,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45),
                                  color: Colors.white,
                                  boxShadow: [
                                    const BoxShadow(
                                        blurRadius: 2,
                                        color: Color(0x3A75A4FF),
                                        spreadRadius: 5),
                                  ],
                                  border:
                                      Border.all(color: AppColors.borderColor)),
                              child: Center(
                                child: defaultformfeild(
                                  radius: 45,
                                  width: 300,
                                  height: 200,
                                  maxChars: [
                                    LengthLimitingTextInputFormatter(300),
                                  ],
                                  controller: controller,
                                  type: TextInputType.text,
                                  label: '',
                                  validate: (value) {
                                    if (value.toString().isEmpty) {
                                      return 'enter your FeedBack';
                                    }
                                  },
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ConditionalBuilder(
                                condition: state is! FeedbackLoadingState,
                                builder: (BuildContext context) {
                                  return defaultTextButton(
                                      text: 'Send',
                                      function: () {
                                        if (formKey5.currentState!.validate()) {
                                          ParentCubit.get(context).postFeedBack(
                                              feedback: controller.text);
                                        }
                                      },
                                      radius: 10.0,
                                      background: AppColors.lightOrange);
                                },
                                fallback: (BuildContext context) =>
                                    const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
