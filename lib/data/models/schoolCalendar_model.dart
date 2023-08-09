class SchoolCalendarModel {
  List<HolidayModel>? holidays;
  List<ExamRangeModel>? exams;
  List<RegisterModel>? registration;
  List<WorkModel>? work;
  String? message;

  SchoolCalendarModel(
      {this.holidays, this.exams, this.registration, this.work, this.message});

  SchoolCalendarModel.fromJson(Map<String, dynamic> json) {
    if (json['holidays'] != null) {
      holidays = <HolidayModel>[];
      json['holidays'].forEach((element) {
        holidays!.add(HolidayModel.fromJson(element));
      });
    }

    if (json['exam_date'] != null) {
      exams = <ExamRangeModel>[];
      json['exam_date'].forEach((element) {
        exams!.add(ExamRangeModel.fromJson(element));
      });
    }

    if (json['register_date'] != null) {
      registration = <RegisterModel>[];
      json['register_date'].forEach((element) {
        registration!.add(RegisterModel.fromJson(element));
      });
    }

    if (json['work_date'] != null) {
      work = <WorkModel>[];
      json['work_date'].forEach((element) {
        work!.add(WorkModel.fromJson(element));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.holidays != null) {
      data['holidays'] = this.holidays!.map((v) => v.toJson()).toList();
    }
    if (this.exams != null) {
      data['exam_date'] = this.exams!.map((v) => v.toJson()).toList();
    }
    if (this.registration!= null) {
      data['register_date'] =
          this.registration!.map((v) => v.toJson()).toList();
    }
    if (this.work != null) {
      data['work_date'] = this.work!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

//holidays list model
class HolidayModel {
  dynamic type;
  dynamic name;
  dynamic startDate;
  dynamic endDate;

  HolidayModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        name = json['name'],
        startDate = DateTime.parse(json['start_date']),
        endDate = DateTime.parse(json['end_date']);

  Map<String, dynamic> toJson() => {
    'type': this.type,
    'name': this.name,
    'startDate': this.startDate.toString(),
    'endDate': this.endDate.toString(),
  };
}

class ExamRangeModel {
  dynamic type;
  dynamic name;
  dynamic startDate;
  dynamic endDate;

  ExamRangeModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        name = json['name'],
        startDate = DateTime.parse(json['start_date']),
        endDate = DateTime.parse(json['end_date']);

  Map<String, dynamic> toJson() => {
    'type': this.type,
    'name': this.name,
    'startDate': this.startDate.toString(),
    'endDate': this.endDate.toString(),
  };
}

class RegisterModel {
  dynamic type;
  dynamic name;
  dynamic startDate;
  dynamic endDate;

  RegisterModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        name = json['name'],
        startDate = DateTime.parse(json['start_date']),
        endDate = DateTime.parse(json['end_date']);

  Map<String, dynamic> toJson() => {
    'type': this.type,
    'name': this.name,
    'startDate': this.startDate.toString(),
    'endDate': this.endDate.toString(),
  };
}

class WorkModel {
  dynamic type;
  dynamic name;
  dynamic startDate;
  dynamic endDate;

  WorkModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        name = json['name'],
        startDate = DateTime.parse(json['start_date']),
        endDate = DateTime.parse(json['end_date']);

  Map<String, dynamic> toJson() => {
    'type': this.type,
    'name': this.name,
    'startDate': this.startDate.toString(),
    'endDate': this.endDate.toString(),
  };
}
