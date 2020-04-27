import 'package:Projeto02/app/modules/tomarmedicamento/cheganotificacao_page.dart';
import 'package:Projeto02/app/modules/tomarmedicamento/tomarmedicamento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Projeto02/app/modules/tomarmedicamento/tomarmedicamento_page.dart';

class TomarmedicamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TomarmedicamentoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => TomarmedicamentoPage()),
        Router(Modular.initialRoute,
            child: (_, args) => CheganotificacaoPage()),
      ];

  static Inject get to => Inject<TomarmedicamentoModule>.of();
}
