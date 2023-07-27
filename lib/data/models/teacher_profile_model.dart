class TeacherProfileModel {
  String? type;
  int? id;
  String? firstName;
  String? lastName;
  String? address;
  String? gender;
  String? phoneNumber;
  String? nationality;
  int? yearsOfExperience;
  String? birthday;
  List<String>? subjects;
  List<Classes>? classes;
  String? photo;
  String? bio;
  String? email;
  String? university;
  String? message;

  TeacherProfileModel(
      {this.type,
        this.id,
        this.firstName,
        this.lastName,
        this.address,
        this.gender,
        this.phoneNumber,
        this.nationality,
        this.yearsOfExperience,
        this.birthday,
        this.subjects,
        this.classes,
        this.photo,
        this.bio,
        this.email,
        this.university,
        this.message});

  TeacherProfileModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    nationality = json['nationality'];
    yearsOfExperience = json['years_of_experience'];
    birthday = json['birthday'];
    subjects = json['subjects'].cast<String>();
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
    photo = json['photo'];
    bio = json['bio'];
    email = json['email'];
    university = json['university'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['phone_number'] = this.phoneNumber;
    data['nationality'] = this.nationality;
    data['years_of_experience'] = this.yearsOfExperience;
    data['birthday'] = this.birthday;
    data['subjects'] = this.subjects;
    if (this.classes != null) {
      data['classes'] = this.classes!.map((v) => v.toJson()).toList();
    }
    data['photo'] = this.photo;
    data['bio'] = this.bio;
    data['email'] = this.email;
    data['university'] = this.university;
    data['message'] = this.message;
    return data;
  }
}

class Classes {
  String? grade;
  String? section;

  Classes({this.grade, this.section});

  Classes.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
    section = json['section'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grade'] = this.grade;
    data['section'] = this.section;
    return data;
  }
}
