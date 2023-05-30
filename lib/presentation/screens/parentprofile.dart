import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/profiletext.dart';

List<String> children = [
  'Taylor Swift',
  'Austin Swift',
];

class ParentProfile extends StatelessWidget {
  const ParentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Wallpaper.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, right: 20, bottom: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: AppColors.shadow,
                                  spreadRadius: 20)
                            ]),
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.white,
                          child: Image.asset('images/Icon.png',
                              fit: BoxFit.cover, scale: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ProfileText(
                  text1: 'Name',
                  text2: 'Andrea Swift',
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Children\'s accounts ',
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBlue),
                ),
                SizedBox(
                  height: 17,
                ),
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildChildItem(children[index], index, context);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 15);
                    },
                    itemCount: 2),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: SvgPicture.asset(
                    'images/Back to school-rafiki ORANGE.svg',
                    width: 350.0,
                    height: 350.0,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChildItem(childAccount, index, context) {
    return Container(
      width: 340,
      height: 80,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(blurRadius: 10, color: AppColors.shadow, spreadRadius: 15)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          childAccount,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
