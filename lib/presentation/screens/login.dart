import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/logincubit/login_cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/logincubit/login_states.dart';
import 'package:mobile_schoolapp/network/cache_helper.dart';
import 'package:mobile_schoolapp/presentation/animations/parentMotion.dart';
import 'package:mobile_schoolapp/presentation/animations/studentMotion.dart';
import 'package:mobile_schoolapp/presentation/animations/teacherMotion.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/componentslogin.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

import 'package:mobile_schoolapp/presentation/screens/teacherhome.dart';

//import 'package:flutter_svg/flutter_svg.dart';
var usernameController = TextEditingController();
var passwordController = TextEditingController();
var formkey6 = GlobalKey<FormState>();

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, SchoolLoginStates>(
      listener: (context, state) {
        if (state is SchoolLoginSuccessState) {
          if (state.loginModel!.message == 'successful login') {
            CacheHelper.saveData(key: 'token', value: state.loginModel!.token)
                .then((value) {
              token = state.loginModel!.token!;
              print(token);
              print(state.loginModel!.message);
            }).then((value) {
              CacheHelper.saveData(key: 'id', value: state.loginModel!.id)
                  .then((value) {
                id = state.loginModel!.id!;
                print(id);
              });
            }).then((value) {
              CacheHelper.saveData(
                      key: 'profile_id', value: state.loginModel!.profileId)
                  .then((value) {
                profileId = state.loginModel!.profileId!;
                print(profileId);
              });
            }).then((value) {
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
                        state.loginModel!.message.toString(),
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
              CacheHelper.saveData(key: 'type', value: state.loginModel!.type)
                  .then((value) {
                type = state.loginModel!.type!;
                print(type);
                if (type == 'student') {
                  navigateAndFinish(context, StudentMotion());
                } else if (type == 'teacher') {
                  navigateAndFinish(context, TeacherMotion());
                } else if (type == 'parent') {
                  navigateAndFinish(context, ParentMotion());
                }
              });
            });
          }
        } else if (state is SchoolLoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightOrange,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.error.toString(),
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
      builder: (context, state) => Stack(
        children: [
          Image.asset(
            'images/OnBoard – 1.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Form(
                key: formkey6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                      child: Text(
                        'Welcome here\nLog in with your account',
                        style:
                            TextStyle(fontSize: 23, color: AppColors.darkBlue),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    middleInRow(
                      element: Container(
                          width: 300,
                          height: 300,
                          child: SvgPicture.asset(
                              'images/Back to school-pana BLUE.svg')),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    middleInRow(
                      element: defultTextFormField(
                        controller: usernameController,
                        kType: TextInputType.name,
                        text: 'username',
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Your username can\'t be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    middleInRow(
                      element: defultTextFormField(
                        controller: passwordController,
                        kType: TextInputType.visiblePassword,
                        text: 'password',
                        isPassword: LoginCubit.get(context).password,
                        sufIcon: LoginCubit.get(context).showPassword,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Your password can\'t be empty';
                          }
                          return null;
                        },
                        onSufPressed: () {
                          LoginCubit.get(context).changePassVisability();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    middleInRow(
                      element: ConditionalBuilder(
                        condition: state is! SchoolLoginLoadingState,
                        builder: (context) => defaultButton(
                            text: 'Continue',
                            onPressed: () {
                              if (formkey6.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                    username: usernameController.text,
                                    password: passwordController.text);
                              }
                            }),
                        fallback: (context) => Center(
                          child: CircularProgressIndicator(
                            color: AppColors.lightOrange,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
