import 'package:Projeto02/app/modules/calendario/calendario_controller.dart';
import 'package:Projeto02/app/modules/hormonio/lista_homonios_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Projeto02/app/modules/home/home_page.dart';
import 'package:Projeto02/app/modules/hormonio/medicamento_page.dart';

//import 'package:Projeto02/app/modules/hormonios/hormonios_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => MedicamentoController()),
        Bind((i) => ListaHomoniosController()),
        Bind((i) => CalendarioController()),
      ];

  @override
  List<Router> get routers => [
        //  Router('/medicamento/id', module: MedicamentoModule()),
        Router('/', child: (_, args) => HomePage()),
        Router('/medicamento', child: (_, args) => MedicamentoPage()),

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

  static Inject get to => Inject<HomeModule>.of();
}
