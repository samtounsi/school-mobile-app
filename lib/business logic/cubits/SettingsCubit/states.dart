import 'package:mobile_schoolapp/data/models/logout_model.dart';

abstract class SettingsStates{}

class SettingsinitState extends SettingsStates{}

class SettingsLogoutLoadingState extends SettingsStates{}

class SettingsLogoutSuccessState extends SettingsStates{
  final LogoutModel? logoutModel;
   SettingsLogoutSuccessState(this.logoutModel);
}

class SettingsLogoutErrorState extends SettingsStates{
  final String error;
  SettingsLogoutErrorState({required this.error});
}