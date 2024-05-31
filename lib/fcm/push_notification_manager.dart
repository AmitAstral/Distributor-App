import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance = PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'customer_channel',
    'Customer Update',
    description: 'channel_description',
    importance: Importance.max,
    playSound: true,
    enableVibration: true,
  );

  Future<void> init() async {
    Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });

    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (Platform.isIOS) {
      await Future.delayed(const Duration(seconds: 1), () {
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            );
      });
    } else {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _firebaseMessaging.getToken().then((String? token) {
      storage.fcmToken = token ?? '';
      debugPrint('Push Messaging token: ${storage.fcmToken}');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      AppleNotification? apple = message.notification?.apple;
      if (notification != null && android != null) {
        if (storage.fcmToken.isEmpty) return;
        _showNotificationWithDefaultSound(message);
      }
    });

    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      debugPrint('====================initialMessage=======================');
      printRemoteMessage(initialMessage);
      updateNavigation(initialMessage.data);
    }

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('====================onMessageOpenedApp=======================');
      printRemoteMessage(message);
      updateNavigation(message.data);
    });

    var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = const DarwinInitializationSettings();
    var platform = new InitializationSettings(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.initialize(
      platform,
      onDidReceiveNotificationResponse: (notificationDetails) {
        debugPrint('====================onSelectNotification=======================');
        debugPrint(notificationDetails.payload);
        updateNavigation(jsonDecode(notificationDetails.payload!));
        /*return Future.value(jsonDecode(payload));*/
      },
    );
  }

  Future _showNotificationWithDefaultSound(RemoteMessage payload) async {
    var notification = payload.notification;
    final bitMap = await _downloadAndSaveFile(notification?.android?.imageUrl ?? '');

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'customer_channel${DateTime.now()}',
      'Channel Name',
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.high,
      autoCancel: true,
      ongoing: false,
      styleInformation: bitMap == null
          ? null
          : BigPictureStyleInformation(
              bitMap,
            ),
      playSound: true,
      enableVibration: true,
      largeIcon: bitMap,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    var data = payload.data;
    debugPrint('====================_showNotificationWithDefaultSound=======================');
    printRemoteMessage(payload);
    await flutterLocalNotificationsPlugin.show(
      0,
      notification?.title,
      notification?.body,
      platformChannelSpecifics,
      payload: jsonEncode(payload.data),
    );
  }

  Future<FilePathAndroidBitmap?> _downloadAndSaveFile(String url) async {
    if (url.isEmpty) return null;

    final Directory directory = await getTemporaryDirectory();
    final String filePath = '${directory.path}/${url.split('/').lastOrNull}';
    await apiService.download(url: url, filePath: filePath);

    return FilePathAndroidBitmap(filePath);
  }
}

void updateNavigation(Map data) {
  debugPrint('===============updateNavigation=================');
  debugPrint(jsonEncode(data));

  if (storage.fcmToken.isEmpty) return;
  //Add navigation
}

void printRemoteMessage(RemoteMessage message) {
  debugPrint('Notification_TITLE: ${jsonEncode(message.notification?.title)}');
  debugPrint('Notification_BODY: ${jsonEncode(message.notification?.body)}');
  debugPrint('Data: ${jsonEncode(message.data)}');
}

/*
It must not be an anonymous function.
It must be a top-level function (e.g. not a class method which requires initialization).
*/
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  debugPrint('Handling a background message ${message.messageId}');
  updateNavigation(message.data);
}
