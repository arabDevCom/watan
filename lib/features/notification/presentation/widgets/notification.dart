import 'dart:async';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

import 'notificationlisten.dart';

class PushNotificationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  // StreamController<String> streamController = StreamController<String>.broadcast();

  late AndroidNotificationChannel channel;
  // late ChatModel chatModel;
  // late MessageModel messageDataModel;
  // final BehaviorSubject<String> behaviorSubject = BehaviorSubject();
  // final BehaviorSubject<ChatModel> behaviorchat = BehaviorSubject();
  // final BehaviorSubject<MessageModel> behaviormessage = BehaviorSubject();

  void callbackground() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future initialise() async {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: await ondidnotification);
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: notificationTapBackground);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      checkData(message);
      //showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Got a message whilstt in the foreground!');
      print('Message data: ${message.data}');

//  showNotification(message);
      checkData(message);
    });
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message:");

    if (message.data.isNotEmpty) {
      print("Handling a background message: ${message.data}");
      checkData(message);
    }
    // showNotification(message);
  }

  void showNotification(RemoteMessage message) {
    flutterLocalNotificationsPlugin.show(
        message.data.hashCode,
        message.data['title'],
        message.data['body'],
        payload: 'chat',
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                importance: Importance.max,
                icon: '@mipmap/ic_launcher')));
  }

  void checkData(RemoteMessage message) {
    if (message.data['note_type'].toString().contains("chat")) {
    //  if(navigatorKey.currentState!.widget.initialRoute!=AppConstant.pageChatRoute){




      // chatModel = ChatModel.fromJson(jsonDecode(message.data['room']));
      // messageDataModel =
      //     MessageModel.fromJson(jsonDecode(message.data['data']));
      // final notification = LocalNotification("data", MessageModel.toJson(messageDataModel));


      // behaviorchat.add(chatModel);
      // behaviorSubject.add("chat");
    //  behaviormessage.add(messageDataModel);
     // print("sslsllslsl${navigatorKey.currentState}");
      showNotification(message);
      // NotificationsBloc.instance.newNotification(notification);
    //  print("dldkkdk${messageDataModel.type}");
      // if (ModalRoute.of(context)!
      //     .settings
      //     .name!
      //     .contains(AppConstant.pageChatRoute)) {
      //   //Navigator.of(context).pop();
      //   // context..addmessage(message.data['data']);
      // } else {

      //}
    } else {
      showNotification(message);
    }
  }

  Future notificationTapBackground(NotificationResponse details) async {
    print('notification payload: ${details.payload}');
    if (details.payload!.contains("chat")) {
      // behaviorSubject.add("chat");
      // streamController.add("chat");

    }
  }

  Future ondidnotification(
      int id, String? title, String? body, String? payload) async {
    print("object");
    //   streamController.add("chat");
    // behaviorSubject.add(payload!);
  }
}
