import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business logic/cubits/blocMark/cubit.dart';
import '../../business logic/cubits/blocMark/states.dart';
import '../components and constants/constants.dart';
import '../components and constants/marks.dart';

var model;

class ShowMarks extends StatelessWidget {
  const ShowMarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarksCubit, MarksStates>(
      listener: (context, state) {
        if (state is GetMarksSuccessState) {
          model = state.getStudentsMarksModel.marks;
        }
      },
      builder: (context, state) {
        if (state is GetMarksSuccessState) {
          model = state.getStudentsMarksModel.marks;
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
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  model = null;
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  weight: 2,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              titleSpacing: 15,
              title: Text(
                'Show Marks',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.only(top: 20, bottom: 15),
              child: ConditionalBuilder(
                condition: state is! GetMarksLoadingState && model != null,
                builder: (context) {
                  model = MarksCubit.get(context).getStudentsMarksModel!.marks;
                  return MarksCubit.get(context).getStudentsMarksModel!.exist ==
                          1
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.all(15),
                              child: Row(
                                children: [
                                  buildMarksHeaderItem(
                                      name: 'Student\'s name',
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
                                        name:
                                            model[index].studentName.toString(),
                                        obt: model[index].mark.toString(),
                                        max: model[index].max.toString());
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 25,
                                    );
                                  },
                                  itemCount: model.length),
                            )
                          ],
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
            ),
          ),
        );
      },
    );
  }
}
