import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../routes/routes.dart';
import '../widgets/confirm_button.dart';

class FirebaseMessagingService {
  Future<void> requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    //for iOS Foreground
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  Future<void> setUpFullNotification() async {
    //----For Local Notification
    //---when user tap to Notification,this method is called.
    void onDidReceiveNotificationResponse(
        NotificationResponse notificationResponse) async {
      log("======User Pressed Notification======");
      /* String? notId = notificationResponse.payload;
      if (notId.validate().isNotEmpty) {
        BookingDetailScreen(bookingId: notId.toString().toInt())
            .launch(navigatorKey.currentContext!);
      } */
      final payload = notificationResponse.payload;
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
      if (payload == homeScreen) {
        await Get.toNamed(homeScreen);
      } else {
        await Get.toNamed(enrollmentScreen);
      }
    }

    //---Intilization to Show Local Notification
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(onDidReceiveLocalNotification: null);
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
    void showNotification(RemoteMessage message) async {
      var androidDetails = AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        color: Color(0xFF0f90f3),
      );
      var iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );
      var generalNotificationDetails =
          NotificationDetails(android: androidDetails, iOS: iosDetails);
      await flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title ?? '',
          message.notification!.body ?? '',
          generalNotificationDetails,
          payload: message.data["route"]);
    }

    //for foreground notification listen
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (message.data["route"] == homeScreen) {
        //If user increase point
        Get.defaultDialog(
          title: "Congratulations 😚",
          titleStyle: const TextStyle(color: Colors.black),
          content: Text(
            "Your form is confirmed by admin\n"
            "${message.notification!.body}",
            style: const TextStyle(color: Colors.black),
          ),
          onConfirm: () => Get.back(),
          confirm: confirmButton(),
          confirmTextColor: Colors.white,
          barrierDismissible: false,
          buttonColor: Colors.transparent,
          radius: 10,
        );
      }
      showNotification(message);
    });

    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    /*  if (notification != null) {
        log("============Notificatin received=====");
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              sound: RawResourceAndroidNotificationSound('noti'),
              // other properties...
            ),
          ),
          /* payload: message.data["bookingId"], */
        );
      } */
    /* }); */

    //----SetUp for Backgorund,Terminated State Notification---//

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (!(initialMessage == null)) {
      showNotification(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp
        .listen((data) => showNotification(data));
  }
}
