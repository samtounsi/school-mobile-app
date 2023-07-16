import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/SettingsCubit/states.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_schoolapp/data/models/logout_model.dart';
import 'package:mobile_schoolapp/network/cache_helper.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';

import '../../../presentation/screens/login.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsinitState());

  static SettingsCubit get(context) => BlocProvider.of(context);

  LogoutModel? model;
  void Logout(String token) async {
    emit(SettingsLogoutLoadingState());
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://new-school-management-system.onrender.com/mob/logout'));
    request.headers['Authorization'] = 'Bearer $token';

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(token);
      model = LogoutModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      emit(SettingsLogoutSuccessState(model!));
      print(model!.messege);
    } else {
      emit(SettingsLogoutErrorState(
          error: jsonDecode(await response.stream.bytesToString())['messege']
              .toString()));
      print('Error');
    }

    // CacheHelper.removeData(key: 'token');
    // CacheHelper.removeData(key: 'type');
    // CacheHelper.removeData(key: 'id');
  }
}
