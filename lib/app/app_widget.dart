import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    )
        // )
        ;
  }
}
