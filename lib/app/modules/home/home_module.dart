import 'package:flutter_modular/flutter_modular.dart';
import 'package:Projeto02/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router('/',
            child: (_, args) => AbaUi(
                  aba: 0,
                  mostraPiramideAdm: true,
                  novoUsuario: false,
                )),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
