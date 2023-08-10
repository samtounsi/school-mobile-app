//this api for get list of string
class GetSectionTeacherModel {
  final List<String> section;

  GetSectionTeacherModel({required this.section});

  factory GetSectionTeacherModel.fromJson(Map<String, dynamic> json) {
    return GetSectionTeacherModel(
        section: (json['sections'] as List).map((e) => e.toString()).toList());
  }
}
