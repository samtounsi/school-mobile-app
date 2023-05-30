import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components1.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';


class FeedBack extends StatelessWidget {
  FeedBack({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration:BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Wallpaper.png'),
            fit: BoxFit.fill
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
            body: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30,top: 50,right: 30),
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Colors.white,
                          boxShadow:[
                            BoxShadow(
                                blurRadius: 2, color: Color(0x3A75A4FF), spreadRadius: 5),
                          ],
                      border:Border.all(color: AppColors.borderColor
                      ) ),
                      child:   Center(
                        child: defaultformfeild(
                          radius: 45,

                          width: 300,
                          height: 200,

                          maxChars: [
                            new LengthLimitingTextInputFormatter(300
                             ),
                          ],
                          controller: controller,
                          type: TextInputType.text,
                          label:'' ,
                          validate:(value) {
                            if (value.toString().isEmpty) {
                              return 'enter your FeedBack';
                            }
                          },
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          color: Colors.white,

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultTextButton(text:'Submit',function: (){
                        if(formKey.currentState!.validate()){
                        }
                      },radius: 10.0 ,
                      background: AppColors.lightOrange),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
