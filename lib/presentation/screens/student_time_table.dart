import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/subject_text.dart';
import 'package:mobile_schoolapp/shared/utils.dart';

final columns = ['Day', '1', '2', '3', '4', '5', '6'];
List<Lessons> lesson = [
  Lessons(
    day: 'Sun',
    first: 'E',
    second: 'S',
    third: 'T',
    fourth: 'E',
    fifth: 'S',
    sixth: 'M',
  ),
  Lessons(
    day: 'Mon',
    first: 'M',
    second: 'P',
    third: 'C',
    fourth: 'M',
    fifth: 'P',
    sixth: 'Mu',
  ),
  Lessons(
    day: 'Tue',
    first: 'T',
    second: 'Sp',
    third: 'R',
    fourth: 'S',
    fifth: 'E',
    sixth: 'Ar',
  ),
  Lessons(
      day: 'Tue',
      first: 'T',
      second: 'Sp',
      third: 'R',
      fourth: 'S',
      fifth: 'E',
      sixth: 'Ar'),
  Lessons(
      day: 'Tue',
      first: 'T',
      second: 'Sp',
      third: 'R',
      fourth: 'S',
      fifth: 'E',
      sixth: 'Ar'),
];

class StudentTimeTable extends StatelessWidget {
  const StudentTimeTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Wallpaper.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 20, top: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Time table',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                DataTable(
                  columns: getColumns(columns),
                  rows: getRows(lesson),
                  border: TableBorder.all(width: 1, color: AppColors.darkBlue),
                  columnSpacing: 25,
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.lightOrange),
                  // dataRowColor: MaterialStateColor.resolveWith((states) => AppColors.lightOrange),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        buildSubject('Arabic:A'),
                        buildSubject('English:E'),
                        buildSubject('French:F'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        buildSubject('Art: A'),
                        buildSubject('Music:Mu'),
                        buildSubject('Sport:Sp')
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        buildSubject('Science:S'),
                        buildSubject('Technology:T'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        buildSubject('Math:M'),
                        buildSubject('Physics:P'),
                        buildSubject('Chemistry:Ch'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        buildSubject('Social studies: Soc'),
                        buildSubject('Culture:C'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        buildSubject('Religion:R'),
                        buildSubject('philosophy:Ph'),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
          label: Text(
        column,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.darkBlue),
      ));
    }).toList();
  }

  List<DataRow> getRows(List<Lessons> lessons) {
    return lessons.map((Lessons lesson) {
      final cells = [
        lesson.day,
        lesson.first,
        lesson.second,
        lesson.third,
        lesson.fourth,
        lesson.fifth,
        lesson.sixth
      ];
      return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
        return DataCell(Text(
          '$cell',
          style: TextStyle(
              color: AppColors.darkBlue,
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ));
      }));
    }).toList();
  }
}

class Lessons {
  String day;
  String first;
  String second;
  String third;
  String fourth;
  String fifth;
  String sixth;

  Lessons({
    required this.day,
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
    required this.fifth,
    required this.sixth,
  });
}
