//this model for response api get event
class EventGetSuccessModel {
  final int id;
  final String eventTime;
  final String eventDate;
  final String title;
  final String description;
  final String createdAt;
  final String updatedAt;
  final int userId;

  EventGetSuccessModel(
      {required this.id,
      required this.eventTime,
      required this.eventDate,
      required this.title,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      required this.userId});

  factory EventGetSuccessModel.fromJson(Map<String, dynamic> json) {
    return EventGetSuccessModel(
        id: json['id'],
        eventTime: json['event_time'],
        eventDate: json['event_date'],
        title: json['title'],
        description: json['description'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        userId: json['userId']);

  }
}
