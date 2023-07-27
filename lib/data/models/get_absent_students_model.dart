class GetAbsentStudents {
  List<AbsenceStudents>? absenceStudents;
  int? numberOfAbsences;
  int? numberOfAttendences;
  bool? exist;
  String? message;

  GetAbsentStudents(
      {this.absenceStudents,
        this.numberOfAbsences,
        this.numberOfAttendences,
        this.exist,
        this.message});

  GetAbsentStudents.fromJson(Map<String, dynamic> json) {
    if (json['absence_students'] != null) {
      absenceStudents = <AbsenceStudents>[];
      json['absence_students'].forEach((v) {
        absenceStudents!.add(new AbsenceStudents.fromJson(v));
      });
    }
    numberOfAbsences = json['number_of_absences'];
    numberOfAttendences = json['number_of_attendences'];
    exist = json['exist'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.absenceStudents != null) {
      data['absence_students'] =
          this.absenceStudents!.map((v) => v.toJson()).toList();
    }
    data['number_of_absences'] = this.numberOfAbsences;
    data['number_of_attendences'] = this.numberOfAttendences;
    data['exist'] = this.exist;
    data['message'] = this.message;
    return data;
  }
}

class AbsenceStudents {
  String? firstName;
  String? fatherName;
  String? lastName;

  AbsenceStudents({this.firstName, this.fatherName, this.lastName});

  AbsenceStudents.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    fatherName = json['father_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['father_name'] = this.fatherName;
    data['last_name'] = this.lastName;
    return data;
  }
}
