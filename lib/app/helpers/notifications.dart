import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  Notifications() {
    iniciarConfiguracoes();
  }

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static void iniciarConfiguracoes() async {
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  static Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SecondScreen(payload)),
    // );
  }

  static Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      // context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              // await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => SecondScreen(payload),
              //   ),
              // );
            },
          )
        ],
      ),
    );
  }

  static void notificaPorPushS() async {
    log('33333');

    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 20));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'hormonios1',
      'hormonios',
      'your channel description',
    );
    // importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
      1,
      'plain ssss',
      'plain ssssssss',
      // RepeatInterval.EveryMinute,
      scheduledNotificationDateTime,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  static void notificaPorPushSP() async {
    log('33333');

    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 20));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'hormonios1',
      'hormonios',
      'your channel description',
    );
    // importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'plain minuto',
      'plain mnuto',
      RepeatInterval.EveryMinute,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  static void notificaPorPushN() async {
    log('33333');

    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 20));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'hormonios1',
      'hormonios',
      'your channel description',
    );
    // importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      1,
      'plain title',
      'plain body',
      // RepeatInterval.EveryMinute,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  static void pending() async {
    List<PendingNotificationRequest> pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    for (var item in pendingNotificationRequests) {
      log(item.title);
      log(item.id.toString());
    }
  }
}
