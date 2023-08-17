import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/SettingsCubit/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/SettingsCubit/states.dart';
import 'package:mobile_schoolapp/network/cache_helper.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/screens/login.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsStates>(
      listener: (context, state) {
        if (state is SettingsLogoutSuccessState) {
          CacheHelper.removeData(key: 'token').then((value) {
            CacheHelper.removeData(key: 'type');
          }).then((value) {
            CacheHelper.removeData(key: 'id').then((value) {
              CacheHelper.removeData(key: 'profile_id');
            }).then((value) {
              print(profileId.toString());
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
                        state.logoutModel!.messege.toString(),
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
            });

          }).then((value) => navigateAndFinish(context, Login()));
        } else if (state is SettingsLogoutErrorState) {
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
                    state.error,
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
      builder: (context, state) => Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              child: Image.asset(
                'images/head.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      print('9');
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  'Are you sure?',
                                  style: TextStyle(color: AppColors.darkBlue),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.darkBlue)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      String token =
                                          CacheHelper.getData(key: 'token');
                                      SettingsCubit.get(context).Logout(token);
                                      // CacheHelper.removeData(key: 'token');
                                      // CacheHelper.removeData(key: 'type');
                                      // CacheHelper.removeData(key: 'id');
                                    },
                                    child: const Text('OK',
                                        style: TextStyle(
                                            color: AppColors.darkBlue,
                                            fontSize: 18)),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.logout_outlined,
                              color: AppColors.lightOrange,
                            ),
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 22, color: AppColors.lightOrange),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: 400,
                            height: 400,
                            child: SvgPicture.asset(
                                "images/Usability testing-bro (1).svg"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
