class ParentProfileModel {
  String? type;
  int? id;
  String? name;
  String? phoneNumber;
  List<Childrens>? childrens;
  String? photo;
  String? message;

  ParentProfileModel(
      {this.type,
        this.id,
        this.name,
        this.phoneNumber,
        this.childrens,
        this.photo,
        this.message});

  ParentProfileModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    if (json['childrens'] != null) {
      childrens = <Childrens>[];
      json['childrens'].forEach((v) {
        childrens!.add(new Childrens.fromJson(v));
      });
    }
    photo = json['photo'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    if (this.childrens != null) {
      data['childrens'] = this.childrens!.map((v) => v.toJson()).toList();
    }
    data['photo'] = this.photo;
    data['message'] = this.message;
    return data;
  }
}

class Childrens {
  int? id;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? motherName;
  String? motherLastName;
  String? gender;
  String? address;
  String? phoneNumber;
  String? photo;
  String? telephoneNumber;
  double? gPA;
  String? birthday;
  String? nationality;
  String? bio;
  String? createdAt;
  String? updatedAt;
  int? userId;
  int? gradeId;
  int? sectionId;
  int? parentId;

  Childrens(
      {this.id,
        this.firstName,
        this.lastName,
        this.fatherName,
        this.motherName,
        this.motherLastName,
        this.gender,
        this.address,
        this.phoneNumber,
        this.photo,
        this.telephoneNumber,
        this.gPA,
        this.birthday,
        this.nationality,
        this.bio,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.gradeId,
        this.sectionId,
        this.parentId});

  Childrens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    motherLastName = json['mother_last_name'];
    gender = json['gender'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    photo = json['photo'];
    telephoneNumber = json['telephone_number'];
    gPA = json['GPA'];
    birthday = json['birthday'];
    nationality = json['nationality'];
    bio = json['bio'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    gradeId = json['gradeId'];
    sectionId = json['sectionId'];
    parentId = json['parentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['father_name'] = this.fatherName;
    data['mother_name'] = this.motherName;
    data['mother_last_name'] = this.motherLastName;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['photo'] = this.photo;
    data['telephone_number'] = this.telephoneNumber;
    data['GPA'] = this.gPA;
    data['birthday'] = this.birthday;
    data['nationality'] = this.nationality;
    data['bio'] = this.bio;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['userId'] = this.userId;
    data['gradeId'] = this.gradeId;
    data['sectionId'] = this.sectionId;
    data['parentId'] = this.parentId;
    return data;
  }
}
