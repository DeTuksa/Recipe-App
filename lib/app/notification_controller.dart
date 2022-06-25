import 'package:daisy_recipe/app/data/services/user_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import 'data/models/push_notification_model.dart';

class NotificationController extends GetxController {

  late final FirebaseMessaging firebaseMessaging;
  // late int totalNotifications;
  FCMPushNotification? notification;
  String? fcmToken;
  final FlutterLocalNotificationsPlugin localNotificationsPlugin = FlutterLocalNotificationsPlugin();
  AndroidNotificationChannel androidChannel = const AndroidNotificationChannel(
      'Matador Push Notification',
      'Important Matador Push Notification',
      importance: Importance.high
  );

  @override
  void onInit() {
    registerLocalNotification();
    registerNotification();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> registerLocalNotification() async {
    await localNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);
    localNotificationsPlugin.initialize(const InitializationSettings(
        android: AndroidInitializationSettings('mipmap/ic_launcher')
    ));
  }

  //register notification
  Future<void> registerNotification() async {
    await Firebase.initializeApp();

    firebaseMessaging = FirebaseMessaging.instance;

    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized ) {
      print('User granted the permission');
      firebaseMessaging.setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true
      );
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        notification = FCMPushNotification(
            title: message.notification!.title!,
            body: message.notification!.body!
        );

        RemoteNotification? remoteNot = message.notification;
        AndroidNotification? android = message.notification?.android;
        update();
        // totalNotifications ++;
        if (remoteNot != null) {
          showSimpleNotification(
              Text(
                message.notification!.title!,
              ),
              subtitle: Text(
                  message.notification!.body!
              )
          );
        } if (remoteNot != null && android != null) {
          localNotificationsPlugin.show(
              remoteNot.hashCode,
              remoteNot.title,
              remoteNot.body,
              NotificationDetails(
                  android: AndroidNotificationDetails(
                      androidChannel.id,
                      androidChannel.name,
                      channelDescription: androidChannel.description,
                      icon: android.smallIcon
                  )
              )
          );
        }
      });
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        notification = FCMPushNotification(
            title: message.notification!.title!,
            body: message.notification!.body!
        );
        RemoteNotification? remoteNot = message.notification;
        AndroidNotification? android = message.notification?.android;
        update();
        // totalNotifications ++;
        if (notification != null) {
          showSimpleNotification(
              Text(
                message.notification!.title!,
              ),
              subtitle: Text(
                  message.notification!.body!
              )
          );
        }
        if (remoteNot != null && android != null) {
          localNotificationsPlugin.show(
              remoteNot.hashCode,
              remoteNot.title,
              remoteNot.body,
              NotificationDetails(
                  android: AndroidNotificationDetails(
                      androidChannel.id,
                      androidChannel.name,
                      channelDescription: androidChannel.description,
                      icon: android.smallIcon
                  )
              )
          );
        }
      });
    }
    saveDeviceToken();

  }

  saveDeviceToken() async {
    fcmToken = await firebaseMessaging.getToken();
    print(fcmToken);
    await UserService().updatePushNotificationId(registrationToken: fcmToken!).then((value) {
      print(value.data['message']);
    });
  }
}