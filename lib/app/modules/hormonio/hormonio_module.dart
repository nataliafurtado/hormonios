import 'package:Projeto02/app/modules/hormonio/hormonio_controller.dart';
import 'package:Projeto02/app/modules/hormonio/novo_hormonio_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HormonioModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => ListaHomoniosController()),
        Bind((i) => HormonioController()),
      ];

  @override
  List<Router> get routers => [
        //  Router('/teste', module: HormonioModule()),
        Router('/', child: (_, args) => NovoHormonioPage()),
      ];

  static Inject get to => Inject<HormonioModule>.of();
}
