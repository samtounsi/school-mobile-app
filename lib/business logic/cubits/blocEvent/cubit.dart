import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocEvent/state.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_schoolapp/data/models/send_add_event_teacher.dart';

import '../../../data/models/get_events_model_success.dart';
import '../../../presentation/components and constants/constants.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(InitialEventState());

  static EventCubit get(context) => BlocProvider.of(context);
  List<EventGetSuccessModel>? event;

  void getListEvent(int id) async {
    emit(EventLoadingState());
    try {
      var result = await http.get(
          Uri.parse(
              'https://new-school-management-system.onrender.com/mob/show_events/$id'),
          headers: {
            'Accept': '*/*',
            'Authorization': 'Bearer $token',
          });
      print(result.body);
      final Map<String, dynamic> json = jsonDecode(result.body);
      print(json);
      if (result.statusCode == 201) {
        event = (json['events'] as List)
            .map((e) => EventGetSuccessModel.fromJson(e))
            .toList();
        emit(EventSuccessState(event!));
      } else {
        throw Exception(json['message'] ?? "an error");
      }
    } catch (e) {
      emit(EventErrorState(errorEvent: e.toString()));
    }
  }

  void addEventTeacher(AddEventTeacherModel addEventTeacher) async {
    emit(AddEventLoadingState());
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://new-school-management-system.onrender.com/mob/add_event'),
      );
      request.fields.addAll({
        'title': addEventTeacher.title,
        'description': addEventTeacher.description,
        'event_date': addEventTeacher.eventDate,
        'event_time': addEventTeacher.eventTime,
        'userId': addEventTeacher.userId.toString()
      });
      request.headers.addAll({
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
        'Content-type': 'multipart/form-data'
      });
      final response = await request.send();
      var responseString = await response.stream.bytesToString();
      final myResponse = http.Response(responseString, response.statusCode);
      final json = jsonDecode(myResponse.body);
      print(json);
      print(response.statusCode);
      if (response.statusCode == 201) {
        emit(AddEventSuccessState());
      }
    } catch (e) {
      emit(AddEventErrorState(errorAddEvent: e.toString()));
    }
  }

  Future<void> deleteEventTeacher(int idEvent) async {
    emit(DeleteEventLoadingState());
    try {
      var response = await http.delete(
          Uri.parse(
              'https://new-school-management-system.onrender.com/mob/delete_event/$idEvent'),
          headers: {
            'Accept': '*/*',
            'Authorization': 'Bearer $token',
          });
      print(response.body);
      print(response.statusCode);
      final json = jsonDecode(response.body);
      if (response.statusCode == 201) {
        emit(DeleteEventSuccessState());
      } else {
        throw Exception(json['message'] ?? "an error");
      }
    } catch (e) {
      emit(DeleteEventErrorState(errorDeleteEvent: e.toString()));
    }
  }

  void sendNotification(String title, String body, String topic) async {
    emit(NotiLoadingState());
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://new-school-management-system.onrender.com/send_notifications'));
    request.fields.addAll({
      'title': title,
      'body': body,
      'topic': topic,
    });
    request.headers.addAll({
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
      'Content-type': 'multipart/form-data'
    });
    final response = await request.send();
    if (response.statusCode == 200) {
      var message = jsonDecode(await response.stream.bytesToString())['message']
          .toString();
      print('$message $topic');
      emit(NotiSuccessState(message));
    } else {
      var error = jsonDecode(await response.stream.bytesToString())['message']
          .toString();
      print('$error $topic');
      emit(NotiErrorState(error));
    }
  }
}
