import 'dart:developer';

import 'package:Projeto02/app/helpers/gerar_notificacoes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
      debugPrint('notification payload gggg: ' + payload);
    }
    log('merda m,erda mar $payload');
    Modular.to.pushNamed('/cheganotificacao/$payload');
    // final controller = Controller();
    // Navigator.pop(context);gg
    // controller.mudarPaginaHormonios();
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SecondScreen(payload)),
    // );
  }

  static Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page

    log('entrou did receibe edef e');

//     showDialog(
// //context: context,
//       builder: (BuildContext context) => CupertinoAlertDialog(
//         title: Text(title),
//         content: Text(body),
//         actions: [
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: Text('Ok'),
//             onPressed: () async {
//               Navigator.of(context, rootNavigator: true).pop();
//               // await Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => SecondScreen(payload),
//               //   ),
//               // );
//             },
//           )
//         ],
//       ),
//     );
  }

  static Future<void> notificaPorPushSchedule(DateTime dia, int notId) async {
    //static Future<void> notificaPorPushSchedule() async {
    // var scheduledNotificationDateTime =
    //     DateTime.now().add(Duration(seconds: 3));

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
      notId,
      'AVISO TOMAR HORMONIO',
      'NÃO ESQUEÇA',
      dia,
      platformChannelSpecifics,
      payload: notId.toString(),
    );
    log('enviado ' + dia.toIso8601String());
  }

  static void refazerNotificaPorPushSchedule(DateTime dia, int notId) {
    cancel(notId);
    notificaPorPushSchedule(dia, notId);
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

  static Future<List<PendingNotificationRequest>> pending() async {
    List<PendingNotificationRequest> pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    for (var item in pendingNotificationRequests) {
      log(item.title + ' : ' + item.payload + ' :  id ' + item.id.toString());
      // log(item.id.toString());
    }
    return pendingNotificationRequests;
  }

  static Future<PendingNotificationRequest> carregaNotificacao(
      String idNot) async {
    List<PendingNotificationRequest> pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    for (var not in pendingNotificationRequests) {
      if (not.id == int.parse(idNot)) {
        return not;
      }
    }
    return null;
  }

  static void cancel(int i) {
    flutterLocalNotificationsPlugin.cancel(i);
  }

  static void cancelALL() {
    log('cancelALL');
    flutterLocalNotificationsPlugin.cancelAll();
  }

  static void refazerGerarNotificacoes() {
    log('refazerGerarNotificacoes');
    flutterLocalNotificationsPlugin.cancelAll();
    // GerarNotificacoes();
  }
}
