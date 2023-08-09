class GetStudentsModel {
  List<String>? students;
  String? message;

  GetStudentsModel({this.students, this.message});

  GetStudentsModel.fromJson(Map<String, dynamic> json) {
    students = json['students'].cast<String>();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['students'] = this.students;
    data['message'] = this.message;
    return data;
  }
}
