import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/logincubit/login_states.dart';
import 'package:mobile_schoolapp/data/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_schoolapp/notifications/firebase.dart';

class LoginCubit extends Cubit<SchoolLoginStates> {
  LoginCubit() : super(SchoolLoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  //change password viability
  bool password = true;
  IconData showPassword = Icons.remove_red_eye_outlined;

  void changePassVisability() {
    emit(SchoolLoginChangePWVisabilityState());
    password = !password;
    showPassword =
    password ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  }

  //login process function
  //post request
  LoginModel? model;
  void userLogin({required String username, required String password}) async {
    emit(SchoolLoginLoadingState());
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://new-school-management-system.onrender.com/mob/login'));
    request.fields.addAll({'username': username, 'password': password,
      'fcm_token':fCMToken.toString()});



    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(username);
      print(password);
      model = LoginModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      //await Future.delayed(const Duration(milliseconds: 1000));
      emit(SchoolLoginSuccessState(model!));
      // print(model?.token);
      // print(model?.type);
      // print(model?.message);
      print(model?.id);
    } else {
      emit(SchoolLoginErrorState(
          error: jsonDecode(await response.stream.bytesToString())['message']
              .toString()));
    }
  }
}
