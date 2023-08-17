class GetYearsModel {
  String? message;
  List<String>? years;

  GetYearsModel({this.message, this.years});

  GetYearsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    years = json['years'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['years'] = this.years;
    return data;
  }
}
