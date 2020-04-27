import 'dart:developer';

import 'package:Projeto02/app/helpers/gerar_notificacoes.dart';
import 'package:Projeto02/app/helpers/notifications.dart';
import 'package:Projeto02/app/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // INICIAR NOTIFICACOES
    Notifications();
    // GerarNotificacoes();
    return

        // MultiProvider(
        //   providers: [
        //     Provider<Controller>(
        //       create: (_) => Controller(),
        //     ),
        //     Provider<HormoniosController>(
        //       create: (_) => HormoniosController(),
        //     ),
        //     Provider<NovoHormonioController>(
        //       create: (_) => NovoHormonioController(),
        //     ),
        //   ],
        //   child:

        MaterialApp(
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   const Locale('pt', 'BR'), // English
      // ],
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: blueTrans),
      initialRoute: '/calendario',
      onGenerateRoute: Modular.generateRoute,
    )
        // )
        ;
  }
}
