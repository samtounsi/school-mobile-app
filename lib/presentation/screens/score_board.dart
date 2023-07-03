import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../classes/student.dart';
import '../components and constants/constants.dart';
import '../../shared/utils.dart';

final columns = ['Name', 'True Ans', 'Time'];
List<Students> students = [
  Students(name: 'Fatima Alkhlif ', numberOfAnswers: '10', time: '30:00'),
  Students(name: 'Sama Altounsi', numberOfAnswers: '10', time: '30:00'),
  Students(name: 'Nour Ghanem', numberOfAnswers: '10', time: '30:00'),
  Students(name: 'Yumna Hashem', numberOfAnswers: '10', time: '30:00'),
  Students(name: 'Abeer Barakat', numberOfAnswers: '10', time: '30:00'),
];

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Wallpaper 2.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
            child: Padding(
                padding:
                    EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 10),
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            child: IconButton(
                              onPressed: () {},
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
                                rows: getRows(students),
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
                    ])))));
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

  List<DataRow> getRows(List<Students> students) {
    return students.map((Students student) {
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
