import 'package:mobile_schoolapp/data/models/get_events_model_success.dart';

abstract class EventState {}

class InitialEventState extends EventState {}

class EventSuccessState extends EventState {
  List<EventGetSuccessModel> events;
  EventSuccessState(this.events);
}

class EventLoadingState extends EventState {}

class EventErrorState extends EventState {
  final String errorEvent;
  EventErrorState({required this.errorEvent});
}

//AddEventState
class AddEventSuccessState extends EventState {}

class AddEventLoadingState extends EventState {}

class AddEventErrorState extends EventState {
  final String errorAddEvent;
  AddEventErrorState({required this.errorAddEvent});
}

//Delete event
class DeleteEventSuccessState extends EventState {}

class DeleteEventLoadingState extends EventState {}

class DeleteEventErrorState extends EventState {
  final String errorDeleteEvent;
  DeleteEventErrorState({required this.errorDeleteEvent});
}

//post notification
class NotiLoadingState extends EventState {}

class NotiSuccessState extends EventState {
  String mes;
  NotiSuccessState(this.mes);
}

class NotiErrorState extends EventState {
  String error;
  NotiErrorState(this.error);
}
