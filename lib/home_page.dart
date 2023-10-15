import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push/servicer/local_notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String notification = "Waitting for notification ";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //LocalNotificationService();

     FirebaseMessaging.instance.getInitialMessage()
    //  FirebaseMessaging.onMessage.listen((event) { 
    //   print(event.data);
    //  });

    //FirebaseMessaging.onMessage.listen(LocalNotificationService().showFlutterNotification);

    //Background State
    FirebaseMessaging.onMessageOpenedApp.listen((event) { 
      setState(() {
        notification = "${event.notification!.title} ${event.notification!.body} I am comming from Background";
      });
    });

    // 
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Push Notification"),
      ),
      body:  Center(
        child: Text(
          notification,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}