import 'package:mobx/mobx.dart';

part 'cheganotificacao_controller.g.dart';

class CheganotificacaoController = _CheganotificacaoControllerBase
    with _$CheganotificacaoController;

abstract class _CheganotificacaoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
