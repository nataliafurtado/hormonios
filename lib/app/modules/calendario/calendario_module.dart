import 'package:Projeto02/app/modules/calendario/calendario_controller.dart';
import 'package:Projeto02/app/modules/calendario/calendario_page.dart';
import 'package:Projeto02/app/modules/cheganotificacao/cheganotificacao_controller.dart';
import 'package:Projeto02/app/modules/home/controller.dart';
import 'package:Projeto02/app/modules/hormonio/lista_medicamento_module.dart';
import 'package:Projeto02/app/modules/hormonio/lista_homonios_controller.dart';
import 'package:Projeto02/app/modules/hormonio/lista_medicamento_page.dart';
import 'package:Projeto02/app/modules/hormonio/novo_hormonio_page.dart';
import 'package:Projeto02/app/modules/tomarmedicamento/tomarmedicamento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Projeto02/app/modules/home/home_page.dart';
import 'package:Projeto02/app/modules/hormonio/medicamento_page.dart';

//import 'package:Projeto02/app/modules/hormonios/hormonios_module.dart';

class CalendarioModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => ListaHomoniosController()),
        Bind((i) => CalendarioController()),
        //Bind((i) => ListaHomoniosController()),
        // Bind((i) => CheganotificacaoController()),
        // Bind((i) => TomarmedicamentoController()),
      ];

  @override
  List<Router> get routers => [
        //  Router('/medicamento/id', module: MedicamentoModule()),
        Router('/calendario', child: (_, args) => CalendarioPage()),
        //Router('/medicamento', child: (_, args) => MedicamentoPage()),
        // Router('/listaMedicamentos',
        //     child: (_, args) => ListaMedicamentoPage()),
        //Router('/listaMedicamentos', module: ListaMedicamentoModule()),
        //
        //   Router('/novohormonio', module: HormonioModule()),
        //   Router('/novohormonio', child: (_, args) => NovoHormonioPage()),
        //
        // Router(
        //   '/medicamento/:id',
        //   child: (_, args) => MedicamentoPage(
        //     id: args.params['id'],
        //   ),
        // ),
//
        // Router('/calendario', child: (_, args) => CalendarioPage()),
        // Router('/novohormonio', module: HormonioModule()),
      ];

  static Inject get to => Inject<CalendarioModule>.of();
}
