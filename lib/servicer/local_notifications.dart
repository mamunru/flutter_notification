import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService
{
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initilize(){
    final InitializationSettings initializationSettings = InitializationSettings(android: AndroidInitializationSettings("DefaultIcon")); 
  }
}