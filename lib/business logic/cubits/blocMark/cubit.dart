import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocMark/states.dart';

import '../../../presentation/classes/addmarks.dart';
import '../../../presentation/classes/show_marks.dart';
import '../../../presentation/classes/show_student_marks.dart';

class MarksCubit extends Cubit<MarksStates> {
  MarksCubit() :super(MarksInitialState());

  static MarksCubit get(context) => BlocProvider.of(context);

  List<MarksAdd>m=[];
  addStudentsMarks({required List students,required List marks})
  {
    for(int i=0;i<students.length;i++)
    {
        m.add(MarksAdd(name: students[i], mark: marks[i].text));
        print(m[i].name.toString());
        print(m[i].mark.toString());
    }

  }
  List <Marks> marks=[];
   getMarks(){
    marks= [
      Marks(name: 'Fatima Alkhlif', obt: '90',max: '100'),
      Marks(name: 'Sama Tounsi', obt: '90',max:'100'),
      Marks(name: 'Abeer Barakat', obt: '90',max:'100'),
      Marks(name: 'Yumna Hashem', obt: '90',max:'100'),
      Marks(name: 'Nour Ghanem', obt: '90',max:'100'),
      Marks(name: 'Fatima Alkhlif', obt: '90',max: '100'),
      Marks(name: 'Sama Tounsi', obt: '90',max:'100'),
      Marks(name: 'Abeer Barakat', obt: '90',max:'100'),
      Marks(name: 'Yumna Hashem', obt: '90',max:'100'),
      Marks(name: 'Nour Ghanem', obt: '90',max:'100'),
    ];
    //emit(getMarkssuccessState());
    return marks;
  }

  List <StudentMarks> studentMarks=[];
  getStudentMarks(){
    studentMarks= [
      StudentMarks(subject: 'Arabic', max: '600', obt: '90'),
      StudentMarks(subject: 'Arabic', max: '400', obt: '360', ),
      StudentMarks(subject: 'English', max: '400', obt: '360', ),
      StudentMarks(subject: 'French', max: '300', obt: '260', ),
      StudentMarks(subject: 'Math', max: '600', obt: '590',  ),
      StudentMarks(subject: 'Physics', max: '400', obt: '360',  ),
      StudentMarks(subject: 'Chemistry', max: '400', obt: '360', ),
      StudentMarks(subject: 'Social Studies', max: '400', obt: '360',  ),
      StudentMarks(subject: 'Culture', max: '200', obt: '200', ),
      StudentMarks(subject: 'Science', max: '400', obt: '360', ),
      StudentMarks(subject: 'Technology', max: '200', obt: '200',  ),
      StudentMarks(subject: 'Religion', max: '200', obt: '160',  ),
      StudentMarks(subject: 'Philosophy', max: '200', obt: '160', ),
      StudentMarks(subject: 'Art', max: '200', obt: '200', ),
      StudentMarks(subject: 'Music', max: '200', obt: '200',  ),
      StudentMarks(subject: 'Sport', max: '200', obt: '200', ),
    ];
    //emit(getStudentMarksSuccessState());
    return studentMarks;
  }
}