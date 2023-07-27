class StudentProfileModel {
  String? type;
  int? id;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? motherName;
  String? motherLastName;
  String? telephoneNumber;
  double? gPA;
  String? address;
  String? gender;
  String? phoneNumber;
  String? nationality;
  String? birthday;
  String? gradeName;
  String? className;
  String? parentPhoneNumber;
  String? photo;
  List<String>? absences;
  int? numberOfAbsenceDays;
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
        this.absences,
        this.numberOfAbsenceDays,
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
    absences = json['absences'].cast<String>();
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
    data['absences'] = this.absences;
    data['number_of_absence_days'] = this.numberOfAbsenceDays;
    data['bio'] = this.bio;
    data['message'] = this.message;
    return data;
  }
}
