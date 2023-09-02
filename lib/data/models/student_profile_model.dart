class StudentProfileModel {
  String? type;
  int? id;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? motherName;
  String? motherLastName;
  String? telephoneNumber;
  dynamic gPA;
  String? address;
  String? gender;
  String? phoneNumber;
  String? nationality;
  String? birthday;
  String? gradeName;
  String? className;
  String? parentPhoneNumber;
  String? photo;
  // List<WorkDateModel> workDate = [];
  List<DateTime> absences =[];
  int numberOfAbsenceDays = 2;
  String? bio;
  String? message;

  StudentProfileModel(
      {this.type,
        this.id,
        this.firstName,
        this.lastName,
        this.fatherName,
        this.motherName,
        this.motherLastName,
        this.telephoneNumber,
        this.gPA,
        this.address,
        this.gender,
        this.phoneNumber,
        this.nationality,
        this.birthday,
        this.gradeName,
        this.className,
        this.parentPhoneNumber,
        this.photo,
        // required this.workDate,
        required this.absences,
        required this.numberOfAbsenceDays,
        this.bio,
        this.message});

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    motherLastName = json['mother_last_name'];
    telephoneNumber = json['telephone_number'];
    gPA = json['GPA'];
    address = json['address'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    nationality = json['nationality'];
    birthday = json['birthday'];
    gradeName = json['grade_name'];
    className = json['class_name'];
    parentPhoneNumber = json['parent_phone_number'];
    photo = json['photo'];
    // json['school_work_date'].forEach((element) {
    //   workDate.add(WorkDateModel.fromJson(element));
    // });
    //absences = json['absences'].cast<String>();
    if (json['absences'] != null) {
      json['absences'].forEach((element) {
        absences.add(DateTime.parse(element));
      });
    }
    numberOfAbsenceDays = json['number_of_absence_days'];
    bio = json['bio'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['father_name'] = this.fatherName;
    data['mother_name'] = this.motherName;
    data['mother_last_name'] = this.motherLastName;
    data['telephone_number'] = this.telephoneNumber;
    data['GPA'] = this.gPA;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['phone_number'] = this.phoneNumber;
    data['nationality'] = this.nationality;
    data['birthday'] = this.birthday;
    data['grade_name'] = this.gradeName;
    data['class_name'] = this.className;
    data['parent_phone_number'] = this.parentPhoneNumber;
    data['photo'] = this.photo;
    // if (this.workDate != null) {
    //   data['workDate'] = this.workDate.map((v) => v.toJson()).toList();
    // }
    if (this.absences != null) {
      // ignore: unnecessary_this
      data['absences'] = this.absences!.map((v) => v.toString()).toList();
    }
    //data['absences'] = this.absences;
    data['number_of_absence_days'] = this.numberOfAbsenceDays;
    data['bio'] = this.bio;
    data['message'] = this.message;
    return data;
  }
}

class WorkDateModel {
  DateTime startSchool;
  DateTime endSchool;

  WorkDateModel({
    required this.startSchool,
    required this.endSchool,
  });

  WorkDateModel.fromJson(Map<String, dynamic> json)
      : startSchool = DateTime.parse(json['start_date']),
        endSchool = DateTime.parse(json['end_date']);

  Map<String, dynamic> toJson() => {
    'start_date': startSchool.toString(),
    'end_date': endSchool.toString(),
  };
}
