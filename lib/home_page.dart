import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

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

    //Terminated State
    FirebaseMessaging.instance.getInitialMessage().then((event){
      if (event != null) {
        setState(() {
        notification = "${event.notification!.title} ${event.notification!.body} I am comming from Terminated state";
      }); 
      }
    });

    //Forground State
    FirebaseMessaging.onMessage.listen((event)
    {
      setState(() {
        notification = "${event.notification!.title} ${event.notification!.body} I am comming from forground";
      });
    }); 

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