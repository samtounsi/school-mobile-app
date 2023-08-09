import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/score_board_cubit/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/score_board_cubit/states.dart';

import '../../data/models/score_board_model.dart';
import '../classes/student.dart';
import '../components and constants/constants.dart';
import '../../shared/utils.dart';

final columns = ['Name', 'True Ans', 'Time'];

var model;
class ScoreBoard extends StatelessWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScoreBoardCubit,ScoreBoardStates>(
      listener: (context,state)
      {
       if(state is ScoreBoardSuccessState)
       {
         model=state.scoreBoardModel.scoreboard;
       }
      },
      builder: (context,state)
      {
        if(state is ScoreBoardSuccessState)
        {
          model=state.scoreBoardModel.scoreboard;
        }
        return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Wallpaper (4).png"),
                fit: BoxFit.fill,
              ),
            ),
            child: SafeArea(
                child: Padding(
                    padding:
                    EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 10),
                    child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: ConditionalBuilder(
                          condition: state is ! ScoreBoardLoadingState,
                          builder: (context)
                          {
                            model=ScoreBoardCubit.get(context).scoreBoardModel!.scoreboard;
                            return model.length!=0?
                            Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 25,
                                    child: IconButton(
                                      onPressed: ()
                                      {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        size: 25,
                                        color: AppColors.darkBlue,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'ScoreBoard',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  //  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      DataTable(
                                        columns: getColumns(columns),
                                        rows: getRows(model),
                                        border: TableBorder.all(
                                            width: 1, color: Colors.grey),
                                        columnSpacing: 20,
                                        dataRowHeight: 60,
                                        headingRowColor: MaterialStateColor.resolveWith(
                                              (states) => Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: SvgPicture.asset(
                                          'images/Exams-bro ORANGE.svg',
                                          width: 300.0,
                                          height: 300.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]): Center(
                                child: Text(
                                    'No results found',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.darkBlue)));
                          },
                          fallback: (context)=>Center(child: CircularProgressIndicator()),
                        )))));
      },
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
          label: Flexible(
        child: Text(
          column,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.lightOrange),
        ),
      ));
    }).toList();
  }

  List<DataRow> getRows(List<Scoreboard> students) {
    return students.map((Scoreboard student) {
      final cells = [student.name, student.numberOfAnswers, student.time];
      return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
        return DataCell(Center(
          child: Flexible(
            child: Text(
              '$cell',
              style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
      }));
    }).toList();
  }
}
