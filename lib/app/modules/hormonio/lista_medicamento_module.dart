import 'package:Projeto02/app/modules/hormonio/lista_homonios_controller.dart';
import 'package:Projeto02/app/modules/hormonio/lista_homonios_controller.dart';
import 'package:Projeto02/app/modules/hormonio/lista_medicamento_page.dart';
import 'package:Projeto02/app/modules/hormonio/medicamento_page.dart';
import 'package:Projeto02/app/modules/hormonio/novo_hormonio_page.dart';
import 'package:Projeto02/app/modules/hormonio/novo_medicamento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListaMedicamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ListaHomoniosController()),
        Bind((i) => NovoMedicamentoController()),

        // Bind((i) => HormonioController()),
      ];

  @override
  List<Router> get routers => [
        Router('/listaMedicamentos',
            child: (_, args) => ListaMedicamentoPage()),

        // Router('/novohormonio', child: (_, args) => NovoHormonioPage()),
        //Router('/', module: ListaMedicamentoModule()),
        // Router('/', child: (_, args) => NovoHormonioPage()),
        // Router('/novohormonio', module: ListaMedicamentoModule()),
        // Router('/novohormonio', child: (_, args) => NovoHormonioPage()),
      ];

  static Inject get to => Inject<ListaMedicamentoModule>.of();
}
