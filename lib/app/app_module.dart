// import 'package:Projeto02/app/modules/hormonios/hormonios_controller.dart';
// import 'package:Projeto02/app/modules/hormonios/novo_hormonio_controller.dart';
//import 'package:Projeto02/app/modules/hormonios/hormonios_page.dart';
import 'package:Projeto02/app/modules/cheganotificacao/cheganotificacao_page.dart';
import 'package:Projeto02/app/modules/hormonio/hormonio_module.dart';
import 'package:Projeto02/app/modules/hormonio/novo_hormonio_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:Projeto02/app/app_widget.dart';
import 'package:Projeto02/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        //   Bind((i) => HormoniosController()),
        //   Bind((i) => NovoHormonioController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          module: HomeModule(),
        ),

        //
        Router('/novohormonio', module: HormonioModule()),
        Router('/novohormonio', child: (_, args) => NovoHormonioPage()),
        Router('/cheganotificacao', child: (_, args) => CheganotificacaoPage()),
        //   Router('/novohormonio', child: (_, args) => NovoHormonioPage()),
        //    Router('/', module: MedicamentoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
