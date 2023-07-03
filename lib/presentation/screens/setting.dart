import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("images/Wallpaper 2.png"),
        fit: BoxFit.fill,
      )),
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                print('9');
              },
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Column(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: ListTile(
                                  title: Text('Arabic',
                                      style: TextStyle(
                                          color: AppColors.darkBlue,
                                          fontSize: 20)),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: ListTile(
                                  title: Text('English',
                                      style: TextStyle(
                                          color: AppColors.darkBlue,
                                          fontSize: 20)),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.translate,
                        color: AppColors.lightOrange,
                      ),
                      title: Text(
                        'translation',
                        style: TextStyle(
                            fontSize: 22, color: AppColors.lightOrange),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel',
                                  style: TextStyle(
                                      fontSize: 18, color: AppColors.darkBlue)),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK',
                                  style: TextStyle(
                                      color: AppColors.darkBlue, fontSize: 18)),
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
                    height: 40,
                  ),
                  Container(
                      width: 400,
                      height: 400,
                      child: SvgPicture.asset("images/setting3.svg"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
