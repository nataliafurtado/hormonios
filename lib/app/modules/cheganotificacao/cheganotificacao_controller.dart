// import 'package:Projeto02/app/helpers/dp_helper.dart';
// import 'package:mobx/mobx.dart';
// import 'package:Projeto02/app/models/notificacao.dart';

// import 'package:Projeto02/app/models/avisos_status.dart';
// part 'cheganotificacao_controller.g.dart';

// class CheganotificacaoController = _CheganotificacaoControllerBase
//     with _$CheganotificacaoController;

// abstract class _CheganotificacaoControllerBase with Store {
//   DBHelper _db = DBHelper();

//   @observable
//   Notificacao notificacao;

//   void carregaNotificacao(String idNot) async {
//     // await Notifications.carregaNotificacao(idNot);
//     //  erro na logica .. quando tem mais aviso estatus no memso hora só mandar uma
//     //  ,, ou mandar duas mas descarregar a aoutra quando carregar analisar  melhor
//     // avisoStatus = await _db.getAvisoStatus(int.parse(idNot));
//     notificacao = await _db.getNotificacaoId(idNot);
//   }
// }
