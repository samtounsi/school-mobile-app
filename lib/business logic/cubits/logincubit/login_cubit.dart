import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/logincubit/login_states.dart';


class LoginCubit extends Cubit<SchoolLoginStates> {
  LoginCubit() : super(SchoolLoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool password = true;
  IconData showPassword = Icons.remove_red_eye_outlined;

  void changePassVisability() {
    emit(SchoolLoginChangePWVisabilityState());
    password = !password;
    showPassword =
        password ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  }
}
