//each event model
class DateEventModel {
  String type;
  String name;
  DateTime start;
  DateTime end;

  DateEventModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        name = json['name'],
        start = json['start_date'],
        end = json['end_date'];
}

//holidays list model
class HolidayModel {
  List<DateEventModel> holidays=[];
  HolidayModel.fromJson(Map<String,dynamic> json){
    json['holidays'].forEach((element){
      holidays.add(DateEventModel.fromJson(element));
    }
    );
  }
}

class ExamRangeModel{
  List<DateEventModel> examRange=[];
  ExamRangeModel.fromJson(Map<String,dynamic> json){
    json['exam_date'].forEach((element){
      examRange.add(DateEventModel.fromJson(element));
    }
    );
  }
}

class RegisterDateModel{
  List<DateEventModel> registerDate=[];
  RegisterDateModel.fromJson(Map<String,dynamic> json){
    json['register_date'].forEach((element){
      registerDate.add(DateEventModel.fromJson(element));
    }
    );
  }
}

class WorkDateModel{
  List<DateEventModel> workDate=[];
  WorkDateModel.fromJson(Map<String,dynamic> json){
    json['work_date'].forEach((element){
      workDate.add(DateEventModel.fromJson(element));
    }
    );
  }
}

