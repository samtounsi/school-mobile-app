
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business logic/cubits/blocMark/cubit.dart';
import '../../business logic/cubits/blocMark/states.dart';
import '../components and constants/constants.dart';
import '../components and constants/marks.dart';


class ShowMarks extends StatelessWidget {
  const ShowMarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarksCubit,MarksStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Wallpaper.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading:  IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,
                    weight: 2,
                    size: 35,
                    color: Colors.white,),),
                titleSpacing: 15,
                title: Text('Show Marks',
                  style: TextStyle(
                      color:Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              body: Padding(
                padding: EdgeInsetsDirectional.only(top:60, bottom: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.all(15),
                      child: Row(
                        children: [
                          buildMarksHeaderItem(
                              name: 'Student\'s name',
                              color: AppColors.lightOrange
                          ),
                          SizedBox(width: 20,),
                          buildMarksHeaderItem(
                              width: 65,
                              name: 'Obt',
                              color: AppColors.lightOrange
                          ),
                          SizedBox(width: 20,),
                          buildMarksHeaderItem(
                              width: 65,
                              name: 'Max',
                              color: AppColors.lightOrange
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                          scrollDirection:Axis.vertical ,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index)
                          {
                            return buildMarksItem(
                                name: MarksCubit.get(context).getMarks()[index].name,
                                obt: MarksCubit.get(context).getMarks()[index].obt,
                                max: MarksCubit.get(context).getMarks()[index].max);
                          },
                          separatorBuilder: (context,index)
                          {
                            return SizedBox(height: 25,);
                          },
                          itemCount:  MarksCubit.get(context).getMarks().length),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
