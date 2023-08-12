import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';

import '../../business logic/cubits/blocMark/cubit.dart';
import '../../business logic/cubits/blocMark/states.dart';
import '../components and constants/constants.dart';
import '../components and constants/marks.dart';

var model;

class ShowStudentMarks extends StatelessWidget {
  const ShowStudentMarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarksCubit, MarksStates>(
      listener: (context, state) {
        if (state is GetStudentMarksSuccessState) {
          model = state.studentMarks.marks;
        }
      },
      builder: (context, state) {
        if (state is GetStudentMarksSuccessState) {
          model = state.studentMarks.marks;
        }
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Wallpaper (4).png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          model = null;
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          weight: 2,
                          size: 35,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      text('Show Marks',
                          color: Colors.white,
                          weight: FontWeight.bold,
                          size: 22)
                    ],
                  ),
                ),
                ConditionalBuilder(
                  condition:
                      state is! GetStudentMarksLoadingState && model != null,
                  builder: (context) {
                    model = MarksCubit.get(context).studentMarks!.marks;
                    return MarksCubit.get(context).studentMarks!.isExist == true
                        ? Padding(
                            padding:
                                EdgeInsetsDirectional.only(top: 70, bottom: 15),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      vertical: 25, horizontal: 10),
                                  child: Row(
                                    children: [
                                      buildMarksHeaderItem(
                                          name: 'Subject',
                                          color: AppColors.lightOrange),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      buildMarksHeaderItem(
                                          width: 65,
                                          name: 'Obt',
                                          color: AppColors.lightOrange),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      buildMarksHeaderItem(
                                          width: 65,
                                          name: 'Max',
                                          color: AppColors.lightOrange),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      // physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return buildMarksItem(
                                            name: model[index].subject,
                                            obt: model[index].mark.toString(),
                                            max: model[index]
                                                .totalMark
                                                .toString());
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 25,
                                        );
                                      },
                                      itemCount: model.length),
                                )
                              ],
                            ),
                          )
                        : Center(
                            child: Text('No results found',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.darkBlue)));
                  },
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
