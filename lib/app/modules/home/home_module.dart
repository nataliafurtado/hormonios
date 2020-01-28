//import 'package:Projeto02/app/modules/hormonios/novo_hormonio_controller.dart';
import 'package:Projeto02/app/modules/hormonio/hormonio_controller.dart';
import 'package:Projeto02/app/modules/hormonio/hormonio_module.dart';
import 'package:Projeto02/app/modules/hormonio/novo_hormonio_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Projeto02/app/modules/home/home_page.dart';
//import 'package:Projeto02/app/modules/hormonios/hormonios_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //   Bind((i) => HormonioController()),
        // Bind((i) => HormonioController()),
      ];

  @override
  List<Router> get routers => [
        //  Router('/novo', module: HormonioModule()),
        //  Router('/teste', child: (_, args) => Teste()),
        Router('/novohormonio', module: HormonioModule()),
        Router('/novohormonio', child: (_, args) => NovoHormonioPage()),
        Router('/',
            child: (_, args) => HomePage(
                  aba: 0,
                  mostraPiramideAdm: true,
                  novoUsuario: false,
                )),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
