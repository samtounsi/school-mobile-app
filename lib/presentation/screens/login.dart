import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/logincubit/login_cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/logincubit/login_states.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';



//import 'package:flutter_svg/flutter_svg.dart';
var usernameController = TextEditingController();
var passwordController = TextEditingController();
var formkey = GlobalKey<FormState>();

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, SchoolLoginStates>(
        listener: (context, state) {},
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
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                        child: Text(
                          'Welcome here\nLog in with your account',
                          style: TextStyle(fontSize: 23, color: AppColors.blue),
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
                                'assets/images/Back to school-pana BLUE.svg')),
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
                          condition: true,
                          builder: (context) => defaultButton(
                              text: 'Continue',
                              onPressed: () {
                                if (formkey.currentState!.validate()) {}
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
      ),
    );
  }
}
