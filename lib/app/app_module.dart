// import 'package:Projeto02/app/modules/hormonios/hormonios_controller.dart';
// import 'package:Projeto02/app/modules/hormonios/novo_hormonio_controller.dart';
//import 'package:Projeto02/app/modules/hormonios/hormonios_page.dart';
import 'package:Projeto02/app/app_widget.dart';
import 'package:Projeto02/app/helpers/sql_teste.dart';
import 'package:Projeto02/app/modules/calendario/calendario_module.dart';
import 'package:Projeto02/app/modules/hormonio/lista_medicamento_module.dart';
import 'package:Projeto02/app/modules/hormonio/medicamento_page.dart';
import 'package:Projeto02/app/modules/hormonio/novo_hormonio_page.dart';
import 'package:Projeto02/app/modules/tomarmedicamento/cheganotificacao_page.dart';
import 'package:Projeto02/app/modules/tomarmedicamento/tomarmedicamento_controller.dart';
import 'package:Projeto02/app/modules/tomarmedicamento/tomarmedicamento_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        //   Bind((i) => HormoniosController()),
        //   Bind((i) => NovoHormonioController()),
        // Bind((i) => CheganotificacaoController()),
        Bind((i) => TomarmedicamentoController()),
        // Bind((i) => ListaHomoniosController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/calendario',
          module: CalendarioModule(),
        ),
        Router('/listaMedicamentos', module: ListaMedicamentoModule()),
        // Router('/listaMedicamentos',
        //     child: (_, args) => ListaMedicamentoPage()),
        //
        // Router('/novohormonio', module: HormonioModule()),
        Router('/novohormonio', child: (_, args) => NovoHormonioPage()),
        Router('/medicamento', child: (_, args) => MedicamentoPage()),
        // Router('/cheganotificacao', child: (_, args) => CheganotificacaoPage()),
        Router(
          '/cheganotificacao/:id',
          child: (_, args) => CheganotificacaoPage(
            id: args.params['id'],
          ),
        ),
        Router(
          '/tomarmedicacao/:id',
          child: (_, args) => TomarmedicamentoPage(
            id: args.params['id'],
          ),
        ),

        Router('/sql', child: (_, args) => SqlTeste()),
        //   Router('/novohormonio', child: (_, args) => NovoHormonioPage()),
        //    Router('/', module: MedicamentoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
