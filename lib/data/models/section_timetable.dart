class SectionTimetable {
  int? exist;
  List<DaysLessons>? daysLessons;
  String? arabicTeacher;
  String? englishTeacher;
  String? frenchTeacher;
  String? mathTeacher;
  String? physicsTeacher;
  String? chemistryTeacher;
  String? artTeacher;
  String? musicTeacher;
  String? sportsTeacher;
  String? socialTeacher;
  String? cultureTeacher;
  String? religionTeacher;
  String? philosophyTeacher;
  String? scienceTeacher;
  String? technologyTeacher;
  String? message;

  SectionTimetable(
      {this.exist,
        this.daysLessons,
        this.arabicTeacher,
        this.englishTeacher,
        this.frenchTeacher,
        this.mathTeacher,
        this.physicsTeacher,
        this.chemistryTeacher,
        this.artTeacher,
        this.musicTeacher,
        this.sportsTeacher,
        this.socialTeacher,
        this.cultureTeacher,
        this.religionTeacher,
        this.philosophyTeacher,
        this.scienceTeacher,
        this.technologyTeacher,
        this.message});

  SectionTimetable.fromJson(Map<String, dynamic> json) {
    exist = json['exist'];
    if (json['daysLessons'] != null) {
      daysLessons = <DaysLessons>[];
      json['daysLessons'].forEach((v) {
        daysLessons!.add(new DaysLessons.fromJson(v));
      });
    }
    arabicTeacher = json['arabicTeacher'];
    englishTeacher = json['englishTeacher'];
    frenchTeacher = json['frenchTeacher'];
    mathTeacher = json['mathTeacher'];
    physicsTeacher = json['physicsTeacher'];
    chemistryTeacher = json['chemistryTeacher'];
    artTeacher = json['artTeacher'];
    musicTeacher = json['musicTeacher'];
    sportsTeacher = json['sportsTeacher'];
    socialTeacher = json['socialTeacher'];
    cultureTeacher = json['cultureTeacher'];
    religionTeacher = json['religionTeacher'];
    philosophyTeacher = json['philosophyTeacher'];
    scienceTeacher = json['scienceTeacher'];
    technologyTeacher = json['technologyTeacher'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exist'] = this.exist;
    if (this.daysLessons != null) {
      data['daysLessons'] = this.daysLessons!.map((v) => v.toJson()).toList();
    }
    data['arabicTeacher'] = this.arabicTeacher;
    data['englishTeacher'] = this.englishTeacher;
    data['frenchTeacher'] = this.frenchTeacher;
    data['mathTeacher'] = this.mathTeacher;
    data['physicsTeacher'] = this.physicsTeacher;
    data['chemistryTeacher'] = this.chemistryTeacher;
    data['artTeacher'] = this.artTeacher;
    data['musicTeacher'] = this.musicTeacher;
    data['sportsTeacher'] = this.sportsTeacher;
    data['socialTeacher'] = this.socialTeacher;
    data['cultureTeacher'] = this.cultureTeacher;
    data['religionTeacher'] = this.religionTeacher;
    data['philosophyTeacher'] = this.philosophyTeacher;
    data['scienceTeacher'] = this.scienceTeacher;
    data['technologyTeacher'] = this.technologyTeacher;
    data['message'] = this.message;
    return data;
  }
}

class DaysLessons {
  String? day;
  String? first;
  String? second;
  String? third;
  String? fourth;
  String? fifth;
  String? sixth;

  DaysLessons(
      {this.day,
        this.first,
        this.second,
        this.third,
        this.fourth,
        this.fifth,
        this.sixth});

  DaysLessons.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    first = json['first'];
    second = json['second'];
    third = json['third'];
    fourth = json['fourth'];
    fifth = json['fifth'];
    sixth = json['sixth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['first'] = this.first;
    data['second'] = this.second;
    data['third'] = this.third;
    data['fourth'] = this.fourth;
    data['fifth'] = this.fifth;
    data['sixth'] = this.sixth;
    return data;
  }
}
