import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobile_schoolapp/main.dart';
import 'package:mobile_schoolapp/presentation/animations/studentMotion.dart';
import 'package:mobile_schoolapp/presentation/animations/teacherMotion.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('title :  ${message.notification?.title}');
  print('body :  ${message.notification?.body}');
  print('payload :  ${message.data}');
}

void handleMessage(RemoteMessage? message) {
  if (message == null) return;
  //key.currentState?.pushNamedAndRemoveUntil('to-event', (route) => false,
      //arguments: message);
}

Future initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
}
String? fCMToken;
class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
     fCMToken = await _firebaseMessaging.getToken();
    print('Token : $fCMToken');
    initPushNotifications();
  }
}
